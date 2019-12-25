# Maintainer: Louis Solofrizzo <louis@ne02ptzero.me>
_pkgname=kart
pkgname="${_pkgname}-git"
pkgver=0.2.0.r3.gf26bb48
pkgrel=1
pkgdesc="Internet Art crawler"
arch=("i686" "x86_64" "arm" "armv6h" "armv7h" "aarch64")
url="https://git.mobley.ne02ptzero.me/~louis/kart"
license=("GPL3")
makedepends=("cmake" "git" "go")
optdepends=("vlc" "feh" "sxiv")
provides=("kart")
conflicts=("kart")
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
