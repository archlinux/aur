# Maintainer: Andras Czigany <andras dot czigany dot 'thirteen with digits' at gmail dot com>

pkgname=flint++-git
pkgver=r239.b3f3672
pkgrel=1
pkgdesc="C++ port of Facebooks flint"
groups=()
arch=('i686' 'x86_64')
url="https://github.com/L2Program/FlintPlusPlus"
license=('custom:Boost')
depends=()
replaces=()
provides=('flint++')
conflicts=()
makedepends=('git')
source=("$pkgname"::git+https://github.com/L2Program/FlintPlusPlus.git)
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  # use the revision count.hash
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd ${srcdir}/${pkgname}
  sed -e 's/ARCH=/#ARCH=/' -i flint/makefile || return 1
}

build() {
  cd "${srcdir}/${pkgname}/flint"
  if [ "$CARCH" = "i686" ]; then
    export ARCH=32
  elif [ "$CARCH" = "x86_64" ]; then
    export ARCH=64
  fi

  make
}

package() { 
  cd "${srcdir}/${pkgname}"
  install -m755 -d "${pkgdir}/usr/bin"
  install bin/deb${ARCH}/flint++ "${pkgdir}/usr/bin/flint++"
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
