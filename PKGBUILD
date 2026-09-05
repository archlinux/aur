# Maintainer:  Rubin Simons <me@rubin55.org>

pkgname=computer-use-linux
pkgver=0.5.0
pkgrel=1
pkgdesc="Control a real Linux desktop from any MCP host (AT-SPI, portals, multi-compositor window targeting)"
arch=('x86_64' 'aarch64')
url="https://github.com/agent-sh/computer-use-linux"
license=('MIT')
depends=('at-spi2-core' 'gcc-libs' 'glibc')
makedepends=('cargo')
checkdepends=('dbus')
optdepends=(
    'gnome-screenshot: screenshot fallback for background sessions'
    'hyprland: window targeting on Hyprland'
    'i3-wm: window targeting on i3'
    'sway: window targeting on Sway'
    'wmctrl: window management on generic X11/EWMH'
    'wtype: text input on wlroots compositors'
    'xdotool: keyboard input on X11 sessions'
    'xorg-xprop: window PID hydration on X11'
    'ydotool: input fallback when the RemoteDesktop portal is unavailable'
)
conflicts=('computer-use-linux-bin')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d7f0be220a8e9e0d2ebc8bb64705b3b67ccdf7458c75bb3964173613b0d56a08')

prepare() {
    cd "${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable

    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "${pkgname}-${pkgver}"
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
    cd "${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable

    # The KWin backend tests spawn a private dbus-daemon (see checkdepends).
    cargo test --frozen --release
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm755 "target/release/${pkgname}-cosmic" "${pkgdir}/usr/bin/${pkgname}-cosmic"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
