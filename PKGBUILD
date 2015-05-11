# Maintainer: oi_wtf <brainpower at mailbox dot org>

pkgname=sfml-git
pkgver=2.3.r0.g80214d1
pkgrel=1
pkgdesc="A simple, fast, cross-platform, and object-oriented multimedia API"
arch=('i686' 'x86_64')
url="http://www.sfml-dev.org/"
license=('zlib')
depends=('libsndfile' 'libxrandr' 'libjpeg' 'openal' 'glew' 'freetype2')
makedepends=('mesa' 'cmake' 'doxygen' 'git')
provides=('sfml')
conflicts=('sfml')
replaces=('sfml')
options=('debug')

source=("git+https://github.com/SFML/SFML.git"
        "0001-fix_cmake_module_install_path.patch")
sha256sums=('SKIP'
            'c0be2636b1d342f636f2587e043dbfa8becdd8d9c65044cf7749ab4b2c81eb47')

pkgver() {
  cd "${srcdir}/SFML"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/SFML"
  patch -p0 -i "$srcdir/0001-fix_cmake_module_install_path.patch"
}

build() {
  cd "$srcdir/SFML"

  cmake -DCMAKE_INSTALL_PREFIX=/usr . \
        -DCMAKE_BUILD_TYPE=RelWithDebugInfo \
        -DBUILD_DOC=true \
        -DBUILD_EXAMPLES=false
  make
  make doc
}

package() {
  cd "$srcdir/SFML"

  make DESTDIR="$pkgdir/" install

  install -Dm644 ./license.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

}

# vim:set ts=2 sw=2 et:
