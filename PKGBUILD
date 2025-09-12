# Maintainer: David Hummel <hummeltech@sherpaguru.com>

pkgname='openjkdf2-git'
pkgver=0.9.6.r87.g1baa1e8
pkgrel=1
pkgdesc="A function-by-function reimplementation of DF2 (Dark Forces 2) in C."
arch=('i686' 'x86_64')
url='https://github.com/shinyquagsire23/OpenJKDF2'
license=('0BSD')
makedepends=(
  'at-spi2-core'
  'cairo'
  'clang'
  'gdk-pixbuf2'
  'git'
  'glew'
  'glu'
  'harfbuzz'
  'pango'
  'python-cogapp'
  'zlib'
)
depends=(
  'curl'
  'glib2'
  'gtk3'
  'hicolor-icon-theme'
  'libglvnd'
  'openal'
)
conflicts=('openjkdf2')
options=(!lto)
provides=('openjkdf2')
source=("${pkgname}::git+https://github.com/shinyquagsire23/OpenJKDF2.git"
        'git+https://github.com/FreeGLUTProject/freeglut.git'
        'glew::git+https://github.com/Perlmint/glew-cmake.git'
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
  cd "${pkgname}" || exit
  git describe --abbrev=7 --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname}" || exit

  git submodule init lib/freeglut
  git submodule init lib/glew
  git submodule init lib/zlib
  git submodule init lib/physfs
  git submodule init lib/GameNetworkingSockets
  git submodule init lib/protobuf
  git submodule init lib/libpng
  git submodule init lib/SDL
  git submodule init lib/SDL_mixer

  git config submodule.freeglut.url "${srcdir}"/freeglut
  git config submodule.glew.url "${srcdir}"/glew
  git config submodule.zlib.url "${srcdir}"/zlib
  git config submodule.physfs.url "${srcdir}"/physfs
  git config submodule.GameNetworkingSockets.url "${srcdir}"/GameNetworkingSockets
  git config submodule.protobuf.url "${srcdir}"/protobuf
  git config submodule.libpng.url "${srcdir}"/libpng
  git config submodule.SDL.url "${srcdir}"/SDL
  git config submodule.SDL_mixer.url "${srcdir}"/SDL_mixer

  git -c protocol.file.allow=always submodule update --init lib/freeglut
  git -c protocol.file.allow=always submodule update --init lib/glew
  git -c protocol.file.allow=always submodule update --init lib/zlib
  git -c protocol.file.allow=always submodule update --init lib/physfs
  git -c protocol.file.allow=always submodule update --init lib/GameNetworkingSockets
  git -c protocol.file.allow=always submodule update --init lib/protobuf
  git -c protocol.file.allow=always submodule update --init lib/libpng
  git -c protocol.file.allow=always submodule update --init lib/SDL
  git -c protocol.file.allow=always submodule update --init lib/SDL_mixer

  export CFLAGS="${CFLAGS} -Wno-incompatible-pointer-types"
  export CXXFLAGS
  export CMAKE_POLICY_VERSION_MINIMUM=3.5
  export LDFLAGS
  cmake -B ../"${pkgname}"-build -S . \
    -DCMAKE_CXX_COMPILER:STRING=clang++ \
    -DCMAKE_CXX_FLAGS:STRING="${CXXFLAGS}" \
    -DCMAKE_C_COMPILER:STRING=clang \
    -DCMAKE_C_FLAGS:STRING="${CFLAGS}" \
    -DCMAKE_SKIP_RPATH=ON \
    -Wno-dev
}

build() {
  cmake --build "${pkgname}"-build
}

package() {
  install -Dm755 "${srcdir}"/"${pkgname}"-build/openjkdf2 "${pkgdir}"/usr/bin/openjkdf2

  # Desktop file
  install -Dm755 "${srcdir}"/"${pkgname}"/packaging/flatpak/org.openjkdf2.OpenJKDF2.desktop "${pkgdir}"/usr/share/applications/org.openjkdf2.OpenJKDF2.desktop

  # Icons
  install -Dm644 "${srcdir}"/"${pkgname}"/packaging/flatpak/icons/16.png "${pkgdir}"/usr/share/icons/hicolor/16x16/apps/org.openjkdf2.OpenJKDF2.png
  install -Dm644 "${srcdir}"/"${pkgname}"/packaging/flatpak/icons/24.png "${pkgdir}"/usr/share/icons/hicolor/24x24/apps/org.openjkdf2.OpenJKDF2.png
  install -Dm644 "${srcdir}"/"${pkgname}"/packaging/flatpak/icons/32.png "${pkgdir}"/usr/share/icons/hicolor/32x32/apps/org.openjkdf2.OpenJKDF2.png
  install -Dm644 "${srcdir}"/"${pkgname}"/packaging/flatpak/icons/48.png "${pkgdir}"/usr/share/icons/hicolor/48x48/apps/org.openjkdf2.OpenJKDF2.png
  install -Dm644 "${srcdir}"/"${pkgname}"/packaging/flatpak/icons/64.png "${pkgdir}"/usr/share/icons/hicolor/64x64/apps/org.openjkdf2.OpenJKDF2.png
  install -Dm644 "${srcdir}"/"${pkgname}"/packaging/flatpak/icons/96.png "${pkgdir}"/usr/share/icons/hicolor/96x96/apps/org.openjkdf2.OpenJKDF2.png
  install -Dm644 "${srcdir}"/"${pkgname}"/packaging/flatpak/icons/128.png "${pkgdir}"/usr/share/icons/hicolor/128x128/apps/org.openjkdf2.OpenJKDF2.png
  install -Dm644 "${srcdir}"/"${pkgname}"/packaging/flatpak/icons/192.png "${pkgdir}"/usr/share/icons/hicolor/192x192/apps/org.openjkdf2.OpenJKDF2.png
  install -Dm644 "${srcdir}"/"${pkgname}"/packaging/flatpak/icons/256.png "${pkgdir}"/usr/share/icons/hicolor/256x256/apps/org.openjkdf2.OpenJKDF2.png
  install -Dm644 "${srcdir}"/"${pkgname}"/packaging/flatpak/icons/384.png "${pkgdir}"/usr/share/icons/hicolor/384x384/apps/org.openjkdf2.OpenJKDF2.png
  install -Dm644 "${srcdir}"/"${pkgname}"/packaging/flatpak/icons/512.png "${pkgdir}"/usr/share/icons/hicolor/512x512/apps/org.openjkdf2.OpenJKDF2.png
  install -Dm644 "${srcdir}"/"${pkgname}"/packaging/icon.png "${pkgdir}"/usr/share/icons/hicolor/1024x1024/apps/org.openjkdf2.OpenJKDF2.png

  # License
  install -Dm644 "${srcdir}"/"${pkgname}"/LICENSE.md "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}
