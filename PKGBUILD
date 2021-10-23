# Maintainer: Tim Yang <protonmail = timdyang>

pkgname=scoutfish-git
pkgver=r99.00cec13
pkgrel=1
pkgdesc="A fast, powerful chess query engine"
arch=(i686 x86_64 armv7h)
url=https://github.com/mcostalba/scoutfish
license=(GPL3)
depends=(gcc-libs)
makedepends=(git)
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
source=(git+https://github.com/mcostalba/scoutfish)
sha256sums=(SKIP)

pkgver() {
  cd ${pkgname%-git}/src
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${pkgname%-git}/src

  if [[ $CARCH == armv7h ]]; then
    _arch=armv7
  elif [[ $CARCH == i686 ]]; then
    _arch=x86-32
  elif grep -wq bmi2 /proc/cpuinfo; then
    _arch=x86-64-bmi2
  elif grep -w popcnt /proc/cpuinfo | grep -wqv cr8_legacy; then
    _arch=x86-64-modern
  else
    _arch=x86-64
  fi

  make build ARCH=$_arch COMP=gcc
  make strip
}

package() {
  cd ${pkgname%-git}/src
  make PREFIX="$pkgdir"/usr install
}

# vim:set ts=2 sw=2 et:
