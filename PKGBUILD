# Maintainer: thongor77 <magetriste@proton.me>
pkgname=netmnt
pkgver=0.1.0
pkgrel=1
pkgdesc="Mount SMB network shares from Dolphin's right-click menu (Rust + D-Bus + polkit)"
arch=('x86_64')
url="https://github.com/thongor77/netmnt"
license=('MIT')
depends=('cifs-utils' 'polkit')
makedepends=('cargo')
optdepends=('kdialog: graphical credential prompt for "Mount as…"'
            'kwallet: store credentials for authenticated shares'
            'dolphin: file-manager integration (KDE service menus)')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('81b349670cc8e11bcebceafeeda0e142fa31c20bf83763ffa0b62b39540e1b34')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable CARGO_TARGET_DIR=target
    cargo build --frozen --release --all
}

check() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable CARGO_TARGET_DIR=target
    cargo test --frozen --release --all
}

package() {
    cd "$pkgname-$pkgver"
    # Reuse the Makefile so packaged paths stay in sync with `make install`.
    make install DESTDIR="$pkgdir" PREFIX=/usr
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
