# Maintainer: Gokberk Yaltirakli <aur at gkbrk dot com>
pkgname=nothing
_pkgname=nothing
pkgver=r2894.95ca07bd
pkgrel=1
epoch=
pkgdesc="A game about nothing"
arch=('x86_64')
url="https://github.com/tsoding/nothing"
license=('MIT')
depends=('sdl2')
makedepends=('gcc')
provides=('nothing')
conflicts=('nothing')
source=("nothing::git+$url")
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
    # No patches needed for now
}

build() {
    cd "$srcdir/$_pkgname"
    export CFLAGS="$CFLAGS -flto -Ofast"
    export CC="cc"
    ./build-posix.sh

    cat > "nothing-with-dir" <<EOF
#!/bin/sh
cd /usr/share/games/nothing
exec /usr/lib/games/nothing/nothing
EOF
}

check() {
    cd "$srcdir/$_pkgname"
}

package() {
    cd "$srcdir/$_pkgname"

    install -Dm755 -d "$pkgdir/usr/share/games/nothing"
    cp -r assets/ "$pkgdir/usr/share/games/nothing"

    install -Dm755 "nothing" "$pkgdir/usr/lib/games/nothing/nothing"
    install -Dm755 "nothing-with-dir" "$pkgdir/usr/bin/nothing"
}
