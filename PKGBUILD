# Maintainer: Llewelyn Trahaearn <WoefulDerelict at GMail dot com>
# Contributor: speps <speps at aur dot archlinux dot org>

pkgname=vsxu
pkgver=0.6.2
pkgrel=1
pkgdesc="A free to use program that lets you create and perform real-time audio visual presets."
arch=('i686' 'x86_64')
url="http://www.vsxu.com/"
license=('GPL' 'custom')
depends=('desktop-file-utils' 'glew' 'libpng' 'opencv' 'xdg-utils')
makedepends=('alsa-lib' 'cmake' 'git' 'jack' 'pulseaudio')
optdepends=(
  'alsa-lib: ALSA support.'
  'jack: JACK support'
  'pulseaudio: PulseAudio support'
)
_commit=5722f904c77c7130460d9dd566e4ac776163923e  # tags/v0.6.2
source=("git+https://github.com/vovoid/vsxu#commit=$_commit"
        "dependencies::git+https://github.com/vovoid/vsxu-dependencies.git"
        "cal3d::git+https://github.com/vovoid/cal3d.git"
        "freetype2::git+https://github.com/vovoid/freetype2.git"
        "ftgl::git+https://github.com/vovoid/ftgl.git"
        "lodepng::git+https://github.com/vovoid/lodepng.git"
        "lzham-sdk::git+https://github.com/vovoid/lzham_codec.git"
        "lzma-sdk::git+https://github.com/vovoid/LZMA-SDK.git")
sha512sums=('SKIP'
            'SKIP'	
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
  cd "${pkgname}"
  [[ -d build ]] || mkdir build
  git submodule init
  git config submodule.dependencies.url "${srcdir}/dependencies"
  git config submodule.lib/compression/thirdparty/lzma-sdk.url "${srcdir}/lzma-sdk"
  git config submodule.lib/compression/thirdparty/lzham-sdk.url "${srcdir}/lzham-sdk"
  git config submodule.lib/engine_graphics/thirdparty/freetype2.url "${srcdir}/freetype2"
  git config submodule.lib/engine_graphics/thirdparty/ftgl.url "${srcdir}/ftgl"
  git config submodule.lib/engine_graphics/thirdparty/lodepng.url "${srcdir}/lodepng"
  git config submodule.plugins/src/mesh.importers/cal3d.url "${srcdir}/cal3d"
  git submodule update dependencies lib/compression/thirdparty/lzham-sdk lib/compression/thirdparty/lzma-sdk lib/engine_graphics/thirdparty/freetype2 lib/engine_graphics/thirdparty/ftgl lib/engine_graphics/thirdparty/lodepng plugins/src/mesh.importers/cal3d
}

pkgver() {
  cd "${pkgname}"
  git describe --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname}/build"
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr 
  make
}

package() {
  cd "${pkgname}/build"
  make DESTDIR="${pkgdir}" install

  # License.
  install -Dm644 "../COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
} 
