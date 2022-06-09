# Maintainer: Alexandre Bury <alexandre.bury@gmail.com>

pkgname=csfml-git
pkgver=2.5.1.r4.g980a165
pkgrel=1
pkgdesc='C bindings for sfml'
arch=('i686' 'x86_64')
url='https://www.sfml-dev.org/'
license=('custom:zlib')
depends=('sfml-git')
makedepends=('git' 'cmake' 'doxygen' 'ninja')
conflicts=('csfml')
provides=('csfml')
source=('csfml-git::git+https://github.com/SFML/CSFML.git')
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$pkgname"

  cmake . \
      -Bbuild \
      -GNinja \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DCSFML_BUILD_DOC=true
  ninja -C build
  ninja -C build doc
}

package() {
  cd "$pkgname"

  DESTDIR="$pkgdir/" ninja -C build install

  install -Dm644 license.md ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
