# Maintainer: Adrian Sinclair <adrian at adrusi dot com>

pkgname=ghost-web
pkgver=2.14.0
pkgrel=1
pkgdesc="Full-featured nodejs blogging platform"
arch=(any)
url="https://ghost.org/"
license=('GPL')
makedepends=('npm')
depends=('nodejs-lts-dubnium' 'mysql')
install=ghost-web.install
source=("https://registry.npmjs.org/ghost-cli/-/ghost-cli-1.9.9.tgz"
        ghost-web.service
        ghost-web-sysusers.conf)
noextract=(ghost-cli-1.9.9.tgz)
md5sums=('9444181acef44d357af672ef9817899b'
         '3ad42d4f2ab2a7d4dd02bc9170de2c8b'
         '80dabee626a96ba2403a3bdb4d351d5c')

package() {
  npm install -g --user root --prefix "$pkgdir"/usr "$srcdir"/ghost-cli-1.9.9.tgz
  mv "$pkgdir"/usr/bin/ghost{,-web}

  # Fix permissions
  find "$pkgdir"/usr -type d -exec chmod 755 '{}' +

  install -Dm644 ghost-web.service -t "$pkgdir"/usr/lib/systemd/system/
  install -Dm644 ghost-web-sysusers.conf "$pkgdir"/usr/lib/sysusers.d/ghost-web.conf

  mkdir -p "$pkgdir"/var/lib/ghost-web
  chmod 775 "$pkgdir"/var/lib/ghost-web
}

