# Maintainer: Ismet Togay <ismet.togay at gmail dot com>

pkgname=uyap-editor
pkgver=5.4.19
pkgrel=1
pkgdesc='UYAP Document and Template Editor (Turkish judicial system)'
arch=('x86_64')
url='https://uyap.gov.tr/UYAP-Editor'
license=('LicenseRef-UYAP')
depends=(
    'java-runtime<=11'
    'pcsclite'
    'bash'
    'hicolor-icon-theme'
    'shared-mime-info'
    'desktop-file-utils'
)
optdepends=(
    'akia: smart-card / e-imza login for judicial authentication (AKIS middleware; provided by akia or akia-bin)'
    'cups: printing documents from the editor'
)
conflicts=('uyap-editor-bin' 'uyapeditor' 'uyap')
provides=('uyap-editor-bin')
replaces=('uyap-editor-bin' 'uyap')
options=('!strip')
install="${pkgname}.install"

_zipurl='https://rayp.adalet.gov.tr/resimler/2/dosya/uyapeditor_5.4.19_amd64.zip'

source=(
    "${pkgname}-${pkgver}.zip::${_zipurl}"
    'uyap-dokuman'
    'uyap-sablon'
    'uyap-editor-dokuman.desktop'
    'uyap-editor-sablon.desktop'
    'uyap-editor.xml'
    'LICENSE'
    "${pkgname}.install"
)
sha256sums=('e58d667a7f0e3ba9448afb16de23220b23caf3debf4b5faeab1429d481acd572'
            'd9a8cdea5b14235c252ad21abd7ecdef5ce9347d85d624d4ce0d0da615d9d8cd'
            '6311a3cd1a68c7312d6633fdd8e00dd47988907722ac609d00d68762b430c1eb'
            '0cc1749ba298862da0a26172af44dbcc1396ad9f36ca160d6c6b0cbad6eae929'
            '8b4572bd43a1a5dc824fa1cc90369d77973455d5c4f76a1daaa43e258f2ccd8f'
            '57258cbf56e59f1adb3d036ebf5dfa14c12cb3d3cf9e52995bca1907d08ac135'
            'c6d648e283f12a1d834489c0a5b5386f6e9570ca1057aa8ff6b51d0b39d54993'
            '2279f85020d5b82acc391799f310f8cef6e694c874d767b341c6145838d9d6a7')

prepare() {
    cd "${srcdir}"

    bsdtar -xf "${pkgname}-${pkgver}.zip"

    local _deb
    _deb=$(find . -maxdepth 3 -type f -name "uyapeditor_${pkgver}_amd64.deb" -print -quit)
    if [[ -z ${_deb} ]]; then
        echo "error: uyapeditor_${pkgver}_amd64.deb not found inside upstream zip" >&2
        return 1
    fi

    mkdir -p deb-payload
    bsdtar -xf "${_deb}" -C deb-payload
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

    install -Dm644 "${srcdir}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    local _size
    for _size in 16x16 32x32 48x48 128x128 256x256; do
        install -Dm644 \
            "${_payload}/usr/share/icons/hicolor/${_size}/apps/uyap-editor.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_size}/apps/uyap-editor.png"
    done
}
