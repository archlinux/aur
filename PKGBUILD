# Maintainer: oi_wtf <brainpower at mailbox dot org>

pkgname=sfml-git
pkgver=2.6.0.r637.g9d1d9cde
pkgrel=1
pkgdesc="A simple, fast, cross-platform, and object-oriented multimedia API"
arch=('i686' 'x86_64')
url="http://www.sfml-dev.org/"
license=('zlib')
depends=('libsndfile' 'libxrandr' 'libxcursor' 'libjpeg' 'openal' 'glew' 'freetype2' 'xcb-util-image')
makedepends=('mesa' 'cmake' 'doxygen' 'git')
provides=('sfml')
conflicts=('sfml')
replaces=('sfml')
options=('debug')

source=("git+https://github.com/SFML/SFML.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/SFML"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/SFML"
}

build() {
  cd "$srcdir/SFML"

  cmake -DCMAKE_INSTALL_PREFIX=/usr . \
        -DCMAKE_BUILD_TYPE=RelWithDebugInfo \
        -DBUILD_SHARED_LIBS=ON \
        -DSFML_BUILD_DOC=OFF \
        -DSFML_BUILD_EXAMPLES=OFF \
        -DSFML_INSTALL_PKGCONFIG_FILES=ON
        # prints a warning if pkg-config not supported
  make
  make doc
}

package() {
  cd "$srcdir/SFML"

  make DESTDIR="$pkgdir/" install

  install -Dm644 ./license.md ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md

}

# vim:set ts=2 sw=2 et:
