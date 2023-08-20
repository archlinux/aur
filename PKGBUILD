# Maintainer: Kuan-Yen Chou <kuanyenchou@gmail.com>

pkgname=dotool-git
pkgver=1.3.r1.gee4a1cd
pkgrel=1
pkgdesc="Command to simulate input anywhere"
arch=('any')
url="https://git.sr.ht/~geb/dotool"
license=('GPL3')
depends=('libxkbcommon')
makedepends=('go')
source=("$pkgname::git+$url"
        "dotoold.service")
sha256sums=('SKIP'
            'a7309bb8f8ff97b1b85ff48a5db2dd4ed02c00c4f23628403c385abe93e88aca')

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
    sed -i -e '/^rm -f /d' -e '/^udevadm /d' install.sh
}

package() {
    cd "$srcdir/$pkgname"
    ./install.sh "$pkgdir" /usr/bin
    install -Dm 644 -t "$pkgdir/usr/lib/systemd/user" "$srcdir/dotoold.service"
}
