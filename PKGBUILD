# Maintainer: Lamco Development LLC <office@lamco.io>
#
# lamboot-archinstall — registers the LamBoot archinstall plugin so that
# `archinstall` (the Arch Linux guided installer) offers "lamboot" in its
# Bootloader menu and installs it via `lamboot-install` at OS-install time.
#
# Kept SEPARATE from lamboot-bin on purpose: this package pulls python +
# archinstall as deps, which the plain bootloader package should not. Install
# it only when you want install-time archinstall integration:
#     pacman -S lamboot-archinstall   (or an AUR helper)
# then run `archinstall`.
#
# NOTE (decoupled/render model, matching lamboot-bin): the checksum arrays keep
# SKIP placeholders in the dev tree; the publish/render step stamps the real
# digest of the verified release artifact at push time (see PACKAGING.md §4).
#
# STATUS: DRAFT — verify on an Arch host before AUR publish:
#   makepkg --printsrcinfo > .SRCINFO ; namcap PKGBUILD ; makepkg -s
# and run one end-to-end live-ISO archinstall boot test (v0.16.5).

pkgname=lamboot-archinstall
pkgver=0.16.5
pkgrel=1
pkgdesc="archinstall plugin: offer LamBoot as a bootloader in the Arch Linux guided installer"
arch=('x86_64')
url="https://lamco.ai/products/lamboot/"
license=('MIT' 'Apache-2.0')
# python + archinstall: the plugin runs inside archinstall's Python.
# lamboot-bin: provides lamboot-install (invoked by the plugin) on the target.
depends=('python' 'archinstall' 'lamboot-bin')
# The plugin source ships inside the published, GPG-signed -bin release tarball
# under packaging/installers/archinstall/ — reuse that artifact rather than a
# separate download.
source=("https://github.com/lamco-admin/lamboot/releases/download/v${pkgver}/lamboot-${pkgver}-${CARCH}.tar.gz"
        "https://github.com/lamco-admin/lamboot/releases/download/v${pkgver}/lamboot-${pkgver}-${CARCH}.tar.gz.asc")
sha256sums=('SKIP' 'SKIP')
b2sums=('59be1503f8c8636b7b81222ef3f5302518e5fc93a5e1b4a2a95a8d2a660b45f77d3d8771ca362c19b4649c399a4ac2751c6ebed639f7b29f5e1c2c6348746424' 'SKIP')
# validpgpkeys=('CA11F781516743D5D9A1A12F17B95B68A50CD3A7')  # release signing key; enable once published to a keyserver

package() {
    local plugdir="${srcdir}/lamboot-${pkgver}/packaging/installers/archinstall"

    # Register the archinstall entry point into the packaged Python
    # site-packages. install-archinstall-plugin.sh writes lamboot_plugin.py +
    # a .dist-info/ carrying [archinstall.plugin] lamboot = lamboot_plugin:Plugin,
    # which archinstall auto-discovers via importlib.metadata.entry_points().
    # PREFIX="$pkgdir" stages under the package root; PYTHON pins the interpreter
    # whose purelib path the plugin lands in (must match the user's archinstall
    # Python — Arch keeps both current).
    ( cd "${plugdir}" && PREFIX="${pkgdir}" PYTHON=python3 ./install-archinstall-plugin.sh )

    # Drop any bytecode that rode along in the release tarball.
    find "${pkgdir}" -name '__pycache__' -type d -prune -exec rm -rf {} + 2>/dev/null || true
    find "${pkgdir}" -name '*.pyc' -delete 2>/dev/null || true

    install -Dm0644 "${plugdir}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
