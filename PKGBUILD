# Maintainer: Ghostdehole <dihenggan@outlook.com>

pkgname='gui.for.singbox-bin'
_pkgname='GUI.for.SingBox'
_v1_asset='GUI.for.SingBox-linux-amd64-v1.zip'
_v3_asset='GUI.for.SingBox-linux-amd64.zip'
pkgver='1.29.0'
pkgrel=3
pkgdesc='GUI for SingBox (Desktop optimized with user-space data isolation)'
arch=('x86_64' 'aarch64')
url="https://github.com/GUI-for-Cores/${_pkgname}"
license=('GPL-3.0-or-later')
options=('!strip')
depends=('bash' 'coreutils' 'diffutils' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3'
         'hicolor-icon-theme' 'libcap' 'libsoup3' 'sing-box>=1.14.0' 'webkit2gtk-4.1')
optdepends=('xdg-desktop-portal-gtk: For GTK portal theme detection'
            'dconf: Persist GNOME settings'
            'gsettings-desktop-schemas: GNOME desktop theme and system proxy integration'
            'kconfig: Plasma system proxy integration'
            'polkit: Grant TUN privileges from the GUI')
provides=('gui.for.singbox' 'gui-for-singbox')
conflicts=('gui.for.singbox' 'gui-for-singbox' 'gui-for-singbox-bin')

install="gui.for.singbox-bin.install"

_release_url="${url}/releases/download/v${pkgver}"
source=("${_pkgname}-${pkgver}-appicon.png::https://raw.githubusercontent.com/GUI-for-Cores/${_pkgname}/v${pkgver}/build/appicon.png"
        "gui-for-singbox.sh"
        "gui-for-singbox.desktop"
        "gui-for-singbox-cap.hook")
source_x86_64=("${_pkgname}-${pkgver}-v1.zip::${_release_url}/${_v1_asset}")
source_aarch64=("${_pkgname}-${pkgver}-arm64.zip::${_release_url}/${_pkgname}-linux-arm64.zip")
noextract=("${_pkgname}-${pkgver}-v1.zip" "${_pkgname}-${pkgver}-arm64.zip")
if [[ -n ${_v3_asset} ]]; then
    source_x86_64+=("${_pkgname}-${pkgver}-v3.zip::${_release_url}/${_v3_asset}")
    noextract+=("${_pkgname}-${pkgver}-v3.zip")
fi

sha256sums=('08257d0d21c76a56e48e38105460927293a452ddc6b0b62db401bf5b5b9b7adf'
            'f37797cfcab15a7e2a30fae168f5d09ec6196c27c0aa6e6e227636345592f16a'
            'fea47ff434d0dcb92973181e8b8db93c1e3339db1cf7f3db44c7e81e6e1ccf53'
            'ae0754a61b396da843ea6dc4738f4d5e3f8b423e8ffec66e5265a5c1f4286004')
sha256sums_x86_64=('ea4bf0d00afd1dd8fc7c5e58c790f7485a61580ba335a975cf504d121f184ca6'
                   '0bbee2b6daeba6a1c3fa5440a65445f2562e06071f012d28040ca8467b804b7f')
sha256sums_aarch64=('99087d104856d9464641199a3b2e30183295465eda3dfb44701cdaa20fa857de')

package() {
    local binary="${pkgdir}/usr/lib/gui-for-singbox/${_pkgname}" archive
    case "$CARCH" in
        x86_64) archive="${_pkgname}-${pkgver}-v1.zip" ;;
        aarch64) archive="${_pkgname}-${pkgver}-arm64.zip" ;;
        *) return 1 ;;
    esac
    install -dm755 "${pkgdir}/usr/lib/gui-for-singbox"
    bsdtar -xOf "${srcdir}/${archive}" "${_pkgname}" > "${binary}"
    chmod 755 "${binary}"
    if [[ $CARCH == x86_64 && -n ${_v3_asset} ]]; then
        bsdtar -xOf "${srcdir}/${_pkgname}-${pkgver}-v3.zip" "${_pkgname}" > "${binary}-v3"
        chmod 755 "${binary}-v3"
    fi
    install -Dm755 "${srcdir}/gui-for-singbox.sh" "${pkgdir}/usr/bin/gui-for-singbox"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}-appicon.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/gui-for-singbox.png"
    install -Dm644 "${srcdir}/gui-for-singbox.desktop" -t "${pkgdir}/usr/share/applications/"
    install -Dm644 "${srcdir}/gui-for-singbox-cap.hook" -t "${pkgdir}/usr/share/libalpm/hooks/"
}
