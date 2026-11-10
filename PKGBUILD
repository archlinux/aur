# Maintainer: czyt <czytcn@gmail.com>

pkgname=mister-download-manager-bin
pkgver=0.5.2
pkgrel=1
pkgdesc="Open-source download manager with multi-connection downloads, browser integration, video and torrent support"
arch=('x86_64')
url="https://misterdownloadmanager.com"
license=('GPL-3.0-or-later')
depends=(
    'ca-certificates'
    'gcc-libs'
    'glibc'
    'gtk3'
    'hicolor-icon-theme'
    'libglvnd'
    'libxkbcommon'
    'libxkbcommon-x11'
)
provides=('misterdownloadmanager')
conflicts=('misterdownloadmanager')
options=('!strip' '!debug')

_deb="MisterDownloadManager-${pkgver}-linux-x86_64.deb"
source_x86_64=("${_deb}::https://github.com/anefzaoui/misterdownloadmanager/releases/download/v${pkgver}/${_deb}")
noextract=("${_deb}")
sha256sums_x86_64=('9d330d9684a0819cea987cae7601b1c5078fc7752095ea6e6b2f2fef035a92e1')

package() {
    local _data_member
    _data_member=$(ar t "${srcdir}/${_deb}" |
        awk '/^data\.tar\.(gz|xz|zst|bz2|lzma)$/ { print; exit }')
    [[ -n "${_data_member}" ]] || { echo "deb has no supported data archive" >&2; return 1; }

    # The payload already uses standard paths: binaries in /usr/bin, the
    # browser native-messaging manifests point at /usr/bin/misterdownloadmanager-nmhost,
    # and the extensions live under /usr/share/misterdownloadmanager.
    ar p "${srcdir}/${_deb}" "${_data_member}" |
        bsdtar --no-same-owner -xf - -C "${pkgdir}"

    # The shipped entry has no StartupWMClass, so panels match the window to it
    # only by guesswork; the app reports "misterdownloadmanager".
    local _desktop="${pkgdir}/usr/share/applications/misterdownloadmanager.desktop"
    grep -q '^StartupWMClass=' "${_desktop}" ||
        echo 'StartupWMClass=misterdownloadmanager' >> "${_desktop}"

    install -Dm644 "${pkgdir}/usr/share/doc/misterdownloadmanager/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${pkgdir}/usr/share/doc/misterdownloadmanager/ATTRIBUTION.md" \
        "${pkgdir}/usr/share/licenses/${pkgname}/ATTRIBUTION.md"
    rm -r "${pkgdir}/usr/share/doc"

    chmod -R u=rwX,go=rX "${pkgdir}"
    chown -R root:root "${pkgdir}"
}
