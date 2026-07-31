# Maintainer: Leonardo Mora Castro <leomc145@gmail.com>

pkgname=kanata-switcher
pkgver=1.1.3
pkgrel=1
pkgdesc='Kanata layer switcher based on focused window for all Linux desktop environments'
url='https://github.com/7mind/kanata-switcher'
license=('MIT')
arch=('x86_64')
makedepends=('cargo' 'glib2')
depends=('dbus' 'glibc' 'libgcc')
optdepends=(
    'kanata: the keyboard remapper this tool controls'
    'dconf: persist system tray settings'
    'glib2: GNOME Shell extension schema and GSettings support'
    'gnome-shell: GNOME Shell extension integration'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/7mind/$pkgname/archive/refs/tags/v$pkgver.tar.gz"
        "kanata-switcher.service")
b2sums=('15dd5edc572582e96a2341a9039d58ea381397aa9d1fa10a03616a260f52fba538e9bf2470afb8fb15698a13e940f9d58436659a2a398cb3852e17a5bb9acab3'
        '8075ae04b6127b83f5b76df9c34345bc66073b22c8bb15f925498fbdd490e4bd3bc36281cb82ec42cc0fccc3056a6c2e0af6afdc3c53c04d91583a876383d95f')
install=kanata-switcher.install

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/kanata-switcher.service" "$pkgdir/usr/lib/systemd/user/kanata-switcher.service"
}
