# Maintainer: Gokberk Yaltirakli <aur at gkbrk dot com>
pkgname=something
_pkgname=something
pkgver=r2894.95ca07bd
pkgrel=1
epoch=
pkgdesc="Finally something"
arch=('x86_64')
url="https://github.com/tsoding/something"
license=('MIT')
depends=('sdl2' 'libpng' 'sdl2_ttf')
makedepends=('gcc')
provides=('something')
conflicts=('something')
source=("something::git+$url")
sha512sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"

    ( set -o pipefail
      git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

prepare() {
    cd "$srcdir/$_pkgname"
    sed -i 's/^CXXFLAGS=.*$/CXXFLAGS=-std=c++17 -fno-exceptions -flto -Ofast -s -march=native $(shell pkg-config --cflags $(PKGS))/' Makefile
}

build() {
    cd "$srcdir/$_pkgname"
    make

    cat > "something-with-dir" <<EOF
#!/bin/sh
cd /usr/share/games/something
exec /usr/lib/games/something/something
EOF
}

check() {
    cd "$srcdir/$_pkgname"
}

package() {
    cd "$srcdir/$_pkgname"

    install -Dm755 -d "$pkgdir/usr/share/games/something"
    cp -r assets/     "$pkgdir/usr/share/games/something"

    install -Dm755 "something" "$pkgdir/usr/lib/games/something/something"
    install -Dm755 "something-with-dir" "$pkgdir/usr/bin/something"
}
