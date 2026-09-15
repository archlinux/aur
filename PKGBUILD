# Maintainer: zoltix <lli@lli.be>
# Contributor: Vamp898 <vamp898-aur@ikaros.space>
# Contributor: Bjoern Franke <bjo+aur@schafweide.org>
# Contributor: Anthony Wang <a at exozy dot me>
# Contributor: ny-a <nyaarch64 at gmail dot com>
# Contributor: Daniel Moch <daniel@danielmoch.com>
# Contributor: Jean Lucas <jean@4ray.co>
# Contributor: Fredrick Brennan <copypaste@kittens.ph>

pkgname=mastodon
pkgver=4.7.2
pkgrel=3
pkgdesc='Your self-hosted, globally interconnected microblogging community'
arch=(x86_64)
url='https://github.com/mastodon/mastodon'
license=(AGPL3)

depends=(
        corepack
        ffmpeg
        git
        libidn
        libpqxx
        libvips
        libheif
        libxml2
        libxslt
        libyaml
        # Mastodon 4.7.2: Node.js 26.8.2 causes Yarn 4.18.0 to crash
        # during the Link step. Node.js 24 LTS builds successfully.
        nodejs-lts-krypton
        postgresql
        protobuf
        ruby-bundler
        valkey
        zlib
        yarn-berry
)

backup=(etc/mastodon.conf)
install=mastodon.install
options=(!strip)

source=(
        "${pkgname}-${pkgver}.tar.gz::https://github.com/mastodon/mastodon/archive/v${pkgver}.tar.gz"
        mastodon.target
        mastodon.sysusers.d
        mastodon.tmpfiles.d
        devise_pam.patch
)

sha256sums=('658bb926521fdf5278afa9df76e4224dc2effa3732f60ac36e3b46c2ef4b34e8'
            'e9928ced31f6490476100f02f2e158e41a076988dd7f3dff8f21d245bc2bb0ff'
            '1b67693f7de5802a34985b9ac969497fc6e6042dcae0b8abf6595b9fe15ee80e'
            '3fdd54dd1f374b7206c8beaebafdf890e74d30385f0c93f9cd99e1e4be92f8fa'
            '8415cded8d5f159623439b8ab0a87c1ac653a32f6945eebc9140195289c1ece6')

prepare() {
  cd "mastodon-${pkgver}"
  patch -p1 < ../devise_pam.patch
}

build() {
  export COREPACK_ENABLE_DOWNLOAD_PROMPT=0
  cd "mastodon-${pkgver}"

  sed -i '/husky install/d' package.json

  bundle config set --local deployment true
  bundle config set --local without 'development test'
  bundle config set --local with 'pam_authentication'
  bundle config set --local build.google-protobuf \
                "-- --with-cflags='$(ruby -r rbconfig -e 'print RbConfig::CONFIG["CFLAGS"]' |
                        sed -e 's/-Werror=format-security//' -e 's/-flto=auto/-fno-lto/')' \
                --with-ldflags='$(ruby -r rbconfig -e 'print RbConfig::CONFIG["LDFLAGS"]' |
                        sed -e 's/-flto=auto/-fno-lto/')'"

  bundle config set --local frozen false
  bundle add erb

  BUNDLE_BUILD__CHARLOCK_HOLMES="--with-cxxflags=-std=c++17" \
                bundle install -j"$(getconf _NPROCESSORS_ONLN)"

  corepack enable --install-directory . yarn

  YARN_NETWORK_CONCURRENCY=8 \
                ./yarn install --immutable

  cd vendor/bundle/ruby/*/gems/ox-*/ext/ox
  make
  cp ox.so ../../lib

  cd "$srcdir/mastodon-${pkgver}"
  SECRET_KEY_BASE_DUMMY=1 \
                RAILS_ENV=production \
                bundle exec rails assets:precompile
}

package() {
  install -d "$pkgdir/var/lib" "$pkgdir/etc"
  cp -a "mastodon-${pkgver}" "$pkgdir/var/lib/mastodon"

  # Build/runtime caches must never become package-owned state.
  rm -rf "$pkgdir/var/lib/mastodon/tmp/cache"

  # Normalize metadata copied from the build tree.  Pacman should own the
  # application tree as root:root.  Runtime writable paths are handled by
  # mastodon.install and tmpfiles/sysusers.
  chown -R root:root "$pkgdir/var/lib/mastodon"

  # Some bundled gems ship/build directories with group/world write bits.
  # Do not package writable application-code directories.
  find "$pkgdir/var/lib/mastodon" -type d -perm /022 -exec chmod go-w {} +

  touch "$pkgdir/etc/mastodon.conf"

  ln -s /etc/mastodon.conf "$pkgdir/var/lib/mastodon/.env.production"
  ln -s /usr/bin/node "$pkgdir/var/lib/mastodon/node"

  install -Dm644 mastodon.target -t "$pkgdir/usr/lib/systemd/system"
  install -Dm644 mastodon.sysusers.d "$pkgdir/usr/lib/sysusers.d/mastodon.conf"
  install -Dm644 mastodon.tmpfiles.d "$pkgdir/usr/lib/tmpfiles.d/mastodon.conf"

  cd "mastodon-${pkgver}/dist"

  sed -e 's|home/mastodon/live|var/lib/mastodon|g' \
      -e 's|home/mastodon/.rbenv/shims|usr/bin|g' \
      -i mastodon-*.service

  sed -e 's|home/mastodon/live|var/lib/mastodon|g' -i nginx.conf

  install -Dm644 mastodon-*.service -t "$pkgdir/usr/lib/systemd/system"
}
