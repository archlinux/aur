# Maintainer: thongor77 <magetriste@proton.me>
pkgname=netmnt
pkgver=0.2.0
pkgrel=1
pkgdesc="Mount SMB/NFS network shares from Dolphin's right-click menu (Rust + D-Bus + polkit)"
arch=('x86_64')
url="https://github.com/thongor77/netmnt"
license=('MIT')
depends=('cifs-utils' 'nfs-utils' 'polkit')
makedepends=('cargo')
optdepends=('kdialog: graphical credential prompt for "Mount as…"'
            'kwallet: store credentials for authenticated shares'
            'dolphin: file-manager integration (KDE service menus)')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('471a5f8ceb43d7d1c23bcb6163472426e9e3e67760317a247573b3226802f178')

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
