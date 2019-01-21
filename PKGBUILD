# Maintainer: Llewelyn Trahaearn <WoefulDerelict at GMail dot com>
# Contributor: speps <speps at aur dot archlinux dot org>

pkgname=vsxu
pkgver=0.6.3
pkgrel=1
pkgdesc="A free to use program that lets you create and perform real-time audio visual presets."
arch=('i686' 'x86_64')
url="http://www.vsxu.com/"
license=('GPL' 'custom')
depends=('desktop-file-utils' 'glew' 'opencv' 'xdg-utils')
makedepends=('alsa-lib' 'cmake' 'git' 'jack' 'pulseaudio')
optdepends=('alsa-lib: ALSA support.'
            'jack: JACK support'
            'pulseaudio: PulseAudio support')
_vsxu_commit=5404800f9309f852b8fec6e40e90cb11fa0bbbf9  # tags/v0.6.3
_dependencies_commit=f0db876f0da43636ec9c25facbdd6a84771ef1fc
_cal3d_commit=ce1a74f6638ff147ce9790c52f6c741bf8c8e342
_freetype2_commit=f5f0a0ece4f299a465d130c6a98691112ebd30e9
_ftgl_commit=a461cfb42546fa909627bd1aeb5fed580b8ba293
_lodepng_commit=c9e609b45606a257c4a258dbfbc46622efc2bfbe
_lzham_commit=a2eb6567bfd87b319e6e4eb407bb84b0ba1c9670
_lzma_commit=ca0d0199adea3677ba25cf9b086e89d5ecf76772
source=("${pkgname}::git+https://github.com/vovoid/vsxu#commit=$_vsxu_commit"
        "dependencies::git+https://github.com/vovoid/vsxu-dependencies#commit=$_dependencies_commit"
        "cal3d::git+https://github.com/vovoid/cal3d#commit=$_cal3d_commit"
        "freetype2::git+https://github.com/vovoid/freetype2#commit=$_freetype2_commit"
        "ftgl::git+https://github.com/vovoid/ftgl#commit=$_ftgl_commit"
        "lodepng::git+https://github.com/vovoid/lodepng#commit=$_lodepng_commit"
        "lzham-sdk::git+https://github.com/vovoid/lzham_codec#commit=$_lzham_commit"
        "lzma-sdk::git+https://github.com/vovoid/LZMA-SDK#commit=$_lzma_commit")
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
  mkdir -p build
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
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr \
           -DOpenGL_GL_PREFERENCE=GLVND
  make
}

package() {
  cd "${pkgname}/build"
  make DESTDIR="${pkgdir}" install

  # License.
  install -Dm644 "../COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
} 
