# Maintainer: Lukas1818 aur at lukas1818 dot de
# Contributor: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Joe Davison <joe@warhaggis.com>

pkgname=lgogdownloader-headless-git
pkgver=3.7.r13.g5c64fc3
pkgrel=1
pkgdesc="Open source downloader for GOG.com games, uses the GOG.com API"
url="https://sites.google.com/site/gogdownloader/"
arch=(x86_64 i686 pentium4)
license=('custom:WTFPL')
depends=(boost-libs jsoncpp tinyxml2 rhash htmlcxx curl)
makedepends=(git help2man cmake boost)
provides=('lgogdownloader' 'lgogdownloader-git')
conflicts=('lgogdownloader' 'lgogdownloader-git' 'lgogdownloader-headless')
source=("git+https://github.com/Sude-/lgogdownloader.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-headless-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${pkgname%-headless-git}"
  [[ -d build ]] || mkdir build
}

build() {
  cd "${srcdir}/${pkgname%-headless-git}/build"
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release

  make
}

package() {
  cd "${srcdir}/${pkgname%-headless-git}/build"
  make DESTDIR=$pkgdir install
  install -Dm644 ../COPYING ${pkgdir}/usr/share/licenses/${pkgname}/COPYING
}
