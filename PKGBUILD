# Maintainer: z3n <z3nlabs at proton dot me>

pkgname=fcp-support-git
_pkgname=fcp-support
pkgver=r21.edae476
pkgrel=2
pkgdesc="Focusrite Control Protocol user-space driver for Scarlett 4th Gen big models (16i16, 18i16, 18i20)"
arch=('x86_64' 'i686')
url="https://github.com/geoffreybennett/fcp-support"
license=('GPL-3.0-or-later')
depends=(
    'alsa-lib'
    'systemd-libs'
    'openssl'
    'zlib'
    'json-c'
    'libcap'
)
makedepends=(
    'gcc'
    'make'
    'git'
    'pkgconf'
)
optdepends=(
    'alsa-scarlett-gui-git: GUI for controlling Focusrite interfaces'
    'scarlett4-firmware: Firmware files for Scarlett 4th Gen (required for first-time setup)'
    'polkit: Passwordless start/stop of fcp-server for audio group users (recommended)'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
install=$pkgname.install
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    # Get version from git tags
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$_pkgname"

    # Build with proper version string and PREFIX
    VERSION="$(git describe --abbrev=4 --dirty --always --tags 2>/dev/null || echo 'Unknown')" \
    PREFIX=/usr \
    make
}

package() {
    cd "$srcdir/$_pkgname"

    # Install to /usr instead of /usr/local
    make install \
        PREFIX=/usr \
        DESTDIR="$pkgdir"

    # Install systemd drop-in to fix StopWhenUnneeded issue
    # The upstream service has StopWhenUnneeded=yes which causes systemd to stop
    # the service immediately after udev starts it, breaking reliability
    install -Dm644 /dev/stdin \
        "$pkgdir/usr/lib/systemd/system/fcp-server@.service.d/arch.conf" <<'EOF'
# Arch Linux package override for fcp-server auto-stop issue
# See: https://github.com/geoffreybennett/fcp-support/issues
#
# The upstream service has StopWhenUnneeded=yes which conflicts with udev-based
# activation. This override keeps the service running while the device is connected.

[Unit]
# Keep service running while device is connected
StopWhenUnneeded=no

[Service]
# Always restart on crash
Restart=always
RestartSec=3
EOF

    # Install polkit rule to allow audio group to manage fcp-server without password
    # This enables alsa-scarlett-gui to auto-start the server seamlessly
    install -Dm644 /dev/stdin \
        "$pkgdir/usr/share/polkit-1/rules.d/50-fcp-server.rules" <<'EOF'
// Allow audio group members to start/stop fcp-server without authentication
// This enables seamless integration with alsa-scarlett-gui
polkit.addRule(function(action, subject) {
    if (action.id == "org.freedesktop.systemd1.manage-units" &&
        action.lookup("unit").match(/^fcp-server@[0-9]+\.service$/) &&
        subject.isInGroup("audio")) {
        return polkit.Result.YES;
    }
});
EOF
}
