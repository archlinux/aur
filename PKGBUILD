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
        "git+https://github.com/sasq64/musicplayer.git")
sha512sums=('SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  cd chipmachine
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  mkdir -p build
  # remove insecure rpath
  sed -i '/link_directories(\/usr\/local\/lib.*/d' chipmachine/CMakeLists.txt
  # fix linking errors with cmake >= 3.14.0
  sed -i '/target_link_libraries(uade PRIVATE ws2_32)/d' musicplayer/plugins/uadeplugin/CMakeLists.txt
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
