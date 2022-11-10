# Maintainer: Clemmitt Sigler <cmsigler (dot) online (at) gmail (dot) com>

pkgname=canorus-git
pkgver=r1479.3ccb8921
pkgrel=1
pkgdesc="A free music score editor"
arch=('x86_64')
url="http://www.canorus.org/"
license=('GPL')
depends=('qt5-svg>=5.6' 'qt5-webengine>=5.6' 'alsa-lib' 'zlib' 'python>=3')
makedepends=('qt5-tools>=5.6' 'cmake>=3.5' 'swig>=3.0.8' 'git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/canorusmusic/canorus.git')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "$srcdir/${pkgname%-git}"
  # stringop-truncation will be fixes in swig, see https://github.com/swig/swig/issues/893
  export CXXFLAGS+=" -Wno-misleading-indentation -Wno-dangling-else -Wno-stringop-truncation -Wno-deprecated -Wno-deprecated-declarations"
# See https://github.com/canorusmusic/canorus/issues/182
  cmake . -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="$pkgdir"/usr \
          -DDEFAULT_DATA_DIR="/usr/share/canorus" -DNO_PYTHON=1
  make
}

package() {
  cd "$srcdir/${pkgname%-git}"
  make install
  install -d "$pkgdir"/usr/share/{applications,pixmaps}
  cp canorus.desktop "$pkgdir"/usr/share/applications
  cp "$pkgdir"/usr/share/{canorus/images/clogosm.png,pixmaps/canorus.png}
}

# vim:set ts=2 sw=2 ft=sh et:
