# Maintainer: Robin Broda <robin at broda dot me>

_pkgname="bonzomatic"
pkgname=("${_pkgname}-git")
pkgver=r284.362c1de
pkgrel=2
pkgdesc='a live-coding tool where you can write a 2D fragment/pixel shader while it is running in the background'
arch=('x86_64')
url='https://github.com/Gargaj/bonzomatic'
license=('custom:Unlicense')
provides=('bonzomatic')
conflicts=('bonzomatic')
depends=('xorg-server' 'libxrandr' 'libxinerama' 'libxcursor' 'libbass')
makedepends=('git' 'cmake' 'glu' 'chrpath')
source=('git+https://github.com/Gargaj/bonzomatic.git')
md5sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${_pkgname}"

  mkdir -p build
}

build() {
  cd "${_pkgname}/build"

  cmake ..
  make
}

package() {
  cd "${_pkgname}/build"

  # Fix insecure rpath
  chrpath -d bonzomatic

  install -Dm755 bonzomatic "${pkgdir}/usr/bin/bonzomatic"
  install -Dm644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
