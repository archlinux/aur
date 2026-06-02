# Maintainer: szern <szern@aporianet.com>
pkgname=letsnote-wheelpad-git
pkgver=r1.0000000
pkgrel=1
pkgdesc="Userland daemon: Panasonic Let's Note WheelPad circular touchpad scroll on Linux"
arch=('x86_64')
url="https://github.com/Nerahikada/letsnote-wheelpad"
license=('MIT')
depends=('systemd' 'udev')
makedepends=('cargo' 'rust' 'git')
provides=('letsnote-wheelpad')
conflicts=('letsnote-wheelpad')
install="${pkgname%-git}.install"
source=("$pkgname::git+https://github.com/Nerahikada/letsnote-wheelpad.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$pkgname"
    cargo build --release --locked
}

package() {
    cd "$srcdir/$pkgname"
    install -Dm755 target/release/letsnote-wheelpad \
        "$pkgdir/usr/bin/letsnote-wheelpad"
    install -Dm644 packaging/udev/70-letsnote-wheelpad.rules \
        "$pkgdir/usr/lib/udev/rules.d/70-letsnote-wheelpad.rules"
    install -Dm644 packaging/systemd/letsnote-wheelpad.service \
        "$pkgdir/usr/lib/systemd/user/letsnote-wheelpad.service"
    install -Dm644 packaging/modules-load/letsnote-wheelpad.conf \
        "$pkgdir/usr/lib/modules-load.d/letsnote-wheelpad.conf"
    install -Dm644 LICENSE \
        "$pkgdir/usr/share/licenses/${pkgname%-git}/LICENSE"
    install -Dm644 README.md \
        "$pkgdir/usr/share/doc/${pkgname%-git}/README.md"
    install -Dm644 README.ja.md \
        "$pkgdir/usr/share/doc/${pkgname%-git}/README.ja.md"
}
