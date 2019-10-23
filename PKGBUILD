# Maintainer: Emeric Grange <emeric.grange@gmail.com>
# Created: 17/10/2019

# The upstream software is not package friendly, so instead of rewriting its
# entire build system, we just built it as is and copy it into /opt/shadered.

pkgname=shadered-git
pkgver=1.2.3_309.2120dce
pkgrel=1
pkgdesc="SHADERed is a lightweight tool for creating and testing HLSL and GLSL shaders."
arch=("x86_64")
url="https://github.com/dfranx/SHADERed"
license=("MIT")
depends=(sdl2 sfml glew glm assimp gtk3)
makedepends=(cmake git)

source=("git+https://github.com/dfranx/SHADERed.git"
        "SHADERed.desktop")
sha256sums=('SKIP'
            '518197ae7e41beeccd432423bbc7103236ec48eec1dd97643ac2f7fa2e468d18')

pkgver() {
    cd "$srcdir/SHADERed"
    echo "1.2.3_$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd SHADERed/
  git submodule init
  git submodule update
  cmake .
  make
}

package() {
  cd "$srcdir/SHADERed"
  #install -Dm644 "$srcdir/SHADERed/bin/icon.png" "$pkgdir/usr/share/pixmap/shadered.png"
  install -Dm644 "$srcdir/SHADERed.desktop" "$pkgdir/usr/share/applications/shadered.desktop"
  mkdir -p "$pkgdir/opt/$pkgname"
  mv $srcdir/SHADERed/bin/* "$pkgdir/opt/$pkgname"
}
