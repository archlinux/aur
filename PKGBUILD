# Maintainer: PeterWang-dev <PeterWang030908@hotmail.com>
# shellcheck disable=SC2034,SC2148,SC2154
_pkgname=weylus
pkgname=weylus-git
pkgver=0.11.4.r134.g5202806
pkgrel=1
pkgdesc="Use your tablet as graphic tablet/touch screen on your computer."
arch=("x86_64")
url="https://github.com/H-M-H/Weylus"
license=("AGPL3")
conflicts=("$_pkgname" "$_pkgname-bin")
provides=("$_pkgname=${pkgver/\.r*/}")
options=(!debug !lto) # Disabled for rust build
makedepends=(rust typescript gcc libx11 pkg-config git make cmake nasm)
depends=(libxtst libxcursor libxinerama libxft libxrandr libxcomposite libdrm libva ffmpeg dbus gst-plugins-base-libs)
optdepends=("gst-plugin-pipewire: Wayland support")
source=("$_pkgname::git+$url.git" "cargo_lock.patch")
sha256sums=("SKIP" "cfa0d21d318e458507a2632bdd8a45d6ebcd69ff26fa9f99c7ac62fb0c6d8867")

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    cd "$srcdir/$_pkgname"
    git apply < ../cargo_lock.patch
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cd "$srcdir/$_pkgname"
    cargo build --frozen --release --features="ffmpeg-system"
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
