# Maintainer: Anty0 <anty150 at gmail dot com>


# Helper variables for updaurpkg (https://aur.archlinux.org/packages/updaurpkg-git)
_upstreamver='9:01a0fee7-c824-7981-b766-e6c08ed50bbf'
_upstreamver_regex='^[0-9]+:[0-9a-f]{8}(-[0-9a-f]{4}){3}-[0-9a-f]{12}$'
_source_type='custom'
_upstreamver_check() {
    curl --no-progress-meter 'https://core.openworld.pascard.com/manifest.json' | \
        jq -r '.updater | "\(.build):\(.files["linux-x64"].url | split("/")[-2])"'
}

pkgname='openworld-bin'
_pkgname='openworld'
pkgver="${_upstreamver%%:*}"
_release_id="${_upstreamver#*:}"
pkgrel=1
pkgdesc="Voxel sandbox game on a whole round planet (updater, downloads the game)"
url="https://www.play-openworld.com"
depends=(
    'curl'
    'glibc'
    'hicolor-icon-theme'
    'vulkan-icd-loader'
    'zlib'
)
optdepends=(
    'zenity: file dialogs'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
license=('LicenseRef-Openworld')
arch=('x86_64')
options=('!strip' '!debug')
source=(
    "${_pkgname}-updater-${pkgver}-linux-x64.tar.gz::https://ow-bucket.s3.eu-west-par.io.cloud.ovh.net/releases/updater/${_release_id}/Openworld-linux-x64.tar.gz"
    "${_pkgname}-${pkgver}.png::${url}/assets/img/icon-256.png"
    "${_pkgname}.desktop"
    "LICENSE"
)
sha256sums=('1bcbe974d96550d7c01cdbe8fc056889bae93cdf940bf4c0e9a040eb2bb6df28'
            '3ffdb01d73684b13ecd8f868a1eaa62c739700de00cf9ad2bd42e0b393fd226f'
            '71584a73b4113cca7a4af315249fca5ef6bb3b9855a1a2fbdb9be8e1b22754b0'
            'c2477d71534430c051161a560888e172381b654d42edc41c888c25bb8c7ab30e')

package() {
    install -Dm755 "${srcdir}/Openworld" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${_pkgname}.png"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
