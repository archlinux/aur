# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Contributor: dexterlb <dexterlb@qtrp.org>

_pkgname=openfec
pkgname="${_pkgname}-roc"
_pkgver=1.4.2
pkgver=1.4.2.4
pkgrel=1
pkgdesc="Open Forward Erasure Codes (ROC fork)"
arch=('x86_64' 'i686' 'aarch64' 'armv7l' 'armv6l' 'armv7h' 'armv6h')
url="https://${_pkgname}.org"
license=('CeCill')
depends=()
makedepends=('cmake')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/roc-streaming/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('691e3ec41b948e93dd34c690139624e2e20ed390e6a5f000f238491574343a16')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../${_pkgname}-${pkgver} \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DBUILD_SHARED_LIBS=ON
  make
}

package() {
  install -Dm755 ${_pkgname}-${pkgver}/bin/Release/libopenfec.so.$_pkgver "$pkgdir/usr/lib/libopenfec.so.$_pkgver"
  ln -s libopenfec.so.$_pkgver "$pkgdir/usr/lib/libopenfec.so.1"
  ln -s libopenfec.so.$_pkgver "$pkgdir/usr/lib/libopenfec.so"
  install -Dm644 ${_pkgname}-${pkgver}/LICENCE_CeCILL-C_V1-en.txt "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"

  mkdir -p "$pkgdir/usr/include"
  cp -rfT ${_pkgname}-${pkgver}/src "$pkgdir/usr/include/openfec"
  find "$pkgdir/usr/include/openfec" -type d -exec chmod 755 '{}' \;
  find "$pkgdir/usr/include/openfec" -type f -exec chmod 644 '{}' \;
  find "$pkgdir/usr/include/openfec" -type f -not -iname '*.h' -delete
  find "$pkgdir/usr/include/openfec" -type d -empty -delete
}
