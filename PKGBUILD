# Maintainer: japm48 <japm48gh@gmail.com>

_pkgname=open-fpga-loader
pkgname=$_pkgname-git

provides=($_pkgname openfpgaloader)
conflicts=($_pkgname openfpgaloader openfpgaloader-git)

pkgver=r585.3ea05cc
pkgrel=1
arch=('x86_64')

pkgdesc="Universal utility for programming FPGA"
url="https://github.com/trabucayre/openFPGALoader"
license=('custom')

makedepends=(git cmake)
depends=(libftdi)

_src_pkgname=openFPGALoader
_repo=trabucayre/${_src_pkgname}
source=("git+https://github.com/${_repo}.git")
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/$_src_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


build() {
  cd "$srcdir/$_src_pkgname"
  mkdir -p build
  cd build

  # Workaround!
  # This should have been included via /usr/lib/pkgconfig/libftdi1.pc
  FIX_CXXFLAGS="-isystem /usr/include/libftdi1"

  CXXFLAGS="$CXXFLAGS $FIX_CXXFLAGS" \
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..

  cmake --build .
}

package() {
  cd "$srcdir/$_src_pkgname"
  cd build
  
  make DESTDIR="${pkgdir}" install
  install -Dm644 "../LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}



