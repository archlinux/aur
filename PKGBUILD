# Maintainer: Martin Dünkelmann <nc-duenkekl3 at netcologne.de>

pkgname=moneymanagerex
pkgver=1.8.0
pkgrel=9
pkgdesc="MoneyManagerEx is an easy-to-use personal finance suite. This package will always point to the newest tagged version."
arch=('x86_64')
url="http://www.moneymanagerex.org/"
license=('GPL')
depends=('wxwidgets-gtk3' 'webkit2gtk-4.1')
makedepends=('appstream' 'cmake' 'fakeroot' 'file' 'gawk' 'gcc' 'gettext' 'git' 'jq' 'lsb-release' 'make' 'pkg-config' 'rapidjson')
optdepends=('cups: for printing support')
replaces=('mmex')
provides=('moneymanagerex')
conflicts=('moneymanagerex-git')
source=(git+https://github.com/moneymanagerex/moneymanagerex.git#tag=v${pkgver}
              git+https://github.com/FVANCOP/ChartNew.js
              git+https://github.com/moneymanagerex/LuaGlue.git
              git+https://github.com/apexcharts/apexcharts.js.git
              git+https://github.com/moneymanagerex/html-template.git
              git+https://github.com/fmtlib/fmt
              git+https://github.com/lua/lua.git
              git+https://github.com/Tencent/rapidjson
              git+https://github.com/utelle/wxsqlite3.git
              git+https://github.com/moneymanagerex/database
              git+https://github.com/moneymanagerex/general-reports
              git+https://github.com/moneymanagerex/themes.git)
sha512sums=('SKIP'
                        'SKIP'
                        'SKIP'
                        'SKIP'
                        'SKIP'
                        'SKIP'
                        'SKIP'
                        'SKIP'
                        'SKIP'
                        'SKIP'
                        'SKIP'
                        'SKIP')

prepare() {
  cd "${srcdir}"/moneymanagerex
  
  git submodule init
  git config submodule.3rd/ChartNew.js.url "$srcdir/ChartNew.js"
  git config submodule.3rd/LuaGlue.url "$srcdir/LuaGlue"
  git config submodule.3rd/apexcharts.js.url "$srcdir/apexcharts.js"
  git config submodule.3rd/cgitemplate.url "$srcdir/html-template"
  git config submodule.3rd/fmt.url "$srcdir/fmt"
  git config submodule.3rd/lua.url "$srcdir/lua"
  git config submodule.3rd/rapidjson.url "$srcdir/rapidjson"
  git config submodule.3rd/wxsqlite3.url "$srcdir/wxsqlite3"
  git config submodule.database.url "$srcdir/database"
  git config submodule.general-reports.url "$srcdir/general-reports"
  git config submodule.themes.url "$srcdir/themes"
  git -c protocol.file.allow=always submodule update
  
  # Fix https://github.com/moneymanagerex/moneymanagerex/issues/6693
  git cherry-pick -n df127e7e995f4746b101a79e92927b2460907ab4
  git cherry-pick -n bb98eab92d95b7315d27f4e59ae59b50587106d8
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
