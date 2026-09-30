# Maintainer: Stokes <jesusmanuelgonzalezmeneses18@gmail.com>

pkgname=educamadrid-nextcloud
pkgver=0.3.0
pkgrel=1
pkgdesc="Unofficial GUI to add the EducaMadrid Nextcloud account to the Nextcloud desktop client on KDE Plasma"
arch=('x86_64')
url="https://github.com/13Stokes31/educamadrid-nextcloud"
license=('MIT')
depends=('dbus' 'nextcloud-client' 'kwallet' 'xdg-utils' 'gcc-libs' 'glibc' 'libglvnd' 'libx11' 'libxcursor' 'libxi'
         'libxkbcommon' 'libxkbcommon-x11' 'libxrender' 'wayland')
makedepends=('cargo')
# ring compila C: con el LTO de makepkg sus objetos no enlazan con rust-lld.
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6a5f8b2b84511a9a43cf4bd48a22a4a88550f68c70b1ef46a0619474c2db9281')

prepare() {
    cd "educamadrid-nextcloud-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "educamadrid-nextcloud-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

check() {
    cd "educamadrid-nextcloud-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen
}

package() {
    cd "educamadrid-nextcloud-$pkgver"
    install -Dm755 target/release/educamadrid-nextcloud -t "$pkgdir/usr/bin/"
    install -Dm644 educamadrid-nextcloud.desktop -t "$pkgdir/usr/share/applications/"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
