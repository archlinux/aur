# Maintainer: Kyle <kyle@free2.ml>
# Maintainer: Alexander Epaneshnikov <alex19ep@archlinux.org>

pkgname=('espeak-ng-git')
pkgver=1.51.r708.gff46761d
pkgrel=1
pkgdesc="Multi-lingual software speech synthesizer (development version)"
arch=('aarch64' 'armv6h' 'armv7h' 'i686' 'x86_64')
url="https://github.com/espeak-ng/espeak-ng"
license=('GPL3')
depends=('pcaudiolib' 'libsonic')
makedepends=('cmake' 'git' 'ruby-ronn-ng')
checkdepends=('python')
replaces=('espeak-ng-espeak-git' 'espeak-ng-espeak')
provides=('espeak-ng-espeak-git' 'espeak-ng-espeak' 'espeak-ng')
conflicts=('espeak-ng-espeak' 'espeak-ng' 'espeak')
source=(${pkgname%-git}::'git+https://github.com/espeak-ng/espeak-ng.git')
md5sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build -S "${pkgname%-git}" -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE='None' \
        -DFETCHCONTENT_FULLY_DISCONNECTED=ON \
        -DBUILD_SHARED_LIBS=ON \
        -DESPEAK_COMPAT=ON \
        -DESPEAK_BUILD_MANPAGES=ON \
        -Wno-dev
  cmake --build build
}

check() {
ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  rm -rv "$pkgdir"/usr/include/espeak
}
