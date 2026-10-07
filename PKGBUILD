# Maintainer:  Rubin Simons <me@rubin55.org>

pkgbase=computer-use-linux
pkgname=('computer-use-linux' 'gnome-shell-extension-computer-use-linux')
pkgver=0.7.11
pkgrel=4
pkgdesc="Control a real Linux desktop from any MCP host (AT-SPI, portals, multi-compositor window targeting)"
arch=('x86_64' 'aarch64')
url="https://github.com/agent-sh/computer-use-linux"
license=('MIT')
makedepends=('cargo')
checkdepends=('dbus')
source=(
  "${pkgbase}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
  "${pkgbase}-pr230.patch::${url}/pull/230.patch"
  "${pkgbase}-pr231.patch::${url}/pull/231.patch"
  "${pkgbase}-pr232.patch::${url}/pull/232.patch")
sha256sums=('3554e606e3f05d544ac2e4c014bb7797ac6a4c0868433d3e191a27f37a0ee809'
            '2edb81a431d6cf52dcecfbb78568fcd849bd5f94f503c807b6607160e1b17309'
            '50ca574425ba6c9b67f4d04ca7047039e4a60b7b539bd97424877360df83c07e'
            'eacdbf947fb3c53e717da3b14c219393fe198670cdd23a1404a67d50ed18a55b')

_uuid=computer-use-linux@avifenesh.dev

prepare() {
    cd "${pkgbase}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    patch -p1 -i "${srcdir}/${pkgbase}-pr230.patch"
    patch -p1 -i "${srcdir}/${pkgbase}-pr231.patch"
    patch -p1 -i "${srcdir}/${pkgbase}-pr232.patch"
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
