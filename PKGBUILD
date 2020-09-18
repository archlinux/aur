# Maintainer: Michael Straube <michael.straubej@gmail.com>
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
        "musicplayer-cmake314.patch"
        "chipmachine-gcc10.patch")
sha512sums=('SKIP'
            'SKIP'
            'SKIP'
            '0ea7b7d1cd46c7adafebcffefe1a92c5bfbdc4e9aa8849a617aff78cdceb216d9007649c1e80a616c650196dba4dd564215aa48b89c3b907fd8cd6561a1840bf'
            '1cf5640b76f7ca3a03b61d70cfccc9e7600e9f2ed15193e55feed6b07c8501fff32999963e5fa751556b72e1ff85f6efdc8d0623a33883f9ddde640018e78c4f')

pkgver() {
  cd chipmachine
  git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./g'
}

prepare() {
  # Fix linking errors with cmake >= 3.14.0
  patch -d musicplayer -Np1 < musicplayer-cmake314.patch
  # Fix build errors with gcc10
  patch -d chipmachine -Np1 < chipmachine-gcc10.patch
}

build() {
  # Workaround for gcc10 linking errors
  export CFLAGS+=" -fcommon"

  cmake -B build -S chipmachine \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_SKIP_RPATH=YES
  make -C build
}

package() {
  cd chipmachine
  install -Dm755 ../build/chipmachine "$pkgdir"/usr/bin/chipmachine
  install -d "$pkgdir"/usr/share/chipmachine
  cp -r data lua "$pkgdir"/usr/share/chipmachine/
  install -Dm644 ../apone/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
