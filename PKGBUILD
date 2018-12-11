# Maintainer: Fredrick Brennan <copypaste@kittens.ph>
# Contributor: Jean Lucas <jean@4ray.co>

pkgname=mastodon
pkgver=2.6.5
pkgrel=1
pkgdesc='Free software social-network server based on ActivityPub and OStatus'
arch=(x86_64)
url=https://joinmastodon.org
license=(AGPL3)
depends=(ffmpeg
         imagemagick
         libidn
         libpqxx
         libxml2
         libxslt
         nodejs
         postgresql
         redis
         ruby-bundler
         protobuf
         yarn)
makedepends=(git npm python2)
conflicts=(mastodon-git)
backup=(etc/mastodon/environment)
install=mastodon.install
options=('!strip')
source=(https://github.com/tootsuite/mastodon/archive/v$pkgver.tar.gz
        mastodon-web.service
        mastodon-sidekiq.service
        mastodon-streaming.service
        mastodon.target)
sha512sums=('7ff73dfe9880851b85ca989572480816774db93312c1b6fea2667830dd24eb33c9a9dd25363214d2c8a1057ce7d20e8278853e165a130d2d18f02e102f458f2c'
            '532929aeeda9a0ccf72de0695a3381547cc389344e1e67f05ef1d7ce5c1ad57278b647423bb52d4a87069ad85479452533fbe3786e5e5c4b62730c6ef72ff267'
            '603a7877288c762855a29fd2399d3ff7d218a7f1b7d6378cad7f30048cdbfe2a13f2ed2b5c94cb683bdcaead8cd47243e564a2ae70d7f21fa33f295c5396f4f7'
            '90a0761b7709659bec6f29c366c503fdd348226cbb585cf4f6eaa065854e2027d08ab3b352eb13ad7c0e327d662f13bc00fb4163ea0c583ef55b1795ab2e0b31'
            'c9820c2a83d08bd5d842a78e924682db97ebd5c7291b682603ad30dafcdcc5816c13e717ad39554f042b9d9ed71ab902ce3f604952264a900a72612ee8060acb')

build() {
  cd mastodon-$pkgver
  bundle install --deployment --without development test
  yarn config set ignore-engines true
  yarn install --pure-lockfile
}

package() {
  install -d "$pkgdir"/{var/lib,etc/mastodon}
  cp -a mastodon-$pkgver "$pkgdir"/var/lib/mastodon
  ln -s /etc/mastodon/environment "$pkgdir"/var/lib/mastodon/.env
  touch "$pkgdir"/etc/mastodon/environment
  install -Dm 644 -t "$pkgdir"/usr/lib/systemd/system mastodon-{web,sidekiq,streaming}.service mastodon.target
}
