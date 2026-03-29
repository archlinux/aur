# Maintainer: Tristan <https://github.com/techtoboggan>
pkgname=claude-desktop-hardened-bin
_pkgname=claude-desktop-hardened
pkgver=1.1.9493
_buildnum=3
pkgrel=3
pkgdesc="Claude Desktop for Linux (hardened) — bubblewrap sandboxing, credential redaction, permission-gated Computer Use"
arch=('x86_64')
url="https://github.com/techtoboggan/claude-desktop-hardened-linux"
license=('MIT' 'Apache-2.0')
depends=('nodejs>=18' 'npm' 'electron' 'bubblewrap' 'xdg-utils')
optdepends=(
    'socat: IPC support'
    'gnome-keyring: credential storage'
    'wmctrl: X11 window listing for Computer Use'
    'xdotool: X11 input automation for Computer Use'
    'scrot: X11 screenshot capture for Computer Use'
    'xclip: X11 clipboard access for Computer Use'
    'xorg-xrandr: X11 display info for Computer Use'
    'grim: Wayland screenshot capture for Computer Use'
    'slurp: Wayland region selection for Computer Use'
    'wl-clipboard: Wayland clipboard access for Computer Use'
    'ydotool: Wayland input automation for Computer Use'
    'wlr-randr: Wayland display info for Computer Use'
)
makedepends=('p7zip' 'icoutils' 'imagemagick' 'python' 'curl')
provides=('claude-desktop')
conflicts=('claude-desktop' 'claude-desktop-bin')
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}-${_buildnum}.tar.gz")
sha256sums=('SKIP')
options=('!strip')

build() {
    cd "${srcdir}/claude-desktop-hardened-linux-${pkgver}-${_buildnum}"
    FORMAT=arch ./build.sh
}

package() {
    cd "${srcdir}/claude-desktop-hardened-linux-${pkgver}-${_buildnum}"

    # Find the staging directory created by build.sh
    local _install_dir
    _install_dir=$(find /tmp -maxdepth 2 -type d -name "staged" -path "*claude*" 2>/dev/null | head -1)

    if [ -z "$_install_dir" ] || [ ! -d "$_install_dir/usr" ]; then
        # Fallback: look in the build directory
        _install_dir="$(pwd)/build/staged"
    fi

    if [ -d "$_install_dir/usr" ]; then
        cp -r "$_install_dir/usr" "${pkgdir}/usr"
    else
        echo "Error: Could not find staged build output"
        return 1
    fi

    # Fix chrome-sandbox permissions
    local sandbox="${pkgdir}/usr/lib/${_pkgname}/app.asar.unpacked/node_modules/electron/dist/chrome-sandbox"
    if [ -f "$sandbox" ]; then
        chmod 4755 "$sandbox"
    fi

    # Install licenses
    install -Dm644 LICENSE-MIT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
    install -Dm644 LICENSE-APACHE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
}
