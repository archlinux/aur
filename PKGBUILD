# Maintainer: Alberto Sánchez Molero <alsamolero at gmail.com>
# Contributor: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: TDY <tdy@gmx.com>

pkgname=moneymanagerex-git
_gitname=moneymanagerex
pkgver=1.3.5
pkgrel=1
pkgdesc="MoneyManagerEx 1.3.5 with DB v.7 An easy-to-use personal finance suite. This package will always point to the newest stable version."
arch=('x86_64')
url="http://www.moneymanagerex.org/"
license=('GPL')
depends=('wxgtk3' 'webkit2gtk') 
makedepends=('cmake' 'fakeroot' 'file' 'gawk' 'gcc' 'gettext' 'git' 'lsb-release' 'make' 'pkg-config' 'rapidjson')
optdepends=('cups: for printing support')
replaces=('mmex')
provides=('moneymanagerex')
conflicts=('moneymanagerex')
source=(git+https://github.com/moneymanagerex/moneymanagerex.git#branch=v1.3.5)
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_gitname"
	printf "%s" "$(git describe --long --tag | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
  cd "$srcdir/$_gitname"
  mkdir -p build
  git submodule update --init
}

build() {
  cd "$srcdir/$_gitname/build"
  cmake -DCMAKE_BUILD_TYPE=Release -DwxWidgets_CONFIG_EXECUTABLE=/usr/bin/wx-config-gtk3 ..
  cmake --build . --target package
}

package() {
  cd "$srcdir/$_gitname/build"

  make DESTDIR="${pkgdir}" install
}
