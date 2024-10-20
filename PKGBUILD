# Maintainer: Martin Dünkelmann <nc-duenkekl3 at netcologne.de>

pkgname=moneymanagerex
pkgver=1.8.0
pkgrel=10
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
source=("git+https://github.com/moneymanagerex/moneymanagerex.git#tag=v${pkgver}"
              "git+https://github.com/FVANCOP/ChartNew.js.git#commit=b9e576fffa368873caed5c5dcdeb1de99637da5f"
              "git+https://github.com/moneymanagerex/LuaGlue.git#commit=ccffa36799596cc2e9a179fe18d2bf6ce07ff09a"
              "git+https://github.com/apexcharts/apexcharts.js.git#commit=2e3dcd08948d6d92517b7b9fec3aa2100ada3a57"
              "git+https://github.com/moneymanagerex/html-template.git#commit=e43bec4c0e648a5311aaae4211834cdc085178a4"
              "git+https://github.com/fmtlib/fmt.git#commit=b6f4ceaed0a0a24ccf575fab6c56dd50ccf6f1a9"
              "git+https://github.com/lua/lua.git#commit=d71a548685eb3ac5ea598d6a9e7481389c558808"
              "git+https://github.com/Tencent/rapidjson.git#commit=8f4c021fa2f1e001d2376095928fc0532adf2ae6"
              "git+https://github.com/utelle/wxsqlite3.git#commit=7bbd8a15f9fc0fdb81e3421a0fab90a63a6f0461"
              "git+https://github.com/moneymanagerex/database.git#commit=c9616b8403bf1cdb9441d675d052d036efab8cf3"
              "git+https://github.com/moneymanagerex/general-reports.git#commit=a84b292b301b79cb7e5145bf8b1bed285235c620"
              "git+https://github.com/moneymanagerex/themes.git#commit=9704a6a597bafebe0048d2f8aa8b08aaaf42c62f")
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
