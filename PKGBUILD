# Maintainer: axpnet <aeroftp@axpdev.it>
# https://github.com/axpdev-lab/aeroftp

pkgname=aeroftp-bin
pkgver=4.1.2
pkgrel=2
pkgdesc="Modern multi-protocol file client with AI, encryption and cloud storage (FTP, SFTP, WebDAV, S3, 26 protocols)"
arch=('x86_64')
url="https://aeroftp.app"
license=('GPL-3.0-or-later')
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
# Use .deb instead of AppImage to avoid EGL_BAD_PARAMETER on some GPU drivers
source=("${pkgname}-${pkgver}.deb::https://github.com/axpdev-lab/aeroftp/releases/download/v${pkgver}/AeroFTP_${pkgver}_amd64.deb")
sha256sums=('ba664a3d17d8278b41febf16ddd2a634136595eeb546a279433c9acc0cbed45e')

# The MimeType line that the .deb's postinst appends at install time. pacman never
# runs a Debian postinst, so package() has to apply it. Tauri 2 does not propagate
# fileAssociations into the generated .desktop file, so the file inside data.tar
# carries no MimeType at all. Keep this in sync with src-tauri/scripts/deb-postinst.sh.
_mimetypes='application/x-aerovault;application/x-aeroftp;application/x-aeroftp-keystore;application/x-aerozip;application/x-aeroftp-script;x-scheme-handler/ftp;x-scheme-handler/ftps;x-scheme-handler/sftp;'

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
