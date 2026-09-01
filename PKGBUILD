# Maintainer: zoltix <lli@lli.be>
# Contributor: Vamp898 <vamp898-aur@ikaros.space>
# Contributor: Bjoern Franke <bjo+aur@schafweide.org>
# Contributor: Anthony Wang <a at exozy dot me>
# Contributor: ny-a <nyaarch64 at gmail dot com>
# Contributor: Daniel Moch <daniel@danielmoch.com>
# Contributor: Jean Lucas <jean@4ray.co>
# Contributor: Fredrick Brennan <copypaste@kittens.ph>

pkgname=mastodon
pkgver=4.7.1
pkgrel=1
pkgdesc='Your self-hosted, globally interconnected microblogging community'
arch=(any)
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
        nodejs
        postgresql
        protobuf
        ruby-bundler
        sudo
        valkey
        zlib
        yarn-berry
)

backup=(etc/mastodon.conf)
install=mastodon.install
options=(!strip)

source=(
        "https://github.com/mastodon/mastodon/archive/v${pkgver}.tar.gz"
        mastodon.target
        mastodon.sysusers.d
        mastodon.tmpfiles.d
        devise_pam.patch
)

sha256sums=('4fe287ac3a22fa9e5848eac700333de84815ad18d2a5f5a2b567e5b12b648cfa'
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

        # Stop husky from hijacking git hooks
        sed -i '/husky install/d' package.json

        # Bundler configuration
        bundle config set --local deployment true
        bundle config set --local without 'development test'
        bundle config set --local with 'pam_authentication'

        # Disable LTO which breaks the C extension of the google-protobuf gem
        # https://github.com/protocolbuffers/protobuf/issues/11935
        bundle config set --local build.google-protobuf \
                "-- --with-cflags='$(ruby -r rbconfig -e 'print RbConfig::CONFIG["CFLAGS"]' |
                        sed -e 's/-Werror=format-security//' -e 's/-flto=auto/-fno-lto/')' \
                --with-ldflags='$(ruby -r rbconfig -e 'print RbConfig::CONFIG["LDFLAGS"]' |
                        sed -e 's/-flto=auto/-fno-lto/')'"

        # Mastodon modifies the bundle when adding erb during the package build
        bundle config set --local frozen false
        bundle add erb

        # charlock_holmes requires C++17 with recent GCC versions
        BUNDLE_BUILD__CHARLOCK_HOLMES="--with-cxxflags=-std=c++17" \
                bundle install -j"$(getconf _NPROCESSORS_ONLN)"

        # Install JavaScript dependencies
        corepack enable --install-directory . yarn
        ./yarn install --immutable

        # ox extension workaround
        # https://aur.archlinux.org/packages/mastodon?O=0#comment-986425
        cd vendor/bundle/ruby/*/gems/ox-*/ext/ox
        make
        cp ox.so ../../lib
}

package() {
        install -d \
                "$pkgdir/var/lib" \
                "$pkgdir/etc"

        cp -a "mastodon-${pkgver}" "$pkgdir/var/lib/mastodon"

        # Put the config file in /etc and link to it
        touch "$pkgdir/etc/mastodon.conf"
        ln -s /etc/mastodon.conf \
                "$pkgdir/var/lib/mastodon/.env.production"

        # Mastodon expects node to be available from its installation directory
        ln -s /usr/bin/node \
                "$pkgdir/var/lib/mastodon/node"

        # systemd target
        install -Dm644 mastodon.target \
                -t "$pkgdir/usr/lib/systemd/system"

        # systemd sysusers
        install -Dm644 mastodon.sysusers.d \
                "$pkgdir/usr/lib/sysusers.d/mastodon.conf"

        # systemd tmpfiles
        install -Dm644 mastodon.tmpfiles.d \
                "$pkgdir/usr/lib/tmpfiles.d/mastodon.conf"

        cd "mastodon-${pkgver}/dist"

        # Fix path discrepancies in upstream systemd services
        sed \
                -e 's|home/mastodon/live|var/lib/mastodon|g' \
                -e 's|home/mastodon/.rbenv/shims|usr/bin|g' \
                -i mastodon-*.service

        # Fix Mastodon path in nginx example configuration
        sed \
                -e 's|home/mastodon/live|var/lib/mastodon|g' \
                -i nginx.conf

        install -Dm644 mastodon-*.service \
                -t "$pkgdir/usr/lib/systemd/system"
}
