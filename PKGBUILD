# Maintainer: Chapman <touch65536@gmail.com>

pkgname=eusoft-ting-en
pkgver=26.10.1
pkgrel=1
pkgdesc="Daily English Listening (每日英语听力) for Linux (Community Repackage)"
arch=('x86_64')
url="https://www.eudic.net/v4/en/app/ting"
license=('LicenseRef-Proprietary')
provides=('ting-en' 'eusoft-ting' 'eusoft-ting-en')
conflicts=('ting-en')
depends=(
    'alsa-lib'
    'at-spi2-core'
    'gtk3'
    'hicolor-icon-theme'
    'libnotify'
    'libsecret'
    'libxss'
    'libxtst'
    'nss'
    'util-linux-libs'
    'xdg-utils'
)
optdepends=(
    'noto-fonts-cjk: Chinese font support'
)
options=(!strip !debug)

source=(
    "ting-en.sh"
    "eusoft-ting-en.desktop"
    "LICENSE"
)
source_x86_64=(
    "${pkgname}-${pkgver}.deb::https://static-asia.frdic.com/pkg/ting_en/ting_en.deb"
)
noextract=("${pkgname}-${pkgver}.deb")

sha256sums=(
    'cb43dcf4fb84da5a129a1966f75c28ae90f0fd4420a7b0440f208aafe80df13f'
    '2c9e526e8475c970ee9be671477946a5d98eeae89ed5c356f844c2058fd054da'
    '377ddd4aecf677aa2b0fdd264f6285118f3e01f6463eb957db972d0b8404cf69'
)
sha256sums_x86_64=(
    'abd76cd54f53918a5639a3bfb965fb2782f6a568339b6e340e620122841d6420'
)

prepare() {
    rm -f data.tar.*
    bsdtar -xf "${pkgname}-${pkgver}.deb" 'data.tar.*'
}

package() {
    # Extract opt and usr hierarchies from official deb data
    bsdtar -xf data.tar.* -C "${pkgdir}"

    # Install clean launcher script
    install -Dm755 "${srcdir}/ting-en.sh" "${pkgdir}/usr/bin/ting-en"
    ln -sf ting-en "${pkgdir}/usr/bin/ting"
    ln -sf ting-en "${pkgdir}/usr/bin/${pkgname}"
    ln -sf ting-en "${pkgdir}/usr/bin/eusoft-ting"

    # Install desktop entry
    install -Dm644 "${srcdir}/eusoft-ting-en.desktop" "${pkgdir}/usr/share/applications/eusoft-ting-en.desktop"

    # Install license
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # Ensure executable permissions for electron binary
    chmod 755 "${pkgdir}/opt/每日英语听力/ting_en"

    # Normalize directory permissions
    find "${pkgdir}" -type d -exec chmod 755 {} +
}
