# Maintainer: TheWaffleGuy <gvxq@hotmail.com>
# Contributor: Nicolas Floquet <nicolasfloquet AT gmail DOT com>
pkgname=e2tools
pkgver=0.0.16
pkgrel=2
pkgdesc="A simple set of GPL'ed utilities to read, write, and manipulate files in an ext2/ext3 filesystem."
arch=('i686' 'x86_64')
url="http://home.earthlink.net/~k_sheff/sw/e2tools/"
license=('GPL')
depends=('e2fsprogs')
options=(!buildflags)
source=(http://home.earthlink.net/~k_sheff/sw/e2tools/$pkgname-$pkgver.tar.gz
        e2tools-fedora-fixes.patch
        e2tools-printf-lld-64bit.patch
        e2cp.1
        e2ln.1
        e2ls.1
        e2mkdir.1
        e2mv.1
        e2rm.1
        e2tail.1
        e2tools.7)
md5sums=('1829b2b261e0e0d07566066769b5b28b'
         'f20787751299be37a51191448073f1da'
         '070ddb22fc2054d701dd96dbd9912228'
         '69bfba66bd8946866e2600d663df2c00'
         '004f1f59409a3cdfd4b945cc293ec2ee'
         'c729ef984582381c4d5072ae02960b63'
         '2fdfc8573af1b11f81e4ea2e8d34dcfc'
         '560225ac097abf53389ec364803cd731'
         'd9e2374e94758125ed4ac6aa98f0de16'
         '3e3c03eb4a72987a7f62c2fd23968248'
         '1ca78ad79fc4f4953f3a5388ec6a59fa')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -p1 < "${srcdir}/e2tools-fedora-fixes.patch"
  patch -p1 < "${srcdir}/e2tools-printf-lld-64bit.patch"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make CPPFLAGS="-Wall -Werror"
}

package() {
  install -dm 0755 "${pkgdir}/usr/share/man/man1"
  install -dm 0755 "${pkgdir}/usr/share/man/man7"
  install -pm 0644 \
    e2cp.1 \
    e2ln.1 \
    e2ls.1 \
    e2mkdir.1 \
    e2mv.1 \
    e2rm.1 \
    e2tail.1 \
    "${pkgdir}/usr/share/man/man1"
  install -pm 0644 e2tools.7 "${pkgdir}/usr/share/man/man7"

  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" install
}
