# Maintainer: Logan Koester <logan@logankoester.com>
pkgname=tiled-git
pkgver=v1.3.4.r310.gc547aa71
pkgrel=1
pkgdesc='A general purpose tile map editor, built to be flexible and easy to use'
arch=('x86_64')
url='http://www.mapeditor.org'
license=('GPL')
replaces=('tiled')
depends=('qt5-base' 'libgl' 'gtk-update-icon-cache' 'shared-mime-info' 'desktop-file-utils' 'libxkbcommon-x11' 'qt5-declarative' 'qt5-quickcontrols2' 'zstd')
makedepends=('mesa' 'qt5-tools' 'python3' 'qbs' 'git')
optdepends=('python3: Python plugin')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(tiled::git+https://github.com/bjorn/tiled.git#branch=master)
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  qbs setup-toolchains --detect
}

build() {
  #qmake -r INSTALL_HEADERS=yes RPATH=no PREFIX=/usr
  cd "$srcdir/${pkgname%-git}"
  qbs qbs.installPrefix:"/usr" projects.Tiled.useRPaths:false
}

package() {
  cd "$srcdir/${pkgname%-git}"
  qbs install --install-root $pkgdir
}
