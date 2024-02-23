# Maintainer: Apoorv <apoorvs569@gmail.com>

_pkgname=vitOTT
pkgname=vitott-git
pkgver=r50.fa5f455
pkgrel=1
pkgdesc="Multiband compressor from famous spectral warping synthesizer"
arch=('x86_64')
url="https://github.com/edgjj/vitOTT"
license=('GPL3')
makedepends=('git' 'cmake')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${_pkgname%}"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/${_pkgname%}"

  git switch dev
  git submodule update --init --recursive
}

build() {
  cd "$srcdir/${_pkgname%}"

  cmake -Bbuild -DCMAKE_BUILD_TYPE=Release
  make -C build
}

package() {
  cd "$srcdir/${_pkgname%}"

  mkdir -p "${pkgdir}/usr/lib/lv2"
  mkdir -p "${pkgdir}/usr/lib/vst3/"

  cp -r build/vitOTT_artefacts/Release/LV2/vitOTT.lv2/ "${pkgdir}/usr/lib/lv2"
  cp -r build/vitOTT_artefacts/Release/VST3/vitOTT.vst3/ "${pkgdir}/usr/lib/vst3/"
}
