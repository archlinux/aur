# Maintainer: Daniel Moch <daniel@danielmoch.com>
# Contributor: Jean Lucas <jean@4ray.co>
# Contributor: Fredrick Brennan <copypaste@kittens.ph>

pkgname=mastodon
pkgver=3.1.2
pkgrel=1
pkgdesc='Self-hosted social media and network server based on ActivityPub and OStatus'
arch=(x86_64)
url=https://joinmastodon.org
license=(AGPL3)
depends=(ffmpeg
         imagemagick
         libidn
         libpqxx
         libxml2
         libxslt
         libyaml
         nodejs-lts-erbium
         postgresql
         redis
         ruby-bundler
         protobuf
         yarn
         zlib)
makedepends=(git)
backup=(etc/mastodon.conf)
install=mastodon.install
source=(https://github.com/tootsuite/mastodon/archive/v$pkgver.tar.gz
        mastodon.target
        mastodon.sysusers.d
        mastodon.tmpfiles.d)
sha512sums=('9c5e12fb0d46024d41f03f976a21cacf938285db93f1311a5bc2db1d703bc2ed675b39403fd87878a0632338c49bf88395c77d6809ad91b94bc6533f7d89e324'
            'c9820c2a83d08bd5d842a78e924682db97ebd5c7291b682603ad30dafcdcc5816c13e717ad39554f042b9d9ed71ab902ce3f604952264a900a72612ee8060acb'
            '4ee4210bde391e6dc782cb7c14f2cb968c95ad541aa0efcf843a811f8cc5f0d1067ee3c8346bb412aa9fd1dd5a8bd05a4524df7dc4a106957009853dd237074a'
            '73493680845e690d0cfd769fbbe68978c0a615602375078aea945ca1f1011404eb4b64972aec7a6e5efa720fb425d91b3f30025391c38ccf77e070ccb391e710')

prepare() {
  cd mastodon-$pkgver

  # Allow use of any bundler
  sed -i -e '/BUNDLED/,+1d' Gemfile.lock

  # Allow use of higher Node minor versions
  sed -i 's/"node": "/&^/' package.json

  # Fix `sidekiq-unique-jobs` 6.0.18 has been yanked
  sed -i 's/6\.0\.18/6\.0\.21/' Gemfile.lock
}

build() {
  cd mastodon-$pkgver
  bundle config set deployment 'true'
  bundle config set without 'development test'
  bundle install \
    -j$(getconf _NPROCESSORS_ONLN)
  yarn install --pure-lockfile
}

package() {
  install -d "$pkgdir"/{var/lib,etc}
  cp -a mastodon-$pkgver "$pkgdir"/var/lib/mastodon

  # Put the config file in /etc and link to it
  touch "$pkgdir"/etc/mastodon.conf
  ln -s /etc/mastodon.conf "$pkgdir"/var/lib/mastodon/.env.production
  ln -s /usr/bin/node "$pkgdir"/var/lib/mastodon/node

  install -Dm 644 mastodon.target -t "$pkgdir"/usr/lib/systemd/system
  install -Dm 644 mastodon.sysusers.d "$pkgdir"/usr/lib/sysusers.d/mastodon.conf
  install -Dm 644 mastodon.tmpfiles.d "$pkgdir"/usr/lib/tmpfiles.d/mastodon.conf

  cd mastodon-$pkgver/dist

  # Fix path discrepancies
  for f in mastodon-*.service; do
    sed -e '0,/home/s/home/var\/lib/' \
      -e 's/\/live//' \
      -e 's/=\/usr\/bin/=\/var\/lib\/mastodon/' \
      -e 's/home\/mastodon\/.rbenv\/shims/usr\/bin/' \
      -i $f
  done

  install -Dm 644 mastodon-*.service -t "$pkgdir"/usr/lib/systemd/system
}
