# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Joe Davison <joe@warhaggis.com>

pkgname=lgogdownloader-git
pkgver=3.8.r0.g9d24bd1
pkgrel=1
pkgdesc="Open source downloader for GOG.com games, uses the GOG.com API"
url="https://sites.google.com/site/gogdownloader/"
arch=(x86_64 i686 pentium4)
license=('custom:WTFPL')
depends=(boost-libs jsoncpp tinyxml2 rhash htmlcxx)
makedepends=(git help2man cmake boost)
provides=(lgogdownloader)
conflicts=(lgogdownloader)
source=("git+https://github.com/Sude-/lgogdownloader.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${pkgname%-git}"
  [[ -d build ]] || mkdir build
}

build() {
  cd "${srcdir}/${pkgname%-git}/build"
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DUSE_QT_GUI=OFF

  make
}

package() {
  cd "${srcdir}/${pkgname%-git}/build"
  make DESTDIR=$pkgdir install
  install -Dm644 ../COPYING ${pkgdir}/usr/share/licenses/${pkgname}/COPYING
}
