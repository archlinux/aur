# Maintainer: Paul Hentschel <aur at hpminc dot com>

pkgname=camotics-git
pkgver=r1012.8a867d3
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
)
sha256sums=('SKIP')
options=('!lto')

pkgver() {
	cd "${pkgname%-*}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${pkgname%-*}"
  mkdir -p build
  CBANG_HOME=/opt/cbang scons cxxstd="c++17" linkflags=$LDFLAGS
}

package() {
  cd "${pkgname%-*}"
  CBANG_HOME=/opt/cbang scons install cxxstd="c++17" install_prefix="$pkgdir/usr" 
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install build/camotics.so -D "$pkgdir/$site_packages/camotics.so"
}

# vim:set ts=2 sw=2 et:
