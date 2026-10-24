# Maintainer: Andrey Anshin <Andrey.Anshin@taragol.is>

_pkgname=linuxblaster_control
_basepkgname=linuxblaster-control
pkgname=$_basepkgname
pkgver=2.3.0
pkgrel=1
pkgdesc='A native Linux GUI application to control the Creative Sound BlasterX G6 USB DAC/Amp, with full AutoEq integration.'
arch=(x86_64)
url='https://github.com/RizeCrime/linuxblaster_control'
license=(MIT)
depends=(
    glibc
    gcc-libs
    libusb
    hidapi
    alsa-utils
)
makedepends=(
    cargo
    git
)
provides=($pkgname)
conflicts=($_basepkgname-git)
source=(
    $_pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz
    60-soundblasterx-g6.rules
    linuxblaster-control.desktop
)
sha256sums=(
    '5c4c93b9e14ba8da4513a0c00c0b0b1bcf8370434c91192f09d57c44dcedd3c6'
    'SKIP'
    'SKIP'
)


prepare() {
    cd "$_pkgname-$pkgver"

    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
    cd "$_pkgname-$pkgver"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd  "$_pkgname-$pkgver"

    install -vDm755 -t "$pkgdir/usr/bin/" "target/release/$_pkgname"
    install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
    install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
    
    install -vDm644 -t "$pkgdir/usr/share/applications" "${srcdir}/linuxblaster-control.desktop"
    install -vDm644 -t "$pkgdir/usr/lib/udev/rules.d" "${srcdir}/60-soundblasterx-g6.rules"

    install -vDm755 -t "$pkgdir/usr/lib/$pkgname" "alsa-fix/soundblasterx-g6-alsa-fix.sh"
    sed "s|/usr/local/bin/|/usr/lib/$pkgname/|" "alsa-fix/91-soundblasterx-g6.rules" \
        | install -vDm644 /dev/stdin "$pkgdir/usr/lib/udev/rules.d/91-soundblasterx-g6-alsa-fix.rules"
}
