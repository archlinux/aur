# $Id: PKGBUILD 200614 2016-12-21 05:43:51Z felixonmars $
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Ondrej Martinak <omartinak@gmail.com>

# bug fix package, fix Xlib crashing in sf::Window:setIcon
# https://github.com/SFML/SFML/commit/8c62390ca211e0dbc7b9233f41ba53952b80154c

_patchcommit=8c62390ca211e0dbc7b9233f41ba53952b80154c
pkgname=sfml-bugfix
pkgver=2.4.1
pkgrel=1
pkgdesc='A simple, fast, cross-platform, and object-oriented multimedia API (bug fix package)'
arch=('i686' 'x86_64')
url='http://www.sfml-dev.org/'
license=('zlib')
depends=('libsndfile' 'libxrandr' 'libjpeg' 'openal' 'glew' 'freetype2' 'libx11')
makedepends=('mesa' 'cmake' 'doxygen' 'systemd')
install=sfml.install
conflicts=('sfml')
provides=('sfml')
source=("https://github.com/LaurentGomila/SFML/archive/$pkgver.tar.gz"
        "fix-window-seticon.patch::https://github.com/LaurentGomila/SFML/commit/$_patchcommit.patch")
sha256sums=('f9d1191b02e2df1cbe296601eee20bdf56d98fb69d49fde27c6ca789eb57398e'
            '807db64d88c6f740262ef6c03ee089f85174a7b529fb0061e8f45699810382fb')

prepare() {
  cd SFML-$pkgver

  patch -p1 -i ../fix-window-seticon.patch
}

build() {
  cd SFML-$pkgver

  mkdir build && cd build
  cmake .. \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DSFML_BUILD_EXAMPLES=1 \
      -DSFML_BUILD_DOC=1 \
      -DSFML_INSTALL_PKGCONFIG_FILES=1
  make
  make doc
}

package() {
  cd SFML-$pkgver/build

  make DESTDIR="$pkgdir" install

  install -Dm644 "$pkgdir"/usr/share/SFML/cmake/Modules/FindSFML.cmake \
    "$pkgdir"/usr/share/cmake-3.7/Modules/FindSFML.cmake

  install -Dm644 ../license.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
