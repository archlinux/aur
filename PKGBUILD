# Maintainer: Doug Newgard <scimmia22 at outlook dot com>

_pkgname=ecrire
pkgname=$_pkgname-git
pkgver=0.1.0.106.317bca3
pkgrel=1
pkgdesc="Simple text editor based on EFL"
arch=('i686' 'x86_64')
url="http://www.enlightenment.org"
license=('GPL3')
depends=('elementary' 'desktop-file-utils')
makedepends=('git' 'cmake')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
install=$_pkgname.install
source=("git://git.enlightenment.org/apps/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"

  for i in VMAJ VMIN VMIC; do
    local PACKAGE_VERSION=${PACKAGE_VERSION#.}.$(grep -m 1 $i CMakeLists.txt | grep -o "[[:digit:]]*")
  done

  printf $PACKAGE_VERSION.$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "$srcdir/$_pkgname"

  export CFLAGS="$CFLAGS -fvisibility=hidden"

  cmake . \
    -DCMAKE_INSTALL_PREFIX=/usr

  make
}

package() {
  cd "$srcdir/$_pkgname"

  make DESTDIR="$pkgdir" install

# install text files
  install -Dm644 AUTHORS "$pkgdir/usr/share/doc/$_pkgname/AUTHORS"
  install -Dm644 ChangeLog "$pkgdir/usr/share/doc/$_pkgname/ChangeLog"
  install -Dm644 NEWS "$pkgdir/usr/share/doc/$_pkgname/NEWS"
  install -Dm644 README "$pkgdir/usr/share/doc/$_pkgname/README"
}
