# Maintainer: Martin Dünkelmann <nc-duenkekl3 at netcologne.de>

pkgname=moneymanagerex-git
pkgver=v1.6.3.r1461.g355d4cb42
pkgrel=1
pkgdesc="MoneyManagerEx is an easy-to-use personal finance suite. This package will always point to the newest commit."
arch=('x86_64')
url="http://www.moneymanagerex.org/"
license=('GPL')
depends=('wxwidgets-gtk3' 'webkit2gtk')
makedepends=('cmake' 'fakeroot' 'file' 'gawk' 'gcc' 'gettext' 'git' 'jq' 'lsb-release' 'make' 'pkg-config' 'rapidjson')
optdepends=('cups: for printing support')
replaces=('mmex')
provides=('moneymanagerex')
conflicts=('moneymanagerex')
source=(git+https://github.com/moneymanagerex/moneymanagerex.git)
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}"/moneymanagerex

  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}"/moneymanagerex

  git submodule update --init --recursive
}

build() {
  cd "${srcdir}"/moneymanagerex

  # Disable all warnings when building, then configure CMake
  export CXXFLAGS=-w
  
  cmake -DCMAKE_BUILD_TYPE=None -DCMAKE_INSTALL_PREFIX='/usr' -Wno-dev -DwxWidgets_CONFIG_EXECUTABLE=/usr/bin/wx-config .
  
  cmake --build .
}

package() {
  cd "${srcdir}"/moneymanagerex

  make DESTDIR="${pkgdir}" install
}
