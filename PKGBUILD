# Maintainer: Zhiya Luo <luozhiya@petalmail.com>
# Contributor: Hammer <topo20@protonmail.com>
# Contributor: Butui Hu <hot123tea123@gmail.com>
# Contributor: Sinofine Lotus <i@sinofine.me>

pkgname=mogan-git
pkgver=1
pkgrel=1
pkgdesc="A structured wysiwyg scientific text editor"
arch=("x86_64")
url="https://github.com/XmacsLabs/mogan"
license=("GPL3")
depends=(
  "qt6-base" "qt6-svg" "noto-fonts-cjk" "libpng" "libjpeg" "sqlite"
  "zlib" "unzip" "curl" "texlive-core" "python" "libxext" "libgit2"
  "mimalloc" "fontconfig" "freetype2" "openssl")
makedepends=("git" "xmake")
optdepends=(
  "gawk: Conversion of some files"
  "ghostscript: Rendering ps files"
  "imagemagick: Convert images"
  "aspell: Spell checking")
source=("${pkgname}::git+${url}.git")
sha256sums=("SKIP")

prepare() {
  cd "${pkgname}"
  git submodule update --init
}

build() {
  cd "${pkgname}"
  xmake repo --update --yes
  QT6_VERSION=$(qmake6 -query QT_VERSION)
  xmake config -vD --policies=build.ccache -m releasedbg --yes --qt_sdkver=${QT6_VERSION}
  xmake build --yes -vD research
}

package() {
  cd "${pkgname}"

  # Running makepkg in fakeroot environment
  xmake install --root -o "${pkgdir}"/usr research

  # Fix "Can"t translate pathname "usr/share/Xmacs/tests/64_1_中文文件名.tm" to UTF-8"
  rm -rf "${pkgdir}"/usr/share/Xmacs/tests
}

# vim:set sw=2 sts=2 et:

