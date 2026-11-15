# Maintainer: colegeming <collegeming@outlook.com>

pkgname=genoffice-arch-bin
pkgver=0.13.18
pkgrel=1
pkgdesc='Free, open-source AI office suite: docs, sheets, slides, PDF and markdown editors (official .deb repackaged)'
arch=('x86_64')
url='https://genoffice.ai/'
license=('Apache-2.0')
# Electron runtime dependencies: the deb's Depends (mapped to Arch names) plus
# libasound, which the Electron binary links directly. nodejs is NOT needed --
# the CLI runs through the bundled Electron binary with
# ELECTRON_RUN_AS_NODE=1. libappindicator is dlopen'ed for the tray icon.
depends=('alsa-lib' 'at-spi2-core' 'gtk3' 'libcups' 'libnotify' 'libsecret' 'libxss' 'libxtst' 'nss' 'util-linux-libs' 'xdg-utils')
optdepends=('libappindicator: tray icon support')
provides=('genoffice')
conflicts=('genoffice' 'genoffice-bin')
options=('!strip' '!debug')

# The payload is the upstream .deb; only the license text comes from the repo
# at the release tag (see [extras.license] in metadata.toml).
source=("genoffice_${pkgver}_amd64.deb::https://github.com/genspark-ai/genoffice/releases/download/v${pkgver}/genoffice_0.13.18_amd64.deb"
        "LICENSE::https://raw.githubusercontent.com/genspark-ai/genoffice/v0.13.18/LICENSE")
sha256sums=('29766e49a73a18444e939200fbff9b5acc38d6f24d606f41a7a1b7b7bfa0ba88'
            '68e32334df324ef4fc79fad3a26487e5abac36055a484bb6c8d7ecf9d8350885')

package() {
    cd "${srcdir}"

    # A .deb is an ar container (debian-binary, control.tar.*, data.tar.*).
    # libarchive reads the container but does not recurse into its members, so
    # unpack it once and then extract the payload tarball into $pkgdir. The deb
    # layout (/opt/GenOffice plus usr/share icons/desktop/mime) is what the
    # Electron binary and its desktop entry expect.
    bsdtar -xf "genoffice_${pkgver}_amd64.deb" data.tar.*
    bsdtar -xf data.tar.* -C "${pkgdir}"

    mkdir -p "${pkgdir}/usr/bin"
    ln -s /opt/GenOffice/genoffice "${pkgdir}/usr/bin/genoffice"

    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
