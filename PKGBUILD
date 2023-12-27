# Maintainer: Martin Dünkelmann <nc-duenkekl3 at netcologne.de>

pkgname=moneymanagerex
pkgver=1.7.0
pkgrel=1
pkgdesc="MoneyManagerEx is an easy-to-use personal finance suite. This package will always point to the newest tagged version."
arch=('x86_64')
url="http://www.moneymanagerex.org/"
license=('GPL')
depends=('wxwidgets-gtk3' 'webkit2gtk')
makedepends=('curl' 'cmake' 'fakeroot' 'file' 'gawk' 'gcc' 'gettext' 'git' 'jq' 'lsb-release' 'make' 'pkg-config' 'rapidjson')
optdepends=('cups: for printing support')
replaces=('mmex')
provides=('moneymanagerex')
conflicts=('moneymanagerex-git')
source=(git+https://github.com/moneymanagerex/moneymanagerex.git)
sha512sums=('SKIP')
_github_api_uri=https://api.github.com/repos/moneymanagerex/moneymanagerex/releases/latest

prepare() {
  cd "${srcdir}"/moneymanagerex

  git checkout tags/v${pkgver}
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
