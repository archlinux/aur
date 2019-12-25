# Maintainer: Louis Solofrizzo <louis@ne02ptzero.me>
_pkgname=shayla
pkgname="${_pkgname}-git"
pkgver=1.1.r0.g28bb961
pkgrel=1
pkgdesc="A fast and simple static site generator"
arch=("i686" "x86_64" "arm" "armv6h" "armv7h" "aarch64")
url="https://git.mobley.ne02ptzero.me/~louis/shayla"
license=("GPL3")
makedepends=("cmake" "git" "gcc")
provides=("shayla")
conflicts=("shayla")
source=("${_pkgname}::git+${url}")
md5sums=("SKIP")

pkgver() {
  git -C "${_pkgname}" describe --long --tags | sed "s/-/.r/;s/-/./g"
}

prepare() {
  git -C "${_pkgname}" submodule update --init --recursive
  mkdir -p "${_pkgname}/build"
}

build() {
  cd "${_pkgname}/build" || exit 1
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  cmake --build .
}

package() {
  cmake --build "${_pkgname}/build" --target install -- DESTDIR="${pkgdir}"
  install -Dm644 "${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
