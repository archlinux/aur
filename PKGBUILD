# Maintainer: tinywrkb <tinywrkb@gmail.com>

_pkgname=coda-bits
pkgname=${_pkgname}-git
pkgver=r11.61c8cc4
pkgrel=2
pkgdesc="Bits & pieces of information about CODA VPUs"
arch=(x86_64)
url="https://github.com/pH5/${_pkgname}"
license=('custom:0BSD')
depends=(glibc)
makedepends=(git meson)
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${_pkgname}
  set -o pipefail
  git describe --long 2> /dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${_pkgname}
  meson --prefix=/usr build -D docs=true
  ninja -C build
}

package() {
  cd ${_pkgname}
  DESTDIR="$pkgdir" meson install -C build
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
