# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=assetfolio-git
pkgver=1.5.r0.ga497672
pkgrel=1
pkgdesc="An All-in-One Asset Tracker and Watchlist Application that keeps your asset data private"
arch=('x86_64')
url='https://gitlab.com/ywiyogo/assetfolio'
license=('GPL3')
depends=('qt5-charts')
makedepends=('qt5-charts')
source=("${pkgname%-git}::git+https://gitlab.com/ywiyogo/assetfolio")
sha256sums=('SKIP')

pkgver() {
  cd assetfolio
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd assetfolio
  mkdir -p build/
  git submodule update --init --recursive
  cd submodules
  git clone https://github.com/whoshuu/cpr.git
}

build() {
  cd assetfolio/build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd assetfolio/build
  make DESTDIR="${pkgdir}" install
  install -d "${pkgdir}/usr/share/applications"
  mv "${pkgdir}/usr/AssetFolio.desktop" "${pkgdir}/usr/share/applications/"
}