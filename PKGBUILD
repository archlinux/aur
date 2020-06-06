# Maintainer: Blair Bonnett <blair dot bonnett @ gmail dot com>

pkgname=dust3d
_pkgver=1.0.0-rc.6
pkgver="${_pkgver//-/}"
pkgrel=2
pkgdesc="3D watertight modeling software"
url="https://dust3d.org/"
license=('MIT')
depends=('qt5-base' 'cgal')
makedepends=('boost' 'cmake' 'qt5-tools')
arch=('x86_64')

source=(
  "dust3d-$_pkgver.tar.gz::https://github.com/huxingyi/dust3d/archive/$_pkgver.tar.gz"
  'qt5.15_painterpath.patch'
  'dust3d.desktop'
)
sha256sums=(
  '171a12dad39ffd40551126e304a05f036958145fab2a45631929831e2c6bbee9'
  '038dc92c464e9ca768fa2d21ee5272a87e5ed6bf0b1293582905cd56768e23c7'
  'f4742bc1a2795b435f8343f20516763522b8f710fefbb3e75ce7a02ea634a691'
)

prepare() {
  cd "dust3d-$_pkgver"
  patch -p0 -i "$srcdir/qt5.15_painterpath.patch"  # Include needed with Qt 5.15.0.
}

build() {
  cd "$srcdir/dust3d-$_pkgver/thirdparty/instant-meshes"
  cmake -B build
  make -C build

  cd "$srcdir/dust3d-$_pkgver"
  qmake -config release "QMAKE_LFLAGS+=-Wl,--sort-common,--as-needed,-z,relro,-z,now" dust3d.pro
  make
}

package() {
  install -t "$pkgdir/usr/share/applications" -Dm644 dust3d.desktop
  cd "$srcdir/dust3d-$_pkgver"
  install -t "$pkgdir/usr/bin" -D dust3d
  install -t "$pkgdir/usr/share/licenses/dust3d" -Dm644 LICENSE
}
