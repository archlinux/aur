# Maintainer: Martin Dünkelmann <nc-duenkekl3 at netcologne.de>
# Contributor: Alberto Sánchez Molero <alsamolero at gmail.com>
# Contributor: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: TDY <tdy@gmx.com>

pkgname=moneymanagerex-git
pkgver=1.3.5
pkgrel=6
pkgdesc="MoneyManagerEx is an easy-to-use personal finance suite. This package will always point to the newest stable version."
arch=('x86_64')
url="http://www.moneymanagerex.org/"
license=('GPL')
depends=('wxgtk3' 'webkit2gtk')
makedepends=('cmake' 'fakeroot' 'file' 'gawk' 'gcc' 'gettext' 'git' 'lsb-release' 'make' 'pkg-config' 'rapidjson')
optdepends=('cups: for printing support')
replaces=('mmex')
provides=('moneymanagerex')
conflicts=('moneymanagerex')
source=(git+https://github.com/moneymanagerex/moneymanagerex.git)
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --abbrev=0 | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname%-git}"
  mkdir -p build
  git submodule update --init
  # TODO Workaround: https://github.com/moneymanagerex/moneymanagerex/issues/2685
  sed -i "s/luaL_checkint(/luaL_checkinteger(/g" ./3rd/LuaGlue/include/LuaGlue/LuaGlueApplyTuple.h
}

build() {
  cd "${pkgname%-git}/build"
  cmake -DCMAKE_BUILD_TYPE=Release -DwxWidgets_CONFIG_EXECUTABLE=/usr/bin/wx-config-gtk3 ..
  cmake --build . --target package
}

package() {
  cd "${pkgname%-git}/build"

  make DESTDIR="${pkgdir}" install
}
