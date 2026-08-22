# Maintainer: Ismet Togay <ismet.togay at gmail dot com>

pkgname=uyap-editor
pkgver=5.4.20
pkgrel=1
pkgdesc='UYAP Document and Template Editor (Turkish judicial system)'
arch=('x86_64')
url='https://uyap.gov.tr/UYAP-Editor'
# Upstream publishes no license; site footer is "all rights reserved".
license=('LicenseRef-proprietary')
depends=(
    'java-runtime<=11'
    'bash'
    'hicolor-icon-theme'
    'shared-mime-info'
    'desktop-file-utils'
)
optdepends=(
    'akia: e-imza / AKİS smart-card login (pulls pcsclite and ccid)'
    'cups: printing documents from the editor'
)
conflicts=('uyap-editor-bin' 'uyapeditor' 'uyap')
provides=('uyap-editor-bin')
replaces=('uyap-editor-bin' 'uyap')
options=('!strip')

_zipurl="https://rayp.adalet.gov.tr/resimler/2/dosya/uyapeditor_${pkgver}_amd64.zip"

source=(
    "${pkgname}-${pkgver}.zip::${_zipurl}"
    'uyap-dokuman'
    'uyap-sablon'
    'uyap-editor-dokuman.desktop'
    'uyap-editor-sablon.desktop'
    'uyap-editor.xml'
    'LicenseRef-proprietary.txt'
)
noextract=("${pkgname}-${pkgver}.zip")
b2sums=('6a48b4977d78058c43ceba0ec4b054bdfd03c44129be9e6dc313376c43b819f1b80035ce559edbab751aa8998cfdd7d79725dafef4c74ca76c25f898829e03ae'
        '15e0db01c11f2a308283cadd84d20c736a885e6ceabb7564312cae444249659ef197b1a37df7401e5a304c41090626bc53fbd8cbe74a4ee7ff7668dd08600158'
        '82323e47cdf4bcded12aeb1d932dd74ef66dc78cbb4c478ef568117bf55ba18b0ec116614e56c86e412f5e2421f1691b5819b9297c47b9d5fe93ccc106073fe0'
        '07ee3c59fc38f05e69d4cd5384cd8bc6cea4e2e24ec633660567517d97194e95e60d8a8867bd4c3e2941ad42d7180f7ed506a28d6d4a67d3f072ce7766d63b8f'
        '16a61d454e6589de6f6bb2dd237db52a6f267a1be7d139219d015bcb86f53f97b236632750f3089fb4d0a58188fff531c8462d1e24e6c7d6e47b6db9ffcfc55e'
        '4513dcb48b64c80ca848d7e68607d0263da8a2797074815f4d2fbb3f364b9d0faf159f9339f0dbf990338315765203c718c82f02ac21a5f9a95fd824346ee2ef'
        'e8313c8fc193116705154f4ceed536e2758a1534b7e3575c01bda299d1e706afad0098f1bd3a709b2a2fd76e4f4343681c2f2958486e30acfd544dfee6b3ca16')

prepare() {
    bsdtar -xf "${pkgname}-${pkgver}.zip" "uyapeditor_${pkgver}_amd64.deb"

    mkdir -p deb-payload
    bsdtar -xf "uyapeditor_${pkgver}_amd64.deb" -C deb-payload
    bsdtar -xf deb-payload/data.tar.xz -C deb-payload
}

package() {
    local _payload="${srcdir}/deb-payload"

    install -dm755 "${pkgdir}/usr/share/java/uyap-editor"
    install -m644 "${_payload}/usr/share/UYAPEditor/"*.jar \
        "${pkgdir}/usr/share/java/uyap-editor/"

    install -Dm755 "${srcdir}/uyap-dokuman" "${pkgdir}/usr/bin/uyap-dokuman"
    install -Dm755 "${srcdir}/uyap-sablon"  "${pkgdir}/usr/bin/uyap-sablon"

    install -Dm644 "${srcdir}/uyap-editor-dokuman.desktop" \
        "${pkgdir}/usr/share/applications/uyap-editor-dokuman.desktop"
    install -Dm644 "${srcdir}/uyap-editor-sablon.desktop" \
        "${pkgdir}/usr/share/applications/uyap-editor-sablon.desktop"

    install -Dm644 "${srcdir}/uyap-editor.xml" \
        "${pkgdir}/usr/share/mime/packages/uyap-editor.xml"

    install -Dm644 "${srcdir}/LicenseRef-proprietary.txt" \
        -t "${pkgdir}/usr/share/licenses/${pkgname}/"

    local _size
    for _size in 16x16 32x32 48x48 128x128 256x256; do
        install -Dm644 \
            "${_payload}/usr/share/icons/hicolor/${_size}/apps/uyap-editor.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_size}/apps/uyap-editor.png"
    done
}
