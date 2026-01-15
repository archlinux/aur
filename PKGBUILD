# Maintainer: ched <ched@cheds.app>
pkgname=rowheel
pkgver=0.1.0
pkgrel=1
pkgdesc="Racing wheel + force feedback support in Roblox"
arch=('x86_64')
url="https://github.com/chedsapp/rowheel"
license=('MIT')
depends=('systemd-libs' 'libxkbcommon' 'libxcb' 'mesa')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/chedsapp/rowheel/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('47724fdc102667bf43d3276a936f6ebf84b00693e632ef56ff9b88546641140a')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    cd "$pkgname-$pkgver"

    # Install binary
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"

    # Install icons
    install -Dm644 "ico/rowheel-64.png" "$pkgdir/usr/share/icons/hicolor/64x64/apps/$pkgname.png"
    install -Dm644 "ico/rowheel-256.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"

    # Install desktop file
    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$pkgname.desktop" << EOF
[Desktop Entry]
Type=Application
Name=RoWheel
Comment=Emulate gamepads through DirectInput devices like steering wheels
Exec=/usr/bin/$pkgname
Icon=$pkgname
Terminal=false
Categories=Game;Utility;
Keywords=controller;gamepad;steering;wheel;xbox;
EOF

    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
