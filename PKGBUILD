# Maintainer: Martin Dünkelmann <nc-duenkekl3 at netcologne.de>
# Contributor: Alberto Sánchez Molero <alsamolero at gmail.com>
# Contributor: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: TDY <tdy@gmx.com>

pkgname=moneymanagerex-git
pkgver=1.5.11
pkgrel=1
pkgdesc="MoneyManagerEx is an easy-to-use personal finance suite. This package will always point to the newest tagged version."
arch=('x86_64')
url="http://www.moneymanagerex.org/"
license=('GPL')
depends=('wxgtk3-dev' 'webkit2gtk')
makedepends=('curl' 'cmake' 'fakeroot' 'file' 'gawk' 'gcc' 'gettext' 'git' 'jq' 'lsb-release' 'make' 'pkg-config' 'rapidjson')
optdepends=('cups: for printing support')
replaces=('mmex')
provides=('moneymanagerex')
conflicts=('moneymanagerex')
source=(git+https://github.com/moneymanagerex/moneymanagerex.git)
sha512sums=('SKIP')
_github_api_uri=https://api.github.com/repos/moneymanagerex/moneymanagerex/releases/latest

pkgver() {
  curl --silent ${_github_api_uri} | jq -r '.tag_name[1:]'
}

prepare() {
  cd "${srcdir}"/moneymanagerex

  git checkout tags/$(curl --silent ${_github_api_uri} | jq -r '.tag_name')
  git submodule update --init --recursive

  # TODO Workaround: https://github.com/moneymanagerex/moneymanagerex/issues/2685
  sed -i "s/luaL_checkint(/luaL_checkinteger(/g" ./3rd/LuaGlue/include/LuaGlue/LuaGlueApplyTuple.h
}

build() {
  cd "${srcdir}"/moneymanagerex

  cmake -DCMAKE_BUILD_TYPE=Release -DwxWidgets_CONFIG_EXECUTABLE=/usr/bin/wx-config-gtk3 .
  cmake --build . --target package
}

package() {
  cd "${srcdir}"/moneymanagerex

  make DESTDIR="${pkgdir}" install
}
