# Maintainer: Andrey Anshin <Andrey.Anshin@taragol.is>

_pkgname=linuxblaster_control
_basepkgname=linuxblaster-control
pkgname=$_basepkgname-git
pkgver=2.1.0.r7.g104ba0b
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
)
makedepends=(
    git
    cargo
)
provides=($_basepkgname)
conflicts=($_basepkgname)
source=(
    $_pkgname::git+${url}.git
    60-soundblasterx-g6.rules
    linuxblaster-control.desktop
)
sha256sums=(
    'SKIP'
    'SKIP'
    'SKIP'
)

pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --long --tags | sed "s/^v//;s/\([^-]*-g\)/r\1/;s/-/./g"
}

prepare() {
    cd "$srcdir/$_pkgname"

    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
    cd "$srcdir/$_pkgname"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "$srcdir/$_pkgname"

    install -vDm755 -t "$pkgdir/usr/bin/" "target/release/$_pkgname"
    install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
    install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE

    install -vDm644 -t "$pkgdir/usr/share/applications" "${srcdir}/linuxblaster-control.desktop"
    install -vDm644 -t "$pkgdir/usr/lib/udev/rules.d" "${srcdir}/60-soundblasterx-g6.rules"
    
    install -vDm644 -t "$pkgdir/usr/local/bin" "alsa-fix/soundblasterx-g6-alsa-fix.sh"
    install -vDm644 "alsa-fix/91-soundblasterx-g6.rules" "$pkgdir/usr/lib/udev/rules.d/91-soundblasterx-g6-alsa-fix.rules"
}
