# Maintainer: 
# Contributor: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Eugene Tan <jmingtan at gmail dot com>

pkgname=librocket
pkgver=1.2.1
pkgrel=4
pkgdesc="The HTML/CSS User Interface library"
arch=('i686' 'x86_64')
url="http://librocket.com"
license=('MIT')
depends=('boost' 'freetype2' 'python2' 'libgl' 'glu')
makedepends=('cmake' 'mesa')
conflicts=('librocket-git')
source=("https://github.com/libRocket/libRocket/archive/release-$pkgver.tar.gz")
sha256sums=('05c92515031ebfa5b1e9421d88116a60f815818c97004947a16ce6b4c77563a7')

prepare() {
  # fix samples folder
  sed 's|opt/Rocket/Samples|share/librocket/samples|' -i \
    libRocket-release-$pkgver/Build/CMakeLists.txt
}

build() {
  cd libRocket-release-$pkgver/Build
  cmake -DCMAKE_INSTALL_PREFIX="" -DBUILD_SAMPLES=ON \
    -DBUILD_PYTHON_BINDINGS=ON -DPYTHON_EXECUTABLE=/usr/bin/python2 .
  make
}

package() {
  cd libRocket-release-$pkgver
  make -C Build install DESTDIR="$pkgdir/usr"

  # doc
  install -d "$pkgdir"/usr/share/doc/librocket
  install -m644 readme.md changelog.txt "$pkgdir"/usr/share/doc/librocket
  # license
  install -d "$pkgdir"/usr/share/licenses/librocket
  tail -n20 readme.md > "$pkgdir"/usr/share/licenses/librocket/LICENSE.md
}
