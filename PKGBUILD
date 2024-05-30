# Maintainer: qwjyh <urataw421 at gmail dot com>


# TODO: Fix doc gen and test

pkgname=luax-git
_pkgname="${pkgname%-git}"
pkgver=r590.70bcc33
pkgrel=1
pkgdesc="Lua interpreter and REPL based on Lua 5.4, augmented with some useful packages. It is also a \"compiler\" that produces standalone executables from Lua scripts."
depends=('lua' 'zig' 'glibc')
makedepends=('ninja' 'git')
provides=('luax')
arch=('x86_64' 'aarch64')
url="https://cdelord.fr/luax.html"
license=('GPL-3.0-only')
source=("git+https://github.com/CDSoft/luax.git")
sha256sums=('SKIP')

_distdir="$_pkgname"

prepare() {
    cd "$srcdir/$_distdir"
    ninja -f bootstrap.ninja
    sed -i "s,zig = .*,zig = $(which zig)," build.ninja
    sed -i 's,build $zig: _zig,,' build.ninja
}

pkgver() {
  cd "${_pkgname}" || exit 1
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$_distdir"
    ninja
    # TODO: Fails building logo
    # ninja doc
}

check() {
    cd "$srcdir/$_distdir"
    # TODO: Fails
    # ninja test
}

package() {
    cd "$srcdir//$_distdir"
    PREFIX=$pkgdir/usr ninja install
}

# vim: sw=2:
