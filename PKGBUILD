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
pkgver=0.47.19
pkgrel=1
pkgdesc="Desktop control daemon (cua-driver-rs) from trycua/cua — background window driving, clicks, typing, browser automation via MCP"
arch=('x86_64')
url="https://github.com/trycua/cua"
# Upstream root LICENSE.md is MIT and covers Cua Driver unless a subdirectory
# ships its own LICENSE (see legal/LICENSING.md); the driver crate declares
# license = "MIT" in libs/cua-driver/rust/Cargo.toml.
license=('MIT')
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
# The tarball carries no license text, so LICENSE.md is fetched from the
# same tag and installed under /usr/share/licenses/.
source=(
    "cua-driver-rs-${pkgver}-linux-x86_64-binary.tar.gz::https://github.com/trycua/cua/releases/download/cua-driver-rs-v${pkgver}/cua-driver-rs-${pkgver}-linux-x86_64-binary.tar.gz"
    "LICENSE.md::https://raw.githubusercontent.com/trycua/cua/cua-driver-rs-v${pkgver}/LICENSE.md"
    "cua-driver.service"
)
sha256sums=('a9b89435e4257467749e5da12770d74882e1e250925e3079b05a392f824b0e71'
            'c0779290c1d4783169aa3dbfb55feb505e563ef8a004bbf55298ceffcfbda8d9'
            'SKIP')

# ── Package ─────────────────────────────────────────────────────────
package() {
    local _libdir="${pkgdir}/usr/lib/cua-driver"
    install -d "$_libdir"

    # Extract everything into /usr/lib/cua-driver/ — cua-driver finds
    # cua-cursor-theme, libcua_driver_sdk.so, cua_driver_node_runtime.node
    # and wayland-helper/ relative to its own real path.
    # --no-same-owner: the tarball is root-owned; don't rely on chown() to
    # restore it (inside fakeroot the archive already lands as root).
    tar xzf "${srcdir}/cua-driver-rs-${pkgver}-linux-x86_64-binary.tar.gz" \
        -C "$_libdir" --no-same-owner

    # Visible PATH entries (symlinks; real binary stays in /usr/lib).
    install -d "${pkgdir}/usr/bin"
    ln -s /usr/lib/cua-driver/cua-driver "${pkgdir}/usr/bin/cua-driver"
    ln -s /usr/lib/cua-driver/cua-cursor-theme "${pkgdir}/usr/bin/cua-cursor-theme"

    # systemd user service for the daemon.
    install -Dm644 "${srcdir}/cua-driver.service" \
        "${pkgdir}/usr/lib/systemd/user/cua-driver.service"

    # MIT requires shipping the copyright notice with the binaries.
    install -Dm644 "${srcdir}/LICENSE.md" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}

install=${pkgname}.install
