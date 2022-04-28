# Maintainer: João Figueiredo <islandc0der@chaotic.cx>

pkgname=dl_poly-git
pkgver=r60.f2712ca
pkgrel=2
pkgdesc='General purpose molecular dynamics simulation package'
arch=($CARCH)
url='https://gitlab.com/DL_POLY_Classic/dl_poly'
license=(custom)
depends=(openmpi)
makedepends=(gcc-fortran git)
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}/source
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd ${pkgname%-git}/source
  sed -i 's/LDFLAGS="" //' ../build/MakePAR
  ln -sf ../build/MakePAR Makefile
}

build() {
  cd ${pkgname%-git}/source
  make -j1 dlpoly FFLAGS="-c -O3 -fallow-argument-mismatch"
}

package() {
  cd ${pkgname%-git}
  install -Dm755 execute/DLPOLY.X -t "$pkgdir/usr/bin/"
  install -Dm644 Licence.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
