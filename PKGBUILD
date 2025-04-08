# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Yurii Kolesnykov <root@yurikoles.com>
# based on aur electron8-bin: Tom Vincent <http://tlvince.com/contact/>
_projectname=electron
_major=17
_pkgname="${_projectname}${_major}"
pkgname="${_pkgname}"-bin
_subver="4.11"
_pkgver="${_major}.${_subver}"
pkgver="${_pkgver/-/.}"
pkgrel=3
pkgdesc="Build cross platform desktop apps with web technologies — prebuilt"
arch=(
    'aarch64'
    'armv7h'
	'i686'
    'x86_64'
)
url='https://electronjs.org'
_ghurl="https://github.com/electron/electron"
license=(
    'MIT'
    'LicenseRef-custom'
)
provides=(
    "${_pkgname}=${pkgver}"
)
conflicts=("${_pkgname}")
depends=(
    'alsa-lib'
    'gtk3'
    'nss'
)
optdepends=(
    'kde-cli-tools: file deletion support (kioclient5)'
	'libappindicator-gtk3: StatusNotifierItem support'
	'pipewire: WebRTC desktop sharing under Wayland'
	'trash-cli: file deletion support (trash-put)'
	"xdg-utils: open URLs with desktop's default (xdg-email, xdg-open)"
)
source_aarch64=(
    "${_pkgname}-chromedriver-${pkgver}-aarch64.zip::${_ghurl}/releases/download/v${_pkgver}/chromedriver-v${_pkgver}-linux-arm64.zip"
    "${_pkgname}-${pkgver}-aarch64.zip::${_ghurl}/releases/download/v${_pkgver}/electron-v${_pkgver}-linux-arm64.zip"
)
source_armv7h=(
    "${_pkgname}-chromedriver-${pkgver}-armv7h.zip::${_ghurl}/releases/download/v${_pkgver}/chromedriver-v${_pkgver}-linux-armv7l.zip"
    "${_pkgname}-${pkgver}-armv7h.zip::${_ghurl}/releases/download/v${_pkgver}/electron-v${_pkgver}-linux-armv7l.zip"
)
source_i686=(
    "${_pkgname}-chromedriver-${pkgver}-i686.zip::${_ghurl}/releases/download/v${_pkgver}/chromedriver-v${_pkgver}-linux-ia32.zip"
    "${_pkgname}-${pkgver}-i686.zip::${_ghurl}/releases/download/v${_pkgver}/electron-v${_pkgver}-linux-ia32.zip"
)
source_x86_64=(
    "${_pkgname}-chromedriver-${pkgver}-x86_64.zip::${_ghurl}/releases/download/v${_pkgver}/chromedriver-v${_pkgver}-linux-x64.zip"
    "${_pkgname}-${pkgver}-x86_64.zip::${_ghurl}/releases/download/v${_pkgver}/electron-v${_pkgver}-linux-x64.zip"
)
sha256sums_aarch64=('de123a2d8e195fd98ecada4664f5452003c12116fdd6195c7768bd71b8787154'
                    '53618dc3fc6c04a4b4a44261987969850ad6ae56c8a5dbf21167cf0db7fc99bf')
sha256sums_armv7h=('2435153397b31fa27dc26f7dd6de2a7a8d7c4e138ad6a3fad05427b4e99467e0'
                   '2f148ad481fe0e06dade070caecf23b7e1564b1b27d775c9350c7a5245998af2')
sha256sums_i686=('f863ee1a3462038436a387227ee60aed11957a3decfa56417c62ad75d7813f99'
                 '9654be64612f157a89928166f220792b5ab76240081a40594d01f763902d1007')
sha256sums_x86_64=('e6db902c0aadb703fcd7c415e72c8077d9e46acb5464a90ebe60bfe09c50a544'
                   'c40cc41da8f7958b4edbef953e9b0b4e830689467d1f1993c4d298677e6d0047')
prepare() {
    install -Dm755 -d "${srcdir}/${_pkgname}"
    bsdtar -xf "${srcdir}/${_pkgname}-${pkgver}-${CARCH}.zip" -C "${srcdir}/${_pkgname}"
    bsdtar -xf "${srcdir}/${_pkgname}-chromedriver-${pkgver}-${CARCH}.zip" -C "${srcdir}/${_pkgname}"
    rm -rf "${srcdir}/${_pkgname}/"{gen,chromedriver.debug}
    chmod u+s "${srcdir}/${_pkgname}/chrome-sandbox"
}
package() {
    install -Dm755 -d "${pkgdir}/usr/"{bin,lib}
    cp -r --no-preserve=ownership --preserve=mode "${srcdir}/${_pkgname}" "${pkgdir}/usr/lib"
    ln -nfs "/usr/lib/${_pkgname}/${_projectname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "${srcdir}/${_pkgname}/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}