# Maintainer: Adam Wahab <awahab@adhoc.tools>

_name=NeuralRack
pkgname=${_name,,}-git
pkgver=r188.0b82578
pkgrel=1
pkgdesc="Neural model and impulse response file loader"
url="https://github.com/brummer10/$_name"
arch=(aarch64 x86_64)
license=(BSD-3-Clause)
depends=(gcc-libs glibc libx11)
makedepends=(cairo git libsndfile lv2 xxd)
checkdepends=(lv2lint)
provides=($_name $_name.lv2)
groups=(lv2-plugins pro-audio)
source=("git+${url}.git")
sha256sums=('SKIP')
_plugin_uri="urn:brummer:${_name,,}"

pkgver() {
  cd "${srcdir}/$_name" || exit 1
  set -o pipefail
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/$_name" || exit 1
  git submodule update --init --recursive
  make CXX=g++ STRIP=:
}

check() {
  cd "${srcdir}/$_name" || exit 1
  lv2lint -M pack -s '_Z*' -I bin/${_name,,[R]}.lv2 "$_plugin_uri"
}

package() {
  depends+=(libcairo.so libsndfile.so)
  cd "${srcdir}/$_name" || exit 1
  make DESTDIR="${pkgdir}" install
  install -vDm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -vDm 644 README.md NeuralRack.png -t "${pkgdir}/usr/share/doc/${pkgname}"
}
