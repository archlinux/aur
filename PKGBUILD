# Maintainer: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>
# vim: ft=sh

pkgname=baikal
pkgver=0.2.7
pkgrel=6
pkgdesc="Lightweight CalDAV+CardDAV server"
url="http://baikal-server.com/"
arch=('any')
license=('GPL')
depends=('php')
optdepends=('sqlite: Database' 'mariadb: Alternate database' 'php-sqlite: To use the sqlite backend')
source=("http://baikal-server.com/get/baikal-regular-${pkgver}.tgz"
        'baikal.install'
        'php7.patch')
sha1sums=('01eabcf0229ddffc0542f4e2a349754e778abbea'
          'a1d2f36b6c4a282d23477dccb957c3ad3995f116'
          'e1c586c6549f08966c101a5f5125011c5a172f12')
options=('!strip')
install=baikal.install

prepare() {
  cd "${srcdir}/baikal-regular"
  patch -p0 -i ../php7.patch
}

package() {
  cd "${srcdir}/baikal-regular"
  install -dm 755 "$pkgdir"/usr/share/{webapps,doc}"/$pkgname"
  install -dm 700 -o http -g http "$pkgdir/var/lib/$pkgname"
  cp -R Core html vendor "$pkgdir/usr/share/webapps/$pkgname"
  install -Dm644 ChangeLog.md INSTALL.md README.md TROUBLESHOOTING.md \
    "$pkgdir/usr/share/doc/$pkgname"
  for conf in Specific/virtualhosts/*; do
    basename=${conf##*/}
    basename=${basename/baikal./}.example.conf
    sed 's|/var/www/dav.mydomain.com|/usr/share/webapps/baikal|' "$conf" > \
      "$pkgdir/usr/share/doc/$pkgname/$basename"
  done
  ln -s "/var/lib/$pkgname" "$pkgdir/usr/share/webapps/$pkgname/Specific"
}

# vim:set ts=2 sw=2 et:
