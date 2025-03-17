# Maintainer: oi_wtf <brainpower at mailbox dot org>

pkgname=sfml-git
pkgver=3.0.0.r80.g817c2ad2b
pkgrel=1
pkgdesc="A simple, fast, cross-platform, and object-oriented multimedia API"
arch=('i686' 'x86_64')
url="http://www.sfml-dev.org/"
license=('Zlib')
depends=('libsndfile' 'libxrandr' 'openal' 'glew' 'freetype2' 'libx11' 'libxcursor' 'libxi')
makedepends=('mesa' 'cmake' 'doxygen' 'systemd' 'ninja' 'git')
provides=('libsfml-window.so' 'libsfml-network.so' 'libsfml-system.so'
          'libsfml-audio.so' 'libsfml-graphics.so' 'sfml')
conflicts=('sfml')

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

  cmake -B build -S SFML -G Ninja \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DBUILD_SHARED_LIBS=ON \
      -DSFML_USE_SYSTEM_DEPS=ON \
      -DSFML_BUILD_EXAMPLES=OFF \
      -DSFML_BUILD_DOC=OFF \
      -DSFML_INSTALL_PKGCONFIG_FILES=ON \
      -DSFML_PKGCONFIG_INSTALL_DIR=lib/pkgconfig
  # dont know why, but build fails if SFML_PKGCONFIG_INSTALL_DIR
  # is not set explicitly to what sfml's cmake code would set it anyway

  ninja -C build
  #ninja -C build doc
}

package() {
  DESTDIR="$pkgdir/" ninja -C build install

  install -Dm644 SFML/license.md ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md
}

# vim:set ts=2 sw=2 et:
