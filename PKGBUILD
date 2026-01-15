# Maintainer: vadik likholetov <vadikas@gmail.com>
pkgname=litra-autotoggle
pkgver=1.0.0.0.g92d1e45
pkgrel=1
pkgdesc="Automatically turn your Logitech Litra device on when your webcam turns on, and off when your webcam turns off"
arch=('x86_64' 'aarch64')
url="https://github.com/timrogers/litra-autotoggle"
license=('MIT')
depends=('hidapi')
makedepends=('cargo' 'rust' 'libusb' 'hidapi' 'pkg-config' 'git')
_commit=92d1e45300ec46bdc9455dee1cfea3adf7ef12ab
source=("$pkgname::git+https://github.com/timrogers/litra-autotoggle.git#commit=$_commit"
        "litra-autotoggle.service::https://raw.githubusercontent.com/timrogers/litra-autotoggle/$_commit/litra-autotoggle.service")
sha256sums=('6545c28e6c76baf35edf1b177584940d578ae4760a4f6cd974d214c10ab6d291'
            '4a0ed4c8ccbd3449ba47a63c26da7c4e2964872aa674fa162c32f4127037a299')

pkgver() {
    cd "$pkgname"
    git describe --tags --long --abbrev=7 | sed 's/^v//;s/-/./g'
}

build() {
    cd "$pkgname"
    RUSTFLAGS="-l hidapi-hidraw" cargo build --release --target-dir=target
}

check() {
    cd "$pkgname"
    RUSTFLAGS="-l hidapi-hidraw" cargo test --release --target-dir=target
}

package() {
    cd "$pkgname"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    
    # Install udev rules
    install -Dm644 99-litra.rules "$pkgdir/usr/lib/udev/rules.d/99-litra.rules"
    
    # Install systemd user service
    install -Dm644 "$srcdir/litra-autotoggle.service" "$pkgdir/usr/lib/systemd/user/litra-autotoggle.service"
    
    # Install license
    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

post_install() {
    echo ""
    echo "==> litra-autotoggle installed successfully!"
    echo ""
    echo "To enable the service:"
    echo "  systemctl --user enable --now litra-autotoggle"
    echo ""
    echo "To check status:"
    echo "  systemctl --user status litra-autotoggle"
    echo ""
    echo "To stop the service:"
    echo "  systemctl --user stop litra-autotoggle"
    echo ""
}
