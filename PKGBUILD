# Maintener: Caleb Maclennan <caleb@alerque.com>
# Contributor: Popolon <popolon@popolon.org>
# Contributor: Michael Gerhaeuser <michael.gerhaeuser@gmail.com>
# Contributor: Harley Laue <losinggeneration@gmail.com>

pkgname=zerobrane-studio
pkgver=1.80
pkgrel=1
pkgdesc="A lightweight Lua-based IDE for Lua"
arch=(any)
url="http://studio.zerobrane.com/"
license=('MIT')
depends=('wxlua-git' 'lua-socket' 'hicolor-icon-theme')
makedepends=('cmake')
provides=('zerobrane-studio')
conflicts=('zerobrane-studio-git')
optdepends=('love: to debug love programs')
_github_user="pkulchenko"
_github_project="ZeroBraneStudio"
source=("https://github.com/$_github_user/$_github_project/archive/${pkgver}.tar.gz"
        "zbstudio.patch"
        "user.lua")
sha512sums=('f0605e2c739cafc7d0ea6a53cba6136ea3d871d12c3887d7d45c1e7384b968bd7a43c5db1ba6258403b48f46c0b83e557ac17937c092ccf1074b27f5b74a79b1'
            '4d09fdbc47fdead6218ab83e344748a21b0232cc3dcbe4d2f0d820eeaa6c3f36e9d0a9568bc4c042e85293bf8a7f5bf53df29c2a799cdd4846151d5e87459eb3'
            '4de7e9b5db74b2af3b10d03abe0fe590cab5dd2df5900047595c124a58f823cab2acdf179d6580f193d8cc1face8155c16d6d9029df96001d1fb64cf1a8a13b2')

prepare() {
  cd "$srcdir/$_github_project-$pkgver"
  patch -p1 < "$srcdir/zbstudio.patch"
}

build() {
  cd "$srcdir/$_github_project-$pkgver/build"

   sed -e '/check_lua_module(wx TRUE)/ s/^#*/#/' -i CMakeLists.txt
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=RelWithDebInfo

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
