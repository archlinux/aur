# Maintainer: Gokberk Yaltirakli <aur at gkbrk dot com>
pkgname=nothing
_pkgname=nothing
pkgver=r2505.9945a78
pkgrel=1
epoch=
pkgdesc="A game about nothing"
arch=('x86_64')
url="https://github.com/tsoding/nothing"
license=('GPL')
depends=('sdl2')
makedepends=('gcc' 'cmake')
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
    rm -rf build
    mkdir build
    cd build
    cmake ..
    make

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

    ls assets/
    install -Dm755 -d "$pkgdir/usr/share/games/nothing"
    cp -r assets/* "$pkgdir/usr/share/games/nothing"

    install -Dm755 "build/nothing" "$pkgdir/usr/lib/games/nothing/nothing"
    install -Dm755 "build/nothing-with-dir" "$pkgdir/usr/bin/nothing"
}
