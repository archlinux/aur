# Maintainer: Emeric Grange <emeric.grange@gmail.com>
# Created: 17/10/2019

# The upstream software is not package friendly yet, so instead of rewriting its
# entire build system, we just built it as is and copy it into /opt/shadered-git.
# If you want to help improve or maintain this package please let me know!

pkgname=shadered-git
pkgver=1.3.1_485.d380c1b
pkgrel=1
pkgdesc="SHADERed is a lightweight tool for creating and testing HLSL and GLSL shaders."
arch=("x86_64")
url="https://github.com/dfranx/SHADERed"
license=("MIT")
depends=(assimp glew glm gtk3 sdl2 sfml)
makedepends=(cmake git)
provides=('shadered')

source=("git+https://github.com/dfranx/SHADERed.git"
        "SHADERed-git.desktop"
        "SHADERed-git.sh")
sha256sums=('SKIP'
            '9468e6cdf0097616def7415ef0d47abcd9f9c444fa5f6b23a5a4832d62209ea4'
            '8180864b00b0d413cc7306496ba184b9c1d2ca2e19e1164d6f16dd710c2c2097')

pkgver() {
    cd "$srcdir/SHADERed"
    echo "1.3.1_$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd SHADERed/
  git submodule update --init --recursive
  cmake .
  make
}

package() {
  cd "$srcdir/SHADERed"
  install -Dm644 "$srcdir/SHADERed/Misc/Icon/icon.svg" "$pkgdir/usr/share/pixmaps/$pkgname.svg"
  install -Dm644 "$srcdir/SHADERed-git.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm755 "$srcdir/SHADERed-git.sh" "$pkgdir/usr/bin/$pkgname"
  mkdir -p "$pkgdir/opt/$pkgname"
  mv $srcdir/SHADERed/bin/* "$pkgdir/opt/$pkgname"
}
