# Maintainer: Spinu Alexandru <spinualexandru@outlook.com>
pkgname=asus-rog-touchpad-numpad
pkgver=0.1.0.r6.9d984bb
pkgrel=1
pkgdesc="Linux driver for ASUS ROG laptop touchpad numpad overlay with LED backlight control"
arch=('x86_64')
url="https://github.com/spinualexandru/asus-rog-touchpad-driver"
license=('GPL-2.0-only')
depends=('gcc-libs' 'glibc' 'libevdev')
makedepends=('cargo' 'git')
install=$pkgname.install
backup=('etc/modules-load.d/i2c-dev.conf')
_reponame=asus-rog-touchpad-driver
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_reponame"
    if git describe --tags --long &>/dev/null; then
        git describe --tags --long | sed 's/^v//;s/-/.r/;s/-/./'
    else
        printf "0.1.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    fi
}

prepare() {
    cd "$_reponame"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$_reponame"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "$_reponame"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo test --frozen --all-features
}

package() {
    cd "$_reponame"

    # Install binary
    install -Dm0755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"

    # Install systemd service
    install -Dm0644 "asus-rog-touchpad.service" "$pkgdir/usr/lib/systemd/system/asus-rog-touchpad.service"

    # Install i2c-dev module load config
    install -Dm0644 /dev/stdin "$pkgdir/etc/modules-load.d/i2c-dev.conf" <<< "i2c-dev"

    # Install license
    install -Dm0644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
