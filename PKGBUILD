# Maintainer:  Rubin Simons <me@rubin55.org>

pkgbase=computer-use-linux
pkgname=('computer-use-linux' 'gnome-shell-extension-computer-use-linux')
pkgver=0.7.13
pkgrel=1
pkgdesc="Control a real Linux desktop from any MCP host (AT-SPI, portals, multi-compositor window targeting)"
arch=('x86_64' 'aarch64')
url="https://github.com/agent-sh/computer-use-linux"
license=('MIT')
makedepends=('cargo')
checkdepends=('dbus')
source=("${pkgbase}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('6cbb29a8c5154dce881f2f52e425f89e14563f5b0bb11424ac21ffe8a023d581')

_uuid=computer-use-linux@avifenesh.dev

prepare() {
    cd "${pkgbase}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable

    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "${pkgbase}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable

    # mimalloc builds its C sources with the cc crate; GCC LTO objects hide
    # those symbols from rust-lld and linking fails with undefined mi_*
    # references.
    export CFLAGS="${CFLAGS//-flto=auto/}"
    export CXXFLAGS="${CXXFLAGS//-flto=auto/}"

    # Upstream strips symbols via [profile.release]; keep DWARF so the
    # global !strip/debug OPTIONS stay meaningful for Rust binaries.
    export CARGO_PROFILE_RELEASE_STRIP=none
    export CARGO_PROFILE_RELEASE_DEBUG=2

    cargo build --frozen --release
}

check() {
    cd "${pkgbase}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable

    # The KWin backend tests spawn a private dbus-daemon (see checkdepends).
    cargo test --frozen --release
}

package_computer-use-linux() {
    depends=('at-spi2-core' 'gcc-libs' 'glibc')
    optdepends=(
        'gnome-screenshot: screenshot fallback for background sessions'
        'gnome-shell-extension-computer-use-linux: window targeting on GNOME'
        'hyprland: window targeting on Hyprland'
        'i3-wm: window targeting on i3'
        'niri: window targeting on niri'
        'sway: window targeting on Sway'
        'wmctrl: window management on generic X11/EWMH'
        'wtype: text input on wlroots compositors'
        'xdotool: keyboard input on X11 sessions'
        'xorg-xprop: window PID hydration on X11'
        'ydotool: input fallback when the RemoteDesktop portal is unavailable'
    )
    conflicts=('computer-use-linux-bin')

    cd "${pkgbase}-${pkgver}"
    install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm755 "target/release/${pkgname}-cosmic" "${pkgdir}/usr/bin/${pkgname}-cosmic"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_gnome-shell-extension-computer-use-linux() {
    pkgdesc="GNOME Shell extension for computer-use-linux window targeting"
    arch=('any')
    depends=('computer-use-linux' 'gnome-shell')
    install="${pkgname}.install"

    cd "${pkgbase}-${pkgver}"
    install -Dm644 -t "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}" \
        "gnome-shell-extension/${_uuid}/metadata.json" \
        "gnome-shell-extension/${_uuid}/extension.js"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
