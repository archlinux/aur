# Maintainer: JimMoen <LnJimMoen@outlook.com>
pkgname=rinertia-git
pkgver=0.1.0.22
pkgrel=1
pkgdesc="Momentum scrolling daemon for Linux touchpads (evdev/uinput, no device grab)"
arch=('x86_64')
url="https://github.com/JimMoen/rinertia"
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('git' 'cargo')
provides=("rinertia")
conflicts=('rinertia')
source=("${pkgname}::git+https://github.com/JimMoen/rinertia.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "%s.%s" \
        "$(grep '^version' Cargo.toml | head -1 | sed 's/.*"\(.*\)"/\1/')" \
        "$(git rev-list --count HEAD)"
}

build() {
    cd "$pkgname"
    export CARGO_TARGET_DIR=target
    cargo build --release --locked
}

package() {
    cd "$pkgname"

    install -Dm755 target/release/rinertia "$pkgdir/usr/bin/rinertia"

    install -Dm644 dist/rinertia.service "$pkgdir/usr/lib/systemd/user/rinertia.service"
    install -Dm644 dist/99-rinertia.rules "$pkgdir/usr/lib/udev/rules.d/99-rinertia.rules"
    install -Dm644 dist/config.toml.example "$pkgdir/usr/share/doc/$pkgname/config.toml.example"

    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
