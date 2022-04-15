# Maintainer: Paul Hentschel <aur at hpminc dot com>

pkgname=camotics-git
pkgver=r954.c0072b6
pkgrel=1
pkgdesc="3-axis NC machining simulation software"
arch=('x86_64')
url="http://camotics.org/"
license=('GPL2')
depends=(
  'v8-r'
  'qt5-websockets'
  'cairo'
  'desktop-file-utils'
)
makedepends=(
  'git'
  'scons'
  'python-six'
  'qt5-tools'
  'cbang-git'
)
provides=('camotics')
conflicts=('camotics')
_commit="master"
source=(
  "${pkgname%-*}::git+https://github.com/CauldronDevelopmentLLC/CAMotics.git#commit=$_commit"
  "0001_mime.patch"
)
sha256sums=('SKIP'
            '162df92ac2523d561cdd82c87360b17ee2d715cfd567bcb8d00ae528994151e9')

pkgver() {
	cd "${pkgname%-*}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${pkgname%-*}"
  patch -p1 -i "../0001_mime.patch"
}

build() {
  cd "${pkgname%-*}"
  mkdir -p build
  CBANG_HOME=/opt/cbang scons cxxstd="c++14" linkflags=$LDFLAGS
}

package() {
  cd "${pkgname%-*}"
  CBANG_HOME=/opt/cbang scons install cxxstd="c++14" install_prefix="$pkgdir/usr" 
}

# vim:set ts=2 sw=2 et:
