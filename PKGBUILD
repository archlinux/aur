# Maintainer: Ismet Togay <ismet.togay+archlinux@gmail.com>
#
# UYAP Editor — Turkish judicial-system document/template editor.
# Binary redistribution of upstream's Debian package from the Ministry
# of Justice (Adalet Bakanlığı).
#
# Upstream landing pages:
#   https://uyap.gov.tr/UYAP-Editor
#   https://rayp.adalet.gov.tr/
#
# Per-release bump checklist:
#   1. Visit https://rayp.adalet.gov.tr/ and locate the new zip URL
#      (the filename contains a non-deterministic timestamp slug).
#   2. Update pkgver to the upstream version (e.g. 5.4.16 → 5.4.17).
#   3. Update the _zipurl variable below with the new URL.
#   4. Run `updpkgsums` to refresh the zip checksum.
#   5. Build with `makepkg -f` in a clean chroot and verify with namcap.
#   6. Regenerate .SRCINFO: `makepkg --printsrcinfo > .SRCINFO`.
#
# If you edit ANY local file listed in source=() (notably
# uyap-editor-bin.install, the .desktop files, uyap-editor.xml,
# uyap-dokuman, uyap-sablon, LICENSE), you MUST:
#   a. Run `updpkgsums` to refresh its sha256 entry.
#   b. Bump pkgrel.
#   c. Regenerate .SRCINFO *after* the sum update.
#   d. Verify with `makepkg --verifysource -o`.
# Skipping (a) causes "did not pass the validity check" at install
# time — .SRCINFO regen does NOT recompute hashes.

pkgname=uyap-editor-bin
pkgver=5.4.17
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
provides=('uyap-editor')
conflicts=('uyap-editor' 'uyapeditor' 'uyap')
replaces=('uyap')
options=('!strip')
install="${pkgname}.install"

_zipurl='https://rayp.adalet.gov.tr/resimler/2/dosya/uyapeditor-5417-amd6403-06-20263-09-pm.zip'

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
sha256sums=('df6974081a71a521e5290badab50fdc3d5083d6577ba58219e163bf1596fc258'
            'd9a8cdea5b14235c252ad21abd7ecdef5ce9347d85d624d4ce0d0da615d9d8cd'
            '6311a3cd1a68c7312d6633fdd8e00dd47988907722ac609d00d68762b430c1eb'
            '0cc1749ba298862da0a26172af44dbcc1396ad9f36ca160d6c6b0cbad6eae929'
            '8b4572bd43a1a5dc824fa1cc90369d77973455d5c4f76a1daaa43e258f2ccd8f'
            '57258cbf56e59f1adb3d036ebf5dfa14c12cb3d3cf9e52995bca1907d08ac135'
            '15d61066c988b5e00501b14d785dc63a20f485a4660f9815ed463189b8806081'
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
