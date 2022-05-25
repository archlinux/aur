# Maintainer: Romain Chardiny <romain.chardiny@gmail.com>
_basename=xmake
pkgname=${_basename}-git
pkgver=2.6.5.r79
pkgrel=1
pkgdesc='A make-like build utility based on Lua'
arch=('i686' 'x86_64')
url='http://xmake.io'
license=('Apache')
depends=()
makedepends=('git')
provides=("${_basename}=${pkgver}")
conflicts=("${_basename}")
source=("git+https://github.com/xmake-io/xmake.git"
        "git+https://github.com/xmake-io/xmake-core-lua-cjson.git"
        "git+https://github.com/xmake-io/xmake-core-lua.git"
        "git+https://github.com/xmake-io/xmake-core-luajit.git"
        "git+https://github.com/xmake-io/xmake-core-pdcurses.git"
        "git+https://github.com/xmake-io/xmake-core-sv.git"
        "git+https://github.com/xmake-io/xmake-core-lz4.git"
        "git+https://github.com/tboox/tbox.git")

sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

pkgver()
{
  cd "${srcdir}/${_basename}"
  git describe --long --tags | sed 's/\([^-]*\)-g.*/r\1/;s/-/./g' | cut -c2-
}

prepare()
{
  cd "${srcdir}/${_basename}"
  git submodule init
  git config submodule.core/src/lua-cjson/lua-cjson.url "$srcdir/xmake-core-lua-cjson"
  git config submodule.core/src/lua/lua.url "$srcdir/xmake-core-lua"
  git config submodule.core/src/luajit/luajit.url "$srcdir/xmake-core-luajit"
  git config submodule.core/src/pdcurses/pdcurses.url "$srcdir/xmake-core-pdcurses"
  git config submodule.core/src/sv/sv.url "$srcdir/xmake-core-sv"
  git config submodule.core/src/lz4/lz4.url "$srcdir/xmake-core-lz4"
  git config submodule.core/src/tbox/tbox.url "$srcdir/tbox"
  git submodule update
}

build()
{
  cd "${srcdir}/${_basename}"
  make build CC=gcc LD=gcc
}

package()
{
  cd "${srcdir}/${_basename}"
  make install DESTDIR="${pkgdir}" PREFIX="/usr"
}
