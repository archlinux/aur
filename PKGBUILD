# Maintainer: lemonxah <lemonxah@gmail.com>
pkgname=zestbay-git
pkgver=r0.0000000
pkgrel=1
pkgdesc="A PipeWire patchbay and audio routing manager with LV2 plugin hosting (git version)"
arch=('x86_64')
url="https://github.com/lemonxah/zestbay"
license=('MIT')
depends=(
    'pipewire'
    'qt6-base'
    'qt6-declarative'
    'lilv'
    'lv2'
    'suil'
    'dbus'
)
makedepends=(
    'rust'
    'cargo'
    'clang'
    'cmake'
    'pkg-config'
    'qt6-base'
    'qt6-declarative'
    'pipewire'
    'lilv'
    'lv2'
    'suil'
    'git'
)
provides=('zestbay')
conflicts=('zestbay')
source=("$pkgname::git+https://github.com/lemonxah/zestbay.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release
}

package() {
    cd "$pkgname"
    install -Dm755 "target/release/zestbay" "$pkgdir/usr/bin/zestbay"
    install -Dm644 "zestbay.desktop" "$pkgdir/usr/share/applications/zestbay.desktop"
    install -Dm644 "images/zesticon.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/zestbay.png"
    install -Dm644 "images/zesttray.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/zestbay-tray.png"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
