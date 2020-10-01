# Maintainer: fuzzbop <fuzzbop@gmail.com>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: robb_force <robb_force@holybuffalo.net>
# Contributor: JJDaNiMoTh <jjdanimoth@gmail.com>

# I basically just lifted the main MAME PKGBUILD and .sh and edited it for HBMAME
# also not building tools since you most likely have MAME installed as well

pkgname=hbmame
pkgver=0.225
pkgrel=1
pkgdesc="A port of the popular Multiple Arcade Machine Emulator using SDL with OpenGL support."
url="https://mamedev.org/"
license=(GPL2)
arch=(x86_64)
depends=(sdl2_ttf qt5-base lua53 libutf8proc pugixml portmidi portaudio flac)
makedepends=(nasm python asio rapidjson glm libxinerama)
conflicts=(sdlmame)
replaces=(sdlmame)
source=("https://github.com/Robbbert/hbmame/archive/tag${pkgver:2}.tar.gz" hbmame.sh)
sha256sums=('SKIP'
            'SKIP')


prepare() {

  cd hbmame-tag${pkgver:2}
  
  # Use system libraries
  sed -e 's|\# USE_SYSTEM_LIB|USE_SYSTEM_LIB|g' -i makefile
}

build() {

  cd hbmame-tag${pkgver:2}
  export CFLAGS+=" -I/usr/include/lua5.3/"
  export CXXFLAGS+=" -I/usr/include/lua5.3/"

# Hack to force linking to lua5.3
  mkdir lib
  ln -s /usr/lib/liblua5.3.so lib/liblua.so
  export LDFLAGS+=" -L${PWD}/lib"  

  # Build HBMAME
  make \
    NOWERROR=1 \
    OPTIMIZE=2 \
    TOOLS=0 \
    USE_SYSTEM_LIB_ASIO=0 \
    ARCHOPTS=-flifetime-dse=1 \
    TARGET=hbmame
}

package() {
  cd hbmame-tag${pkgver:2}

  # Install the hbmame script
  install -Dm755 "$srcdir"/$pkgname.sh "$pkgdir"/usr/bin/$pkgname

  # Install the binaries
  install -Dm755 hbmame64 "$pkgdir"/usr/lib/hbmame/hbmame

  # Install the extra bits
  install -Dm644 src/osd/modules/opengl/shader/glsl*.*h -t "$pkgdir"/usr/lib/$pkgname/shader/
  cp -ar {artwork,bgfx,plugins,language,ctrlr,keymaps,hash} "$pkgdir"/usr/lib/$pkgname/
}
