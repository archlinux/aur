# Maintainer: Kuan-Yen Chou <kuanyenchou@gmail.com>

pkgname=dotool-git
pkgver=1.3.r1.gee4a1cd
pkgrel=3
pkgdesc="Command to simulate input anywhere"
arch=('any')
url="https://git.sr.ht/~geb/dotool"
license=('GPL3')
provides=('dotool')
conflicts=('dotool')
depends=('libxkbcommon')
makedepends=('go')
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

prepare() {
    cd "$srcdir/$pkgname"
    sed -i install.sh \
        -e '/80-dotool\.rules/d' \
        -e '/^rm -f /d' \
        -e '/^udevadm /d'
}

package() {
    cd "$srcdir/$pkgname"
    # ./install.sh [DESTDIR] [BINDIR]
    ./install.sh "$pkgdir" /usr/bin
    install -Dm644 -t "$pkgdir/usr/lib/udev/rules.d" 80-dotool.rules
    install -Dm644 -t "$pkgdir/usr/lib/systemd/user" "$srcdir/dotoold.service"
}
