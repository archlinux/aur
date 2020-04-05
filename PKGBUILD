# Maintainer: Alejandro Valdes  <alejandrovaldes at live dot com>
pkgname=yuview
_pkgname=YUView
pkgver=2.6
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
source=("git+${url}.git#commit=5e845470cf0571e5fabc6c0c2c5db4c6f3cec5af"
        'archlinux.patch')
noextract=()
md5sums=('SKIP'
         'a2d1cca1fade739a2fc8b918ff6536f3')
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
