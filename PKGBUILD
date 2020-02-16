# Maintainer: japm48 <japm48gh@gmail.com>

_pkgname=open-fpga-loader
pkgname=$_pkgname-git

provides=($_pkgname)
conflicts=($_pkgname)

pkgver=r155.1f02fce
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
  
  # /usr/local -> /usr
  find ../src -type f -exec sed -i -e 's|/usr/local/|/usr/|' {} \;
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  cmake --build .
}

package() {
  cd "$srcdir/$_src_pkgname"
  cd build
  
  make DESTDIR="${pkgdir}" install
  install -Dm644 "../LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}



