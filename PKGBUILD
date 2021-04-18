# Maintainer: tcg <aur-tcg@emailaddress.biz>

pkgname=tcg-git
pkgver=0.2.67
pkgrel=1
pkgdesc="cgroups for terminals"
arch=('x86_64')
url="https://github.com/zasdfgbnm/tcg"
license=('MIT')
depends=('boost-libs' 'fmt' 'spdlog' 'libseccomp')
makedepends=('git' 'cmake' 'boost')
source=("git+$url")
sha256sums=('SKIP')

build() {
  cd "$srcdir/tcg"
  mkdir -p build
  cd build
  if [ "x$CODE_COVERAGE" = "xON" ]; then
    cmake -DVERSION=${pkgver} -DCODE_COVERAGE=ON -DGCDA_DIR=/var/lib/tcg ..
  else
    cmake -DVERSION=${pkgver} ..
  fi
  make -j
}

package() {
  cd "$srcdir/tcg"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/tcg/LICENSE"
  if [ "x$CODE_COVERAGE" = "xON" ]; then
    mkdir -p "${pkgdir}/usr/src/tcg/"
    mkdir -p "${pkgdir}/var/lib/tcg/"
    install -Dm644 build/*.gcno "${pkgdir}/usr/src/tcg/"
    install -Dm644 src/{*.cpp,*.hpp} "${pkgdir}/usr/src/tcg/"
  fi
  install -Dm4755 build/tcg "${pkgdir}/usr/bin/tcg"
}
