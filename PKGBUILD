# Maintainer: David Hummel <hummeltech@sherpaguru.com>

pkgname='openjkdf2-git'
pkgver=0.9.1.r20.gfbdb01b
pkgrel=1
pkgdesc="A function-by-function reimplementation of DF2 (Dark Forces 2) in C."
arch=('i686' 'x86_64')
url='https://github.com/shinyquagsire23/OpenJKDF2'
license=('GPL-3.0-or-later')
makedepends=(
  'chrpath'
  'clang'
  'cmake'
  'git'
  'python-cogapp'
)
depends=(
  'glib2'
  'gtk3'
  'openal'
)
options=(!emptydirs !lto)
source=('git+https://github.com/shinyquagsire23/OpenJKDF2.git'
        'git+https://github.com/FreeGLUTProject/freeglut.git'
        'git+https://github.com/Perlmint/glew-cmake.git'
        'git+https://github.com/madler/zlib.git'
        'git+https://github.com/icculus/physfs.git'
        'git+https://github.com/ValveSoftware/GameNetworkingSockets.git'
        'git+https://github.com/protocolbuffers/protobuf.git'
        'git+https://github.com/glennrp/libpng.git'
        'git+https://github.com/libsdl-org/SDL.git'
        'git+https://github.com/libsdl-org/SDL_mixer.git'
)
sha512sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
)

pkgver() {
  cd OpenJKDF2 || exit
  git describe --abbrev=7 --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd OpenJKDF2 || exit

  git submodule init \
    lib/freeglut
  git config submodule.freeglut.url "$srcdir"/freeglut
  git -c protocol.file.allow=always submodule update --init \
    lib/freeglut

  git submodule init \
    lib/glew
  git config submodule.glew.url "$srcdir"/glew-cmake
  git -c protocol.file.allow=always submodule update --init \
    lib/glew

  git submodule init \
    lib/zlib
  git config submodule.zlib.url "$srcdir"/zlib
  git -c protocol.file.allow=always submodule update --init \
    lib/zlib

  git submodule init \
    lib/physfs
  git config submodule.physfs.url "$srcdir"/physfs
  git -c protocol.file.allow=always submodule update --init \
    lib/physfs

  git submodule init \
    lib/GameNetworkingSockets
  git config submodule.GameNetworkingSockets.url "$srcdir"/GameNetworkingSockets
  git -c protocol.file.allow=always submodule update --init \
    lib/GameNetworkingSockets

  git submodule init \
    lib/protobuf
  git config submodule.protobuf.url "$srcdir"/protobuf
  git -c protocol.file.allow=always submodule update --init \
    lib/protobuf

  git submodule init \
    lib/libpng
  git config submodule.libpng.url "$srcdir"/libpng
  git -c protocol.file.allow=always submodule update --init \
    lib/libpng

  git submodule init \
    lib/SDL
  git config submodule.SDL.url "$srcdir"/SDL
  git -c protocol.file.allow=always submodule update --init \
    lib/SDL

  git submodule init \
    lib/SDL_mixer
  git config submodule.SDL_mixer.url "$srcdir"/SDL_mixer
  git -c protocol.file.allow=always submodule update --init \
    lib/SDL_mixer
}

build() {
  CC=clang CXX=clang++ cmake -B "${pkgname}-build" -S OpenJKDF2
  cmake --build "${pkgname}-build"
}

package() {
  chrpath --delete "$srcdir"/${pkgname}-build/openjkdf2
  install -Dm755 "$srcdir"/${pkgname}-build/openjkdf2 "$pkgdir"/usr/bin/openjkdf2

  # License
  install -Dm644 "$srcdir"/OpenJKDF2/LICENSE.md "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
