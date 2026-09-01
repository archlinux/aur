# Maintainer: axpnet <aeroftp@axpdev.it>
# https://github.com/axpdev-lab/aeroftp

pkgname=aeroftp-bin
pkgver=4.1.9
pkgrel=1
pkgdesc="Modern multi-protocol file client with AI, encryption and cloud storage (FTP, FTPS, SFTP, WebDAV, S3, Azure, Swift, MTP)"
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
    'f0fbdd3de685d749b7d6ce1e58a44c7a5818e1785dce73156506503859f187ac'
    'SKIP'
)

# The desktop-entry edits the .deb's postinst applies at install time. pacman never
# runs a Debian postinst, so package() has to apply them. Tauri 2 does not propagate
# fileAssociations into the generated .desktop file, and its bundle category is a
# fixed macOS-style enum, so the file inside data.tar carries no MimeType, no
# Keywords, and Categories=Utility. Keep all three in sync with
# src-tauri/scripts/deb-postinst.sh (REQUIRED_DESKTOP_MIMES and the loop below it).
# The archive types are what feeds the in-app File associations panel; without them
# Arch users get the AeroFTP-owned formats only.
_mimetypes='application/x-aerovault application/x-aeroftp application/x-aeroftp-keystore application/x-aerozip application/x-aeroftp-script application/zip application/x-7z-compressed application/vnd.rar application/x-rar-compressed application/x-tar application/x-compressed-tar application/gzip application/x-xz application/x-bzip2 x-scheme-handler/ftp x-scheme-handler/ftps x-scheme-handler/sftp'
_categories='Network;FileTransfer;'
_keywords='ftp;sftp;ftps;webdav;s3;transfer;file;sync;cloud;encryption;'

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

    # Restore the desktop-entry edits the postinst would have made. Without the
    # MimeType line no .aerovault/.aeroftp/.aerozip/.aeroftp-keystore/
    # .aeroftp-script file opens with AeroFTP on Arch and the archive formats are
    # missing from the File associations panel; without Categories the launcher
    # files AeroFTP under Utility instead of Network > FileTransfer.
    local _desktop _mime _line
    for _desktop in \
        "${pkgdir}/usr/share/applications/AeroFTP.desktop" \
        "${pkgdir}/usr/share/applications/com.aeroftp.AeroFTP.desktop" \
        "${pkgdir}/usr/share/applications/aeroftp.desktop"
    do
        [ -f "${_desktop}" ] || continue

        # Merge, rather than only handling the absent case: a future Tauri release
        # may start emitting a partial MimeType line, and a blind append would
        # then leave the extra types unregistered without failing the build.
        _line=''
        if grep -q '^MimeType=' "${_desktop}"; then
            _line="$(grep -m1 '^MimeType=' "${_desktop}" | sed 's/^MimeType=//; s/;*$//')"
        fi
        for _mime in ${_mimetypes}; do
            case ";${_line};" in
                *";${_mime};"*) ;;
                *) _line="${_line:+${_line};}${_mime}" ;;
            esac
        done
        if grep -q '^MimeType=' "${_desktop}"; then
            sed -i "s|^MimeType=.*|MimeType=${_line};|" "${_desktop}"
        else
            printf 'MimeType=%s;\n' "${_line}" >> "${_desktop}"
        fi

        if grep -q '^Categories=' "${_desktop}"; then
            sed -i "s|^Categories=.*|Categories=${_categories}|" "${_desktop}"
        else
            printf 'Categories=%s\n' "${_categories}" >> "${_desktop}"
        fi
        grep -q '^Keywords=' "${_desktop}" || printf 'Keywords=%s\n' "${_keywords}" >> "${_desktop}"
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
