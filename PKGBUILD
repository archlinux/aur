# Maintener: Popolon <popolon@popolon.org>
# Contributor: Michael Gerhaeuser <michael.gerhaeuser@gmail.com>
# Contributor: Harley Laue <losinggeneration@gmail.com>
pkgname=zerobrane-studio
pkgver=1.70
pkgrel=1
pkgdesc="A lightweight Lua-based IDE for Lua"
arch=(any)
url="http://studio.zerobrane.com/"
license=('MIT')
depends=('wxlua-svn' 'lua52-bitop' 'lua52-socket' 'hicolor-icon-theme')
makedepends=('cmake')
provides=('zerobrane-studio')
conflicts=('zerobrane-studio-git')
optdepends=('love: to debug love programs')
_github_user="pkulchenko"
_github_project="ZeroBraneStudio"
_github_rev="1.70"
source=("https://github.com/$_github_user/$_github_project/archive/${pkgver}.tar.gz"
        "zbstudio.patch"
        "user.lua")
sha512sums=('edbd0d4411585ec38b2ab746aa2a467fa10fd6ae56c3b2e27471e5905cdf1b59f61f25f18b5a2dde35813054d7ccc6107739b22f07b8c7bdd394ab3fd111fa8d'
            'c36898ce75db091ed1c9f63d18c6604faf9cc1c33eee5ea6d2c4c6d313d1c429c1ef21e3d6e85671353354e5329559e5da5cd6b53c71350bca4d30a42f1233ad'
            '2edc1ba142cc13e49a6b429e4b240eab2bfc252b55c90b95d288d72a1175c99e4aef5dffd1be867ff2b6ed73ca6ec0de41440e5fc31f88059cc59a16aa1e7955')

prepare() {
  cd "$srcdir/$_github_project-$pkgver"

  patch -p1 < "$srcdir/zbstudio.patch"
}

build() {
  cd "$srcdir/$_github_project-$pkgver/build"

   sed -e '/check_lua_module(wx TRUE)/ s/^#*/#/' -i CMakeLists.txt
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=RelWithDebInfo \
        -DLUA_EXECUTABLE=/usr/bin/lua5.2

  make -j4
}

package() {
  cd "$srcdir/$_github_project-$pkgver/build"
  make DESTDIR="$pkgdir/" install
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  cp ../LICENSE "$pkgdir/usr/share/licenses/$pkgname"
  cp "$srcdir/user.lua" "$pkgdir/usr/share/zbstudio/cfg/user.lua"
  cp "../lualibs/lua_parser_loose.lua" "$pkgdir/usr/share/zbstudio/lualibs/"
  cp "../lualibs/lua_lexer_loose.lua" "$pkgdir/usr/share/zbstudio/lualibs/"
}

# vim:set ts=2 sw=2 et:
