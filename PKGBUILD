# Maintainer: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>
# vim: ft=sh

pkgname=baikal
pkgver=0.2.7
pkgrel=4
pkgdesc="Lightweight CalDAV+CardDAV server"
url="http://baikal-server.com/"
arch=('any')
license=('GPL')
depends=('php')
optdepends=('sqlite: Database' 'mariadb: Alternate database' 'php-sqlite: To use the sqlite backend')
source=("http://baikal-server.com/get/baikal-regular-${pkgver}.tgz"
        'baikal.install')
sha1sums=('01eabcf0229ddffc0542f4e2a349754e778abbea'
          '242048f78fde70f1bde1c51dce4a73ad42a21f28')
options=('!strip')
install=baikal.install

package() {
  cd "${srcdir}/baikal-regular"
  install -dm 755 "$pkgdir"/usr/share/{webapps,doc}"/$pkgname"
  install -dm 700 -o http -g http "$pkgdir/var/lib/$pkgname"
  cp -R Core html vendor "$pkgdir/usr/share/webapps/$pkgname"
  install -Dm644 ChangeLog.md INSTALL.md README.md TROUBLESHOOTING.md \
    "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 -o http -g http Specific/ENABLE_INSTALL \
    "$pkgdir/var/lib/$pkgname"
  for conf in Specific/virtualhosts/*; do
    basename=${conf##*/}
    basename=${basename/baikal./}.example.conf
    sed 's|/var/www/dav.mydomain.com|/usr/share/webapps/baikal|' "$conf" > \
      "$pkgdir/usr/share/doc/$pkgname/$basename"
  done
  ln -s "/var/lib/$pkgname" "$pkgdir/usr/share/webapps/$pkgname/Specific"
}

# vim:set ts=2 sw=2 et:
