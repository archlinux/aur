# Maintainer:
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Giuseppe Borzi <gborzi@ieee.org>

pkgname=midori-passwordmanager
_pkgname=midori
pkgver=0.3
_pkgver=0.5.11
pkgrel=14
pkgdesc="A password manager for Midori"
arch=('i686' 'x86_64')
url="https://www.midori-browser.org"
license=('GPL2')
depends=('midori' 'gnome-keyring' 'libgnome-keyring')
makedepends=('python2' 'intltool' 'vala' 'librsvg' 'cmake')
optdepends=('seahorse: to edit/delete passwords')
source=("$url/downloads/midori_${_pkgver}_all_.tar.bz2" passwordmanager.c passwordmanager.js cmakelist.diff README lpins.c)
sha256sums=('ea60fc67b6bbf8bd2ea4651aca2f605a7ef3b83e7ef00f54745b6be5d91dfb04'
            'ff49ca7fd226dc69c889906d81136bc633141113411021ce658be0118774b88f'
            '4c1fafdd677c19f410795d66a5c110b5791e17e95644f09c72b79c1172c9cbd9'
            'c3b2fb8f0caf9fe733b1e0a784ef3c036afed3ee8897513cc3ca6232c584a20b'
            '76223532d88c8b1ae1582ccf66d94b1c20c7aed4235fb6dbb7d4a3c65934aa50'
            '8510c40a30b4400f7213a51f39c978db8fbb7130d37296b10ca414f197f8358b')
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
