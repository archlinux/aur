# Maintainer: deadYokai

pkgname=ds4u-git
pkgver=r33.g4ac16f0
pkgrel=1
pkgdesc="DualSense 4 You — DualSense controller manager (git)"
arch=('x86_64')
url="https://git.yokai.digital/deadYokai/ds4u"
license=('MIT')
depends=('hidapi' 'libxkbcommon' 'openssl')
makedepends=('rust' 'cargo' 'git' 'clang' 'lld')
provides=('ds4u')
conflicts=('ds4u')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
    export CC=clang
    export CXX=clang++
    export RUSTFLAGS="-C linker=clang -C link-arg=-fuse-ld=lld"
    cargo build --profile dev-release --features unstable
}

package() {
    cd "$pkgname"

    install -Dm755 "target/dev-release/ds4u" "$pkgdir/usr/bin/ds4u"

    install -Dm644 "assets/icon.svg" \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/ds4u.svg"

    install -Dm644 /dev/stdin \
        "$pkgdir/usr/lib/udev/rules.d/70-ds4u.rules" << 'EOF'
SUBSYSTEM=="hidraw", ATTRS{idVendor}=="054c", ATTRS{idProduct}=="0ce6", MODE="0664", GROUP="input", TAG+="uaccess"
SUBSYSTEM=="hidraw", ATTRS{idVendor}=="054c", ATTRS{idProduct}=="0df2", MODE="0664", GROUP="input", TAG+="uaccess"
EOF

    install -Dm644 /dev/stdin \
        "$pkgdir/usr/lib/systemd/user/ds4u-daemon.service" << 'EOF'
[Unit]
Description=DS4U DualSense daemon
After=network.target

[Service]
ExecStart=/usr/bin/ds4u --daemon
Restart=on-failure

[Install]
WantedBy=default.target
EOF

    install -Dm644 /dev/stdin \
        "$pkgdir/usr/share/applications/ds4u.desktop" << 'EOF'
[Desktop Entry]
Name=DS4U (git)
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
