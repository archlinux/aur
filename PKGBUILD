# Maintainer : shogeki < shogeki at gmail dot com >

pkgname=openomf-git
pkgver=0.7.1.r129.gaaab3ee5
_pkgver=0.7.1
pkgrel=1
pkgdesc="An Open Source remake of One Must Fall 2097.  Latest git build"
arch=("x86_64")
url="https://github.com/omf2097/openomf/"
license=("MIT")
options=("!debug" "!lto")

makedepends=("pkgconf" "git" "cmake")
depends=("sdl2" "confuse" "enet" "argtable" "libpng" "zlib" "sdl2_mixer" "libxmp")
source=(
  "git+https://github.com/omf2097/openomf.git"
  "https://www.omf2097.com/pub/files/omf/omf2097-assets.zip"
  folders.patch
  openomf.desktop
  openomf.png
)

sha256sums=('SKIP'
            'de472c786adf9e618bf4b71a5f2cb85bb0b090f27da2b3008f305453a8dea67d'
            '6b2ffacf01e0d8e35a8d4487b4f2b9ad938813f0cbcc60ac843f018f8b6f90f4'
            'b1b8aaf8eeb583c5433cbb63060edb43ecabd39825dcc82947ac4790452ffe41'
            'fffc25c98ca0d35dea8a74560359f5023968782965e56825cf0d8c84b79fbcd7')

prepare() {
  patch -p0 < "${srcdir}/folders.patch"
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
  install -Dm755 "${srcdir}/openomf/build/openomf" "${pkgdir}/usr/bin/openomf"
  install -Dm644 "${srcdir}/openomf.desktop" "${pkgdir}/usr/share/applications/openomf.desktop"
  install -Dm644 "${srcdir}/openomf.png" "${pkgdir}/usr/share/pixmaps/openomf.png"
  cp -vr "${srcdir}/OMF2097/." "${pkgdir}/usr/share/openomf"

  mkdir -p "${pkgdir}/usr/share/openomf"
  mkdir -p "${pkgdir}/usr/share/openomf/shaders"

  cp -vr "${srcdir}/openomf/build/shaders/." "${pkgdir}/usr/share/openomf/shaders"
  cp -vr "${srcdir}/openomf/build/resources/." "${pkgdir}/usr/share/openomf"
}

