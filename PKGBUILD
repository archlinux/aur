# Maintainer: Apoorv <apoorvs569@gmail.com>

_pkgname=PeakEater
pkgname=peakeater-git
pkgver=r86.acbc3ff
pkgrel=2
pkgdesc="PeakEater is a free open-source cross-platform VST3/AU/LV2/CLAP wave shaper plugin"
arch=('x86_64')
url="https://github.com/vvvar/PeakEater"
license=('GPL3')
makedepends=('git' 'cmake')
provides=("${_pkgname%-git}")
conflicts=("${_pkgname%-git}")
source=("git+$url")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${_pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/${_pkgname%-git}"

  git submodule update --init --recursive
}

build() {
  cd "$srcdir/${_pkgname%-git}"

  cmake -Bbuild -DJUCE_BUILD_EXAMPLES=OFF -DJUCE_BUILD_EXTRAS=ON
  cmake --build build
}

package() {
  cd "$srcdir/${_pkgname%-git}"

  mkdir -p "${pkgdir}/usr/bin/"
  mkdir -p "${pkgdir}/usr/lib/vst3/"
  mkdir -p "${pkgdir}/usr/lib/lv2/"
  mkdir -p "${pkgdir}/usr/lib/clap/"

  cp -r build/PeakEater_artefacts/VST3/PeakEater.vst3/ "${pkgdir}/usr/lib/vst3/"
  cp -r build/PeakEater_artefacts/LV2/PeakEater.lv2/ "${pkgdir}/usr/lib/lv2/"
  cp -r build/PeakEater_artefacts/CLAP/PeakEater.clap "${pkgdir}/usr/lib/clap/"
  cp -r build/PeakEater_artefacts/Standalone/PeakEater "${pkgdir}/usr/bin/"
}
