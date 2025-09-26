# Maintainer: PeterWang-dev <PeterWang030908@hotmail.com>
# shellcheck disable=SC2034,SC2148,SC2154
_pkgname=weylus
pkgname=weylus-git
pkgver=0.11.4.r139.g56e29ec
pkgrel=1
pkgdesc="Use your tablet as graphic tablet/touch screen on your computer."
arch=("x86_64")
url="https://github.com/H-M-H/Weylus"
license=("AGPL-3.0-or-later")
conflicts=("$_pkgname" "$_pkgname-bin")
provides=("$_pkgname=${pkgver/\.r*/}")
options=(!debug !lto) # Disabled for rust build
makedepends=(rust typescript gcc libx11 pkg-config git make cmake nasm)
depends=(cairo dbus gst-plugins-base-libs libdrm libva libxcomposite libxcursor libxinerama libxkbcommon libxrandr libxtst pango)
optdepends=("gst-plugin-pipewire: Wayland support")
source=("$_pkgname::git+$url.git")
sha256sums=("SKIP")

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    cd "$srcdir/$_pkgname"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cd "$srcdir/$_pkgname"
    cargo build --frozen --release
}

package() {
    cd "$srcdir/$_pkgname"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$_pkgname"
    install -Dm0755 -t "$pkgdir/usr/share/applications/" "weylus.desktop"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" "LICENSE"
}

pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
