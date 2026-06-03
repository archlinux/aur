# Maintainer: deadYokai

pkgname=ds4u
pkgver=0.0.2
pkgrel=1
pkgdesc="DualSense 4 You — DualSense controller manager for Linux"
arch=('x86_64')
url="https://git.yokai.digital/deadYokai/ds4u"
license=('MIT')
provides=('ds4u')
conflicts=('ds4u-git')
depends=('hidapi' 'libxkbcommon' 'openssl')
makedepends=('rust' 'cargo' 'clang' 'lld')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

prepare() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export CC=clang
    export CXX=clang++
    export RUSTFLAGS="-C linker=clang -C link-arg=-fuse-ld=lld"
    cargo build --release
}

package() {
    cd "$pkgname"

    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"

    install -Dm644 "assets/icon.svg" \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"

    install -Dm644 /dev/stdin \
        "$pkgdir/usr/lib/udev/rules.d/70-$pkgname.rules" << 'EOF'
SUBSYSTEM=="hidraw", ATTRS{idVendor}=="054c", ATTRS{idProduct}=="0ce6", MODE="0664", GROUP="input", TAG+="uaccess"
SUBSYSTEM=="hidraw", ATTRS{idVendor}=="054c", ATTRS{idProduct}=="0df2", MODE="0664", GROUP="input", TAG+="uaccess"
EOF

    install -Dm644 /dev/stdin \
        "$pkgdir/usr/lib/systemd/user/$pkgname-daemon.service" << 'EOF'
[Unit]
Description=DS4U daemon
After=network.target

[Service]
ExecStart=/usr/bin/ds4u --daemon
Restart=on-failure

[Install]
WantedBy=default.target
EOF

    install -Dm644 /dev/stdin \
        "$pkgdir/usr/share/applications/$pkgname.desktop" << 'EOF'
[Desktop Entry]
Name=DS4U
Comment=DualSense controller manager for Linux
Exec=ds4u
Icon=ds4u
Terminal=false
Type=Application
Categories=Utility;Settings;Game;
Keywords=controller;dualsense;ps5;gamepad;
EOF

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
