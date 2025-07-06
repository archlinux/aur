# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: garion < garion @ mailoo.org >

pkgname=vobsub2srt-git
pkgver=1.0.8.g8ea2e11
pkgrel=1
pkgdesc="Convert IDX/SUB subtitles into SRT text subtitles. (GIT version)"
arch=('x86_64')
url='https://github.com/ruediger/VobSub2SRT'
license=('GPL')
depends=('tesseract')
optdepends=('tesseract-data: Tesseract OCR data')
makedepends=(
  'cmake'
  'git'
)
source=('vobsub2srt::git+https://github.com/ecdye/VobSub2SRT.git')
sha256sums=('SKIP')
options=('debug')

pkgver() {
  cd vobsub2srt
  echo "$(git describe --long --tags | tr - . |tr -d v)"
}

prepare() {
  sed 's|VERSION 2.8.12|VERSION 3.5|g' -i vobsub2srt/CMakeLists.txt
  sed '40a#include <climits>' -i vobsub2srt/src/vobsub2srt.c++
}

build() {
  export DCMAKE_POLICY_VERSION_MINIMUM=3.5

  cmake -S vobsub2srt -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBASH_COMPLETION_PATH=/usr/share/bash-completion/completions

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
