# Maintainer: Martin Dünkelmann <nc-duenkekl3 at netcologne.de>

pkgname=moneymanagerex
pkgver=1.8.0
pkgrel=6
pkgdesc="MoneyManagerEx is an easy-to-use personal finance suite. This package will always point to the newest tagged version."
arch=('x86_64')
url="http://www.moneymanagerex.org/"
license=('GPL')
depends=('wxwidgets-gtk3' 'webkit2gtk')
makedepends=('appstream' 'cmake' 'fakeroot' 'file' 'gawk' 'gcc' 'gettext' 'git' 'jq' 'lsb-release' 'make' 'pkg-config' 'rapidjson')
optdepends=('cups: for printing support')
replaces=('mmex')
provides=('moneymanagerex')
conflicts=('moneymanagerex-git')
source=(git+https://github.com/moneymanagerex/moneymanagerex.git#tag=v${pkgver})
sha512sums=('SKIP')

prepare() {
  cd "${srcdir}"/moneymanagerex
  
  git submodule update --init --recursive
  
  # Fix https://github.com/moneymanagerex/moneymanagerex/issues/6693
  git config user.email "you@example.com"
  git config user.name "Your Name"
  git cherry-pick df127e7e995f4746b101a79e92927b2460907ab4
  git cherry-pick bb98eab92d95b7315d27f4e59ae59b50587106d8
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
