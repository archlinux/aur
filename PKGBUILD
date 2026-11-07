# Maintainer: Kuan-Yen Chou <kuanyenchou at gmail dot com>

pkgname=dotool-git
pkgver=1.6.r3.g27ec57e
pkgrel=3
pkgdesc="Command to simulate input anywhere"
arch=('x86_64')
url="https://git.sr.ht/~geb/dotool"
license=('GPL-3.0-only')
provides=('dotool')
conflicts=('dotool')
depends=('libxkbcommon')
makedepends=('git' 'go' 'scdoc')
source=("$pkgname::git+$url"
        "dotoold.service")
sha256sums=('SKIP'
            'a7309bb8f8ff97b1b85ff48a5db2dd4ed02c00c4f23628403c385abe93e88aca')
install=dotool.install

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
    ./build.sh
}

package() {
    cd "$srcdir/$pkgname"
    export DOTOOL_DESTDIR="$pkgdir"
    export DOTOOL_BINDIR=usr/bin
    export DOTOOL_UDEV_RULES_DIR=usr/lib/udev/rules.d
    ./build.sh install
    install -Dm644 -t "$pkgdir/usr/lib/systemd/user" "$srcdir/dotoold.service"
}
