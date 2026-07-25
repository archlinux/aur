# Maintainer: axpnet <aeroftp@axpdev.it>
# https://github.com/axpdev-lab/aeroftp

pkgname=aeroftp-bin
pkgver=4.1.6
pkgrel=1
pkgdesc="Modern multi-protocol file client with AI, encryption and cloud storage (FTP, SFTP, WebDAV, S3, 26 protocols)"
arch=('x86_64')
url="https://aeroftp.app"
license=('GPL-3.0-or-later')
# cosign verifies the release .deb against its Sigstore bundle at build time
# (see prepare()). It is in the official 'extra' repo, a self-contained Go
# binary, so it adds no AUR dependency and no cycle.
makedepends=('cosign')
depends=(
    'webkit2gtk-4.1'
    'gtk3'
    'openssl'
    'libsoup3'
    'glib2'
    'cairo'
    'pango'
    'gdk-pixbuf2'
    'libappindicator-gtk3'
)
optdepends=(
    'xdg-utils: for opening URLs in browser'
    'libsecret: for OS keyring credential storage'
    'gnome-keyring: for GNOME keyring integration'
    'kwallet: for KDE wallet integration'
)
provides=('aeroftp')
conflicts=('aeroftp' 'aeroftp-git')
options=('!strip' '!debug')
# Use .deb instead of AppImage to avoid EGL_BAD_PARAMETER on some GPU drivers.
# The .deb stays sha256-pinned; its Sigstore bundle is fetched alongside and
# authenticated in prepare(), so the bundle itself needs no checksum (SKIP): a
# swapped bundle either fails cosign or attests a different artifact than our
# pinned .deb. Keep the .deb as sha256sums[0] (release/SKILL.md step 10 replaces
# index 0 each release; both URLs carry ${pkgver} so they update automatically).
source=(
    "${pkgname}-${pkgver}.deb::https://github.com/axpdev-lab/aeroftp/releases/download/v${pkgver}/AeroFTP_${pkgver}_amd64.deb"
    "${pkgname}-${pkgver}.deb.sigstore.json::https://github.com/axpdev-lab/aeroftp/releases/download/v${pkgver}/AeroFTP_${pkgver}_amd64.deb.sigstore.json"
)
sha256sums=(
    'eb4a00f69f2f68169c607c84aae124662b61f69be8ec5dfe171e95ac2010d822'
    'SKIP'
)

# The MimeType line that the .deb's postinst appends at install time. pacman never
# runs a Debian postinst, so package() has to apply it. Tauri 2 does not propagate
# fileAssociations into the generated .desktop file, so the file inside data.tar
# carries no MimeType at all. Keep this in sync with src-tauri/scripts/deb-postinst.sh.
_mimetypes='application/x-aerovault;application/x-aeroftp;application/x-aeroftp-keystore;application/x-aerozip;application/x-aeroftp-script;x-scheme-handler/ftp;x-scheme-handler/ftps;x-scheme-handler/sftp;'

prepare() {
    cd "${srcdir}"
    # Verify the release .deb against its Sigstore bundle, pinning the exact
    # GitHub Actions workflow identity and OIDC issuer. This proves the artifact
    # was built and signed by our tagged release workflow (keyless OIDC, zero
    # secrets), not merely that it matches a hash we recorded ourselves. cosign
    # exits non-zero on any mismatch (wrong identity, tampered payload), which
    # aborts the build. The identity carries ${pkgver}, so it re-pins per release.
    cosign verify-blob \
        --bundle "${pkgname}-${pkgver}.deb.sigstore.json" \
        --certificate-identity "https://github.com/axpdev-lab/aeroftp/.github/workflows/build.yml@refs/tags/v${pkgver}" \
        --certificate-oidc-issuer "https://token.actions.githubusercontent.com" \
        "${pkgname}-${pkgver}.deb"
}

package() {
    # Extract .deb package (contains native binaries, no AppImage wrapper).
    # This already provides /usr/bin/aeroftp (the dispatcher), the aftp and
    # aeroftp-cli symlinks, AeroFTP.desktop and the full hicolor icon set.
    cd "${srcdir}"
    bsdtar -xf data.tar.* -C "${pkgdir}/"

    # Restore the file associations the postinst would have added. Without this
    # no .aerovault/.aeroftp/.aerozip/.aeroftp-keystore/.aeroftp-script file
    # opens with AeroFTP on Arch.
    local _desktop
    for _desktop in \
        "${pkgdir}/usr/share/applications/AeroFTP.desktop" \
        "${pkgdir}/usr/share/applications/com.aeroftp.AeroFTP.desktop" \
        "${pkgdir}/usr/share/applications/aeroftp.desktop"
    do
        [ -f "${_desktop}" ] || continue
        grep -q '^MimeType=' "${_desktop}" || printf 'MimeType=%s\n' "${_mimetypes}" >> "${_desktop}"
    done

    # The in-app updater downloads a .deb and installs it through pkexec, which
    # cannot work on a pacman system. Remove the helper and its polkit action so
    # the updater has nothing to invoke.
    rm -f "${pkgdir}/usr/lib/aeroftp/aeroftp-update-helper"
    rm -rf "${pkgdir}/usr/share/polkit-1"

    # License
    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
    cat > "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" << 'EOF'
AeroFTP is licensed under the GNU General Public License v3.0.
See https://github.com/axpdev-lab/aeroftp/blob/main/LICENSE for the full text.
EOF
}
