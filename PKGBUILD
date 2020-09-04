pkgname=replay-sorcery
pkgver=0.3.0
pkgrel=1
pkgdesc='An open-source, instant-replay screen recorder for Linux'
arch=(i686 x86_64)
license=(GPL3)
depends=(gcc-libs libxext)
makedepends=(cmake git nasm)
url='https://github.com/matanui159/ReplaySorcery'
source=("${pkgname}"::git+"${url}".git#tag="${pkgver}"
        git+https://github.com/libjpeg-turbo/libjpeg-turbo.git
        git+https://github.com/ianlancetaylor/libbacktrace.git
        git+https://code.videolan.org/videolan/x264.git
        git+https://github.com/lieff/minimp4.git)
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
   cd ${pkgname}
   git submodule init
   git config submodule."dep/libjpeg-turbo".url ../libjpeg-turbo
   git config submodule."dep/libbacktrace".url ../libbacktrace
   git config submodule."dep/x264".url ../x264
   git config submodule."dep/minimp4".url ../minimp4
   git submodule update
}

build() {
   cmake -B build -S "${pkgname}" \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX=/usr
   cmake --build build
}

package() {
   DESTDIR="${pkgdir}" cmake --install build
}
