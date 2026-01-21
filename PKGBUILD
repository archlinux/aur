# Maintainer: Alejandro Valdes  <alejandrovaldes at live dot com>
pkgname=yuview
_pkgname=YUView
pkgver=2.14
pkgrel=1
pkgdesc="The Free and Open Source Cross Platform YUV Viewer with an advanced analytics toolset"
arch=('x86_64')
url="https://github.com/IENT/${_pkgname}"
license=('GPL3')
depends=('qt5-base'
         'qt5-charts'
         'desktop-file-utils'
         'libde265')
provides=("$pkgname")
conflicts=("$pkgname" "$_pkgname")
source=("git+${url}.git#commit=22c1e305bef25b23850a2068dcef3fb165c3fd60"
        'archlinux.patch')
noextract=()
md5sums=('SKIP'
         '1e5c1cfc4e3979aec828df29e26774e6')
install="$pkgname.install"

prepare() {
  cd "$srcdir/$_pkgname"
  patch --forward --strip=1 --input="${srcdir}/archlinux.patch"
  mkdir -p "$srcdir/build"
  cd "$srcdir/build"
  qmake -o Makefile ../$_pkgname/$_pkgname.pro -spec linux-g++
}

build() {
  cd build
  make
}

check() {
  cd build
  make -k check
}

package() {
  cd build
  make INSTALL_ROOT="$pkgdir" install
}
