# Maintainer : shogeki < shogeki at gmail dot com >

pkgname=openomf-git
pkgver=0.8.5.r9.g5a636b62
_pkgver=0.8.5
pkgrel=1
pkgdesc="An open source remake of One Must Fall 2097.  Latest git build"
arch=("x86_64")
url="https://github.com/omf2097/openomf/"
license=("MIT")
options=("!debug" "!lto")

makedepends=("pkgconf" "git" "cmake")
depends=("sdl2" "confuse" "enet" "argtable" "libpng" "zlib" "sdl2_mixer" "libxmp")
source=(
  "git+https://github.com/omf2097/openomf.git"
  "https://www.omf2097.com/pub/files/omf/omf2097-assets.zip"
  openomf.desktop
  openomf.png
  openomf-run
)

sha256sums=(
"SKIP"
"de472c786adf9e618bf4b71a5f2cb85bb0b090f27da2b3008f305453a8dea67d"
"b1b8aaf8eeb583c5433cbb63060edb43ecabd39825dcc82947ac4790452ffe41"
"fffc25c98ca0d35dea8a74560359f5023968782965e56825cf0d8c84b79fbcd7"
"b6ac0a17a893c695cd2c076f97a97102cecb85180ace6969301e50c394809596"
)

prepare() {
  cd "${srcdir}/openomf"
  mkdir -p build
  cd build
  cmake -DCMAKE_BUILD_TYPE=Release ..
}

pkgver() {
	cd "${srcdir}/openomf"
  git describe --long --tags --abbrev=8 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/openomf/build"
  make
}

package() {
  install -Dm755 "${srcdir}/openomf/build/openomf" "${pkgdir}/usr/share/openomf/openomf"
  install -Dm755 "${srcdir}/openomf-run" "${pkgdir}/usr/bin/openomf"
  install -Dm644 "${srcdir}/openomf.desktop" "${pkgdir}/usr/share/applications/openomf.desktop"
  install -Dm644 "${srcdir}/openomf.png" "${pkgdir}/usr/share/pixmaps/openomf.png"

  mkdir -p "${pkgdir}/usr/share/openomf/resources"
  mkdir -p "${pkgdir}/usr/share/openomf"
  mkdir -p "${pkgdir}/usr/share/openomf/shaders"

  cp -vr "${srcdir}/OMF2097/." "${pkgdir}/usr/share/openomf/resources"
  cp -vr "${srcdir}/openomf/build/shaders/." "${pkgdir}/usr/share/openomf/shaders"
  cp -vr "${srcdir}/openomf/build/resources/." "${pkgdir}/usr/share/openomf/resources"
}
