# Maintainer: Jean Lucas <jean@4ray.co>
# Contributor: Fredrick Brennan <copypaste@kittens.ph>

pkgname=mastodon
pkgver=2.8.0
_node=10.15.3
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
         nodejs
         postgresql
         redis
         ruby-bundler
         protobuf
         yarn)
makedepends=(npm)
conflicts=(mastodon-git)
backup=(etc/mastodon.conf)
install=mastodon.install
source=(https://github.com/tootsuite/mastodon/archive/v$pkgver.tar.gz
        https://nodejs.org/dist/v$_node/node-v$_node-linux-x64.tar.xz
        mastodon.target
        mastodon.sysusers.d
        mastodon.tmpfiles.d)
sha512sums=('247e5b8402b77d128fd990e251686237188305084c1893d77cdad20f265ce49750b1c2a10c9a40549d80406c37c4e515c763933ea01fb09f4e51d0a54965b6b0'
            '1348147885ecaa6c25a0e97a47f79ca5e44f1a0829d3cb0ebecf9db0be4a89f23c3b16fa572c4d0b5f5d0b2624a7b66ebd912ff12144fc5469f2f342124190c2'
            'c9820c2a83d08bd5d842a78e924682db97ebd5c7291b682603ad30dafcdcc5816c13e717ad39554f042b9d9ed71ab902ce3f604952264a900a72612ee8060acb'
            '4ee4210bde391e6dc782cb7c14f2cb968c95ad541aa0efcf843a811f8cc5f0d1067ee3c8346bb412aa9fd1dd5a8bd05a4524df7dc4a106957009853dd237074a'
            '73493680845e690d0cfd769fbbe68978c0a615602375078aea945ca1f1011404eb4b64972aec7a6e5efa720fb425d91b3f30025391c38ccf77e070ccb391e710')

prepare() {
  cd mastodon-$pkgver

  # Allow use of any bundler
  sed -i -e '/BUNDLED/,+1d' Gemfile.lock

  # Allow use of higher Node minor versions
  sed -i 's/"node": "/&^/' package.json
}

build() {
  cd mastodon-$pkgver
  bundle install \
    -j$(getconf _NPROCESSORS_ONLN) \
    --deployment --without development test
  yarn install --pure-lockfile
}

package() {
  install -d "$pkgdir"/{var/lib,etc}
  cp -a mastodon-$pkgver "$pkgdir"/var/lib/mastodon

  # Put the config file in /etc and link to it
  touch "$pkgdir"/etc/mastodon.conf
  ln -s /etc/mastodon.conf "$pkgdir"/var/lib/mastodon/.env.production
  
  # Add stable Node binary for use with mastodon-streaming
  cp node-v$_node-linux-x64/bin/node "$pkgdir"/var/lib/mastodon

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
