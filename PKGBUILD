# Maintainer: Blair Bonnett <blair dot bonnett @ gmail dot com>

pkgname=dust3d
pkgver=1.0.0_rc.6
_pkgver="${pkgver//_/-}"
pkgrel=1
pkgdesc="3D watertight modeling software"
url="https://dust3d.org/"
license=('MIT')
depends=('qt5-base' 'cgal')
makedepends=('boost' 'cmake' 'qt5-tools')
arch=('x86_64')

source=(
  "dust3d-$_pkgver.tar.gz::https://github.com/huxingyi/dust3d/archive/$_pkgver.tar.gz"
  'dust3d.desktop'
)
sha256sums=(
  '171a12dad39ffd40551126e304a05f036958145fab2a45631929831e2c6bbee9'
  'f4742bc1a2795b435f8343f20516763522b8f710fefbb3e75ce7a02ea634a691'
)

prepare() {
  cd "$srcdir/dust3d-$_pkgver/thirdparty/instant-meshes"
  mkdir build
  cd build
  cmake ../

  cd "$srcdir/dust3d-$_pkgver"
  qmake -config release "QMAKE_LFLAGS+=-Wl,--sort-common,--as-needed,-z,relro,-z,now" dust3d.pro
}

build() {
  cd "$srcdir/dust3d-$_pkgver/thirdparty/instant-meshes/build"
  make

  cd "$srcdir/dust3d-$_pkgver"
  make
}

package() {
  install -t "$pkgdir/usr/share/applications" -Dm644 dust3d.desktop
  cd "$srcdir/dust3d-$_pkgver"
  install -t "$pkgdir/usr/bin" -D dust3d
  install -t "$pkgdir/usr/share/licenses/dust3d" -Dm644 LICENSE
}
