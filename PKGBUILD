_name=skypeforlinux
pkgname=${_name}-bin
pkgver=8.115.0.215
pkgrel=1
pkgdesc='Skype for Linux'
arch=('x86_64')
url='https://www.skype.com/'
license=('custom')
provides=("${_name}" 'skype')
conflicts=("${_name}" 'skype')
options=('!strip' '!emptydirs')

depends=(
    'alsa-lib'
    'glibc'
    'gtk3'
    'libsecret'
    'libxss'
    'libxtst'
    'nss'
)

makedepends=(
    'squashfs-tools'
)

optdepends=(
    'org.freedesktop.secrets: keyring/password support'
    'libappindicator-gtk3: system tray icon support'
)

# curl -H 'Snap-Device-Series: 16' 'https://api.snapcraft.io/v2/snaps/info/skype'
source_x86_64=("${_name}-${pkgver}-x86_64.snap::https://api.snapcraft.io/api/v1/snaps/download/QRDEfjn4WJYnm0FzDKwqqRZZI77awQEV_336.snap")
sha256sums_x86_64=('e191d5630e9dd39fb2f4e173ccceb8cb6e9d3d7872d9905bb132c76267765644')

package() {
    local sname="source_${CARCH}"

    local extract=(
        'snap/gui/*.desktop'
        'usr/share/icons/hicolor/*/apps'
        'usr/share/pixmaps'
        'usr/share/skypeforlinux'
    )

    unsquashfs -d "${pkgdir}" "${!sname[0]%::*}" "${extract[@]}"

    local pkg_opt="${pkgdir}/opt"
    install -dm755 "${pkg_opt}"
    mv "${pkgdir}/usr/share/skypeforlinux" -t "${pkg_opt}"

    local pkg_bin="${pkgdir}/usr/bin"
    install -dm755 "${pkg_bin}"
    ln -s '/opt/skypeforlinux/skypeforlinux' -t "${pkg_bin}"

    local pkg_app="${pkgdir}/usr/share/applications"
    mv "${pkgdir}/snap/gui" -T "${pkg_app}"
    sed -e 's/Exec=skype/Exec=skypeforlinux/;s/Icon=.*/Icon=skypeforlinux/' -i "${pkg_app}/"*
}
