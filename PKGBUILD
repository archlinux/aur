# Maintainer: Zhiya Luo <luozhiya@petalmail.com>
# Contributor: Hammer <topo20@protonmail.com>
# Contributor: Butui Hu <hot123tea123@gmail.com>

pkgname=mogan-git
pkgver=1.1.1_r276.d5f11ef
pkgrel=1
pkgdesc="A structured wysiwyg scientific text editor"
arch=('x86_64')
url='https://github.com/XmacsLabs/mogan'
license=('GPL3')
depends=("qt5-base" "qt5-svg" "freetype2" "sqlite" "libpng" "libiconv" "zlib" "libjpeg" "curl" "texlive-core" "python" "libxext")
makedepends=("git" "cmake" "ninja")
optdepends=(
  'gawk: Conversion of some files'
  'ghostscript: Rendering ps files'
  'imagemagick: Convert images'
  'aspell: Spell checking')
source=("${pkgname}::git+${url}.git")
noextract=()
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  local _pkgver=$(awk -F '\"' '/set \(XMACS_VERSION / {print $2}' CMakeLists.txt | awk '{ sub(/-/, "_"); print $0}')_r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
  echo "$_pkgver"
}

prepare() {
  cd "${pkgname}"
  git submodule update --init
}

build() {
  cmake -S"${pkgname}" -Bbuild -G Ninja -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DTEXMACS_GUI=Qt5
  cmake --build build --parallel
}

package() {
  cd "${srcdir}/build"
  DESTDIR="${pkgdir}" cmake --build . --target install
}

# vim:set sw=2 sts=2 et:
