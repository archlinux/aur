# Maintainer: Davorin Učakar <davorin.ucakar@gmail.com>

pkgname=openzone
pkgver=0.3.95+113+g36520a50
pkgrel=1
pkgdesc='Simple cross-platform FPS/RTS game engine'
url="https://ducakar.github.io/openzone-web/"
license=(GPL3)
arch=(i686 x86_64)
provides=(openzone-data)
conflicts=(openzone-data)
depends=(assimp freeimage libnoise libsquish libvorbis luajit openal opusfile
         physfs sdl2_ttf)
optdepends=('espeak: for speech synthesis'
            'zip: for building ZIP game data archives'
            'p7zip: for building 7-Zip game data archives')
makedepends=(cmake git zip)
source=("git+https://github.com/ducakar/openzone.git#commit=36520a502dec3b57ae8b879107f5a4ce8c747331"
        "git+https://github.com/ducakar/openzone-data.git"
        "git+https://github.com/FeralInteractive/gamemode.git")
sha512sums=(SKIP
            SKIP
            SKIP)

pkgver() {
  cd "$pkgname"
  git describe --tags | sed 's/^v//; s/-/+/g'
}

prepare() {
  cd "$pkgname"
  git config submodule.data.url "$srcdir/openzone-data"
  git config submodule.ext/gamemode.url "$srcdir/gamemode"
  git submodule update --init
}

build() {
  cd "$pkgname"

  cmake \
    -D CMAKE_BUILD_TYPE=Release \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D OZ_LUAJIT=ON \
    -D OZ_TOOLS=ON \
    -B build
  cmake --build build

  ./build/src/tools/ozBuild -CAZ data/ozBase
  ./build/src/tools/ozBuild -CAZ data/ozMain
  ./build/src/tools/ozBuild -CAZ data/ozMissions
  ./build/src/tools/ozBuild -CAZ data/ozTest
}

package() {
  cd "$pkgname"

  cmake --install build --prefix "$pkgdir/usr" --strip
  rm -rf "$pkgdir"/usr/{include,lib,lib64}

  install -dm755 "$pkgdir/usr/share/openzone"
  install -m644 share/openzone/*.zip "$pkgdir/usr/share/openzone"

  install -dm755 "$pkgdir/usr/share/doc/openzone"
  install -m644 AUTHORS README.md ChangeLog.md doc/*.html "$pkgdir/usr/share/doc/openzone"
}
