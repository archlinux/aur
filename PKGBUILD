# Maintainer: Michael Gerhaeuser <michael.gerhaeuser@gmail.com>
# Contributor: Harley Laue <losinggeneration@gmail.com>
pkgname=zerobrane-studio
pkgver=1.50
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
_github_rev="53fc3f0"
source=("https://github.com/$_github_user/$_github_project/tarball/${_github_rev}"
        "zbstudio.patch"
        "user.lua")
sha512sums=('d7720c4ef014da2bb661f109014fc4200a3d8cf94db10f03a563b3bcfcf01264dabbf7f6a0c2120a4dd86256e95f72673c0f86812f9feeb14d74f5e3403b3b01'
            'c36898ce75db091ed1c9f63d18c6604faf9cc1c33eee5ea6d2c4c6d313d1c429c1ef21e3d6e85671353354e5329559e5da5cd6b53c71350bca4d30a42f1233ad'
            '2edc1ba142cc13e49a6b429e4b240eab2bfc252b55c90b95d288d72a1175c99e4aef5dffd1be867ff2b6ed73ca6ec0de41440e5fc31f88059cc59a16aa1e7955')

prepare() {
  cd "$srcdir/$_github_user-$_github_project-$_github_rev"

  patch -p1 < "$srcdir/zbstudio.patch"
}

build() {
  cd "$srcdir/$_github_user-$_github_project-$_github_rev/build"

  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=RelWithDebInfo \
        -DLUA_EXECUTABLE=/usr/bin/lua5.2

  make
}

package() {
  cd "$srcdir/$_github_user-$_github_project-$_github_rev/build"
  make DESTDIR="$pkgdir/" install
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  cp ../LICENSE "$pkgdir/usr/share/licenses/$pkgname"
  cp "$srcdir/user.lua" "$pkgdir/usr/share/zbstudio/cfg/user.lua"
  cp "../lualibs/lua_parser_loose.lua" "$pkgdir/usr/share/zbstudio/lualibs/"
  cp "../lualibs/lua_lexer_loose.lua" "$pkgdir/usr/share/zbstudio/lualibs/"
}

# vim:set ts=2 sw=2 et:
