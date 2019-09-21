# Maintainer: Michael Straube <michael.straube@posteo.de>
# Contributor: Sebastian Wolf <fatmike303 at googlemail dot com>

pkgname=chipmachine-git
pkgver=1.4b3.r68.g720fad4
pkgrel=1
pkgdesc='Demoscene/Retro Music Player (development version)'
arch=('x86_64')
url='https://github.com/sasq64/chipmachine'
license=('MIT')
depends=('mpg123' 'glew' 'glfw' 'curl' 'fftw')
makedepends=('git' 'cmake' 'vim')
provides=('chipmachine')
conflicts=('chipmachine')
source=("git+https://github.com/sasq64/chipmachine.git"
        "git+https://github.com/sasq64/apone.git"
        "git+https://github.com/sasq64/musicplayer.git"
        "chipmachine-rpath.patch"
        "apone-cmake.patch"
        "musicplayer-cmake.patch")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            '87c5c9e1686b512a31b12204c800eab6b576fdcbec29f51737d0387a58a90fe4'
            '82ac668d5f66059ac5b7e1d8e2ae20c38bbbd8471c4d3d1be6d9165f781b7eca'
            '62540b754f09016166b9e005c6ac68af2049d216e431e7452a1594e22d6a2578')

pkgver() {
  cd chipmachine
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
   mkdir -p build
   # remove insecure rpath
   patch -p0 -i chipmachine-rpath.patch
   # fix build with cmake >= 3.14.0
   patch -p0 -i apone-cmake.patch
   patch -p0 -i musicplayer-cmake.patch
}

build() {
  cd build
  cmake ../chipmachine
  make
}

package() {
  cd chipmachine
  install -Dm755 ../build/chipmachine "$pkgdir"/usr/bin/chipmachine
#  install -Dm755 ../build/cm "$pkgdir"/usr/bin/cm
  install -d "$pkgdir"/usr/share/chipmachine
  cp -r data lua "$pkgdir"/usr/share/chipmachine/
  install -Dm644 ../apone/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
