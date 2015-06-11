# Maintainer: Giuseppe Borzi <gborzi@ieee.org>

pkgname=midori-passwordmanager
_pkgname=midori
pkgver=0.3
_pkgver=0.5.10
pkgrel=13
pkgdesc="A password manager for Midori"
arch=('i686' 'x86_64')
url="http://www.midori-browser.org"
license=('GPL2')
depends=('midori' 'gnome-keyring' 'libgnome-keyring')
makedepends=('python2' 'intltool' 'vala' 'librsvg' 'cmake')
optdepends=('seahorse: to edit/delete passwords')
source=("$url/downloads/${_pkgname}_${_pkgver}_all_.tar.bz2" passwordmanager.c passwordmanager.js cmakelist.diff README lpins.c)
md5sums=('2f250a5015923b6eeca606629e7bf042'
         '94c6ec8ddd50ca4d226d8413ef85c0f2'
         'f9a91b8d929d4cb6407a769603fca619'
         '51c3e704947b0626716ab83e199d06c4'
         'defadec00ebd02506fb1106f7fe5f2ae'
         'd11b1f035e4a044e2727ef226db9482b')
build() {
  cd "${srcdir}"

  patch -Np0 -i "${srcdir}/cmakelist.diff"
  cp "$srcdir/passwordmanager.c" extensions

  mkdir -p build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib
 
  make
  cc `pkg-config --cflags --libs gnome-keyring-1` "$srcdir/lpins.c" -o lpins
}

package() {
  cd "${srcdir}/build"
  install -Dm644 extensions/libpasswordmanager.so \
     "${pkgdir}/usr/lib/midori/libpasswordmanager.so"
  install -Dm644 "${srcdir}/passwordmanager.js" \
     "${pkgdir}/usr/share/midori/res/passwordmanager.js"
  install -Dm755 lpins "${pkgdir}/usr/bin/lpins"
  install -Dm644 "${srcdir}/README" "${pkgdir}/usr/share/doc/$pkgname/README"
}
