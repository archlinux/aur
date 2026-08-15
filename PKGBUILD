# Maintainer: Patrick Fischer <aur at pathin dot me>
pkgname=onset-git
pkgver=2.0.0.r0.g807f49b
pkgrel=1
pkgdesc="Lightweight GTK4 autostart manager for Linux"
arch=('x86_64' 'aarch64')
url="https://github.com/kulmin/onset"
license=('MIT')
depends=('gtk4' 'libadwaita')
makedepends=('rust' 'cargo' 'git')
provides=('onset')
conflicts=('onset')
source=("git+https://github.com/kulmin/onset.git")
sha256sums=('SKIP')

pkgver() {
    cd onset
    if DESC=$(git describe --long --tags --abbrev=7 2>/dev/null); then
        echo "$DESC" | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
    else
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    fi
}

build() {
    cd onset
    cargo build --release --locked
}

check() {
    cd onset
    cargo test --release --locked
}

package() {
    cd onset
    install -Dm755 "target/release/onset" "$pkgdir/usr/bin/onset"
    install -Dm644 "data/com.github.kulmin.onset.desktop" \
        "$pkgdir/usr/share/applications/com.github.kulmin.onset.desktop"
    install -Dm644 "data/icons/hicolor/scalable/apps/com.github.kulmin.onset.svg" \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/com.github.kulmin.onset.svg"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
