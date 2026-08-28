# Maintainer: coffee <catheadcoffee@gmail.com>
# cua-driver — desktop control daemon from trycua/cua (cua-driver-rs).
#
# Split out of hermes-agent-bin: cua-driver is released independently
# (cua-driver-rs-v* tags on the trycua/cua repo) and has its own cadence,
# so it gets its own package. Hermes Agent consumes it via PATH lookup
# (default command "cua-driver", override HERMES_CUA_DRIVER_CMD), so this
# package installs /usr/bin/cua-driver and the auxiliary files that must
# sit next to the real binary (cua-cursor-theme compiler, SDK libs,
# wayland-helper GNOME extension).
#
# Layout rationale (matches upstream install.sh semantics):
#   /usr/lib/cua-driver/          real binary + aux files (version dir)
#   /usr/bin/cua-driver           -> /usr/lib/cua-driver/cua-driver
#   /usr/bin/cua-cursor-theme     -> /usr/lib/cua-driver/cua-cursor-theme
#   /usr/lib/systemd/user/cua-driver.service
#
# cua-driver resolves its own real path (binary_path via /proc/self/exe
# equivalent) and locates aux files relative to it — verified with the
# symlinked layout above. Keeping everything in one directory preserves
# that contract, unlike scattering files across /usr/bin and /usr/share.

pkgname=cua-driver-bin
pkgver=0.22.2
pkgrel=1
pkgdesc="Desktop control daemon (cua-driver-rs) from trycua/cua — background window driving, clicks, typing, browser automation via MCP"
arch=('x86_64')
url="https://github.com/trycua/cua"
license=('Apache-2.0')
depends=(
    'libx11'
    'libxi'
    'libxkbcommon'
    'glibc'
    'gcc-libs'
)
optdepends=(
    'gnome-shell: wayland-helper GNOME extension (winrects@cua)'
    'ffmpeg: video capture (start_recording)'
    'wf-recorder: native Wayland video capture'
)

# Binary tarball from the cua-driver-rs-v* release tag (official channel).
# Only linux-x86_64 assets are published (aarch64/armv7 return 404).
source=(
    "cua-driver-rs-${pkgver}-linux-x86_64-binary.tar.gz::https://github.com/trycua/cua/releases/download/cua-driver-rs-v${pkgver}/cua-driver-rs-${pkgver}-linux-x86_64-binary.tar.gz"
    "cua-driver.service"
)
sha256sums=('cc66abc3344f7573f6af36e741f7e82a43fd24c5cbf9d71d83dffb33a0e32506'
            'SKIP')

# ── Package ─────────────────────────────────────────────────────────
package() {
    local _libdir="${pkgdir}/usr/lib/cua-driver"
    install -d "$_libdir"

    # Extract everything into /usr/lib/cua-driver/ — cua-driver finds
    # cua-cursor-theme, libcua_driver_sdk.so, cua_driver_node_runtime.node
    # and wayland-helper/ relative to its own real path.
    tar xzf "${srcdir}/cua-driver-rs-${pkgver}-linux-x86_64-binary.tar.gz" -C "$_libdir"

    # Visible PATH entries (symlinks; real binary stays in /usr/lib).
    install -d "${pkgdir}/usr/bin"
    ln -s /usr/lib/cua-driver/cua-driver "${pkgdir}/usr/bin/cua-driver"
    ln -s /usr/lib/cua-driver/cua-cursor-theme "${pkgdir}/usr/bin/cua-cursor-theme"

    # systemd user service for the daemon.
    install -Dm644 "${srcdir}/cua-driver.service" \
        "${pkgdir}/usr/lib/systemd/user/cua-driver.service"
}

install=${pkgname}.install
