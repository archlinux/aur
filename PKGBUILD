# Maintainer: thongor77 <magetriste@proton.me>
pkgname=netmnt
pkgver=0.3.0
pkgrel=1
pkgdesc="Mount SMB/NFS network shares from Dolphin's right-click menu (Rust + D-Bus + polkit)"
arch=('x86_64')
url="https://github.com/thongor77/netmnt"
license=('MIT')
depends=('cifs-utils' 'nfs-utils' 'polkit')
makedepends=('cargo' 'gettext')
optdepends=('kdialog: graphical credential prompt for "Mount as…"'
            'kwallet: store credentials for authenticated shares'
            'dolphin: file-manager integration (KDE service menus)')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('70af41fc6b4467acc669554700fcb45b037b7028ceaa4c6e1c5a39d711a29de9')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable CARGO_TARGET_DIR=target
    make i18n
    NETMNT_DEFAULT_LOCALE_DIR=/usr/share/locale \
        cargo build --frozen --release --all
    # Stamp the prefix so `make install` (used by package()) accepts the
    # build instead of refusing it as missing build metadata.
    install -d build
    printf '%s\n' /usr > build/install-prefix
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
