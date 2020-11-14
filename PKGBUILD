# Maintainer: Artem Klevtsov <a.a.klevtsov@gmail.com>

_pkgname=pentobi
pkgname=pentobi-git
pkgver=18.3.r129.ge10599e9
pkgrel=1
pkgdesc="Computer opponent for the board game Blokus. "
arch=('x86_64')
url="https://pentobi.sourceforge.io"
license=('GPL3')
depends=('qt5-quickcontrols2' 'qt5-webview' 'kio')
makedepends=('git' 'appstream' 'cmake' 'docbook-xsl' 'extra-cmake-modules'
             'itstool' 'kio' 'qt5-tools')
optdepends=('kio: KDE thumbnailer')
source=("${_pkgname}::git+https://github.com/enz/pentobi.git")
sha256sums=('SKIP')
conflicts=("${_pkgname}")
replaces=("${_pkgname}")

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  mkdir -p build
}

build() {
  cd "${srcdir}/${_pkgname}/build"
  cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DPENTOBI_BUILD_KDE_THUMBNAILER=ON \
    -DBUILD_TESTING=ON \
    -DDOCBOOKXSL_DIR=/usr/share/xml/docbook/xsl-stylesheets-1.79.2
  make
}

check() {
  cd "${srcdir}/${_pkgname}/build"
  make test
}

package() {
  cd "${srcdir}/${_pkgname}/build"
  make DESTDIR="${pkgdir}/" install
}
