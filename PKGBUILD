# Maintainer: PeterWang-dev <PeterWang030908@hotmail.com>
# shellcheck disable=SC2034,SC2148,SC2154
_pkgname=weylus
pkgname=weylus-git
pkgver=0.11.4.r126.g8d06299
pkgrel=1
pkgdesc="Use your tablet as graphic tablet/touch screen on your computer."
arch=("x86_64")
url="https://github.com/H-M-H/Weylus"
license=("AGPL3")
conflicts=("$_pkgname" "$_pkgname-bin")
provides=("$_pkgname=${pkgver/\.r*/}")
options=(!debug !lto) # Disabled for rust build
makedepends=(rust typescript gcc libx11 pkg-config git make cmake)
depends=(libxtst libxcursor libxinerama libxft libxrandr libxcomposite libdrm libva ffmpeg dbus gst-plugins-base-libs)
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
    cargo build --frozen --release --features="ffmpeg-system"
}

package() {
    cd "$srcdir/$_pkgname"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$_pkgname"
    install -Dm0755 -t "$pkgdir/usr/share/applications/" "weylus.desktop"
}


pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
