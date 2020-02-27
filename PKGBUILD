# Maintainer: Emeric Grange <emeric.grange@gmail.com>
# Created: 17/10/2019

# The upstream software is not package friendly yet, so instead of rewriting its
# entire build system, we just built it as is and copy it into /opt/shadered-git.
# If you want to help improve or maintain this package please let me know!

pkgname=shadered-git
pkgver=1.3.0_441.b0195f0
pkgrel=1
pkgdesc="SHADERed is a lightweight tool for creating and testing HLSL and GLSL shaders."
arch=("x86_64")
url="https://github.com/dfranx/SHADERed"
license=("MIT")
depends=(assimp glew glm gtk3 sdl2 sfml)
makedepends=(cmake git)

source=("git+https://github.com/dfranx/SHADERed.git"
        "SHADERed-git.desktop")
sha256sums=('SKIP'
            'f4a70a686bf9c017ce0454322e27aeceb6d9fcf57bbd7011f7678bebcc1fb866')

pkgver() {
    cd "$srcdir/SHADERed"
    echo "1.3.0_$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd SHADERed/
  git submodule update --init --recursive
  cmake .
  make
}

package() {
  cd "$srcdir/SHADERed"
  #install -Dm644 "$srcdir/SHADERed/bin/icon.png" "$pkgdir/usr/share/pixmap/shadered.png"
  install -Dm644 "$srcdir/SHADERed-git.desktop" "$pkgdir/usr/share/applications/shadered-git.desktop"
  mkdir -p "$pkgdir/opt/$pkgname"
  mv $srcdir/SHADERed/bin/* "$pkgdir/opt/$pkgname"
}
