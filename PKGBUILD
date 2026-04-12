#!/hint/bash
# Maintainer: bartus <arch-user-repoᘓbartus.33mail.com>

## Configuration env vars:
((ENABLE_QT5)) && QT_VER="5" || QT_VER="6"
qt="qt${QT_VER}"

pkgname=openboard-git
_fragment="#branch=master"
pkgver=1.7.7.r1.g30d120ce
pkgrel=1
pkgdesc="Interactive whiteboard software for schools and universities (development version current master)"
arch=('x86_64' 'i686')
url="http://openboard.ch/index.en.html"
license=('GPL3')
provides=("${pkgname%-git}=${pkgver%%.r*}")
conflicts=("${pkgname%-git}")
depends+=(${qt}-{base,declarative,multimedia,svg,webchannel,webengine})
depends+=('libpaper' 'bzip2' 'openssl' 'libfdk-aac' 'sdl' 'ffmpeg')
depends+=(quazip-${qt})  #drop internal quazip and use system one.
depends+=(poppler) #replace internal xpdf with poppler and drop freetype/xpdf from deps
makedepends=(git cmake ${qt}-tools)
source=("git+https://github.com/OpenBoard-org/OpenBoard.git${_fragment}"
        )
sha256sums=('SKIP'
            )

pkgver() {
  cd "$srcdir/OpenBoard"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  :
}

build() {
  export CCACHE_BASEDIR="$srcdir"
  cmake -B build -S "$srcdir"/OpenBoard \
    -DCMAKE_BUILD_TYPE=None \
    -DQT_VERSION=${QT_VER} \
    -DCMAKE_INSTALL_PREFIX:PATH=/usr \
    -DCMAKE_CXX_STANDARD=20 \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
