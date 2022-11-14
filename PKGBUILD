# Davide Depau <davide@depau.eu>

pkgname=ydotool-git
pkgver=0.0.1.r2.g1d5d227
pkgrel=1
epoch=1
pkgdesc="Generic command-line automation tool (no X!)"
depends=()
makedepends=('git' 'cmake' 'ninja' 'scdoc')
arch=(any)
url="https://github.com/ReimuNotMoe/ydotool"
license=('AGPL3')
provides=(ydotool)
conflicts=(ydotool)
install=ydotool.install
source=("$pkgname::git+https://github.com/ReimuNotMoe/ydotool.git"
        '80-uinput.rules')
sha256sums=('SKIP'
            'e839f6a07c79fedea58c3ef3d3ce2370a870ffcc503fc2a64ded9f11d513ef24')

pkgver() {
    cd "$srcdir/$pkgname"
    if git describe --long --tags >/dev/null 2>&1; then
        git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
    else
        printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git describe --always)"
    fi
}

build() {
    cd "$srcdir/$pkgname"
    cmake -B build -S . \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_MANDIR=/usr/share/man \
        -DCMAKE_BUILD_TYPE=Release \
        -G Ninja
    ninja -C build
}

package() {
    cd "$srcdir/$pkgname"
    DESTDIR="$pkgdir" ninja -C build install
    install -Dm644 "$srcdir/80-uinput.rules" -t "$pkgdir/usr/lib/udev/rules.d"
}
