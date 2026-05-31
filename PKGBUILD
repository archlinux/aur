# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Co-maintainer: Yurii Kolesnykov <root@yurikoles.com>
# Based on extra/electron* by
# Bruno Pagani <archange@archlinux.org>
# Caleb Maclennan <caleb@alerque.com>
_projectname=electron
_major=41
_pkgname="${_projectname}${_major}"
pkgname="${_pkgname}"-bin
_subver='7.1'
_pkgver="${_major}.${_subver}"
pkgver="${_pkgver/-}"
pkgrel=1
pkgdesc="Build cross platform desktop apps with web technologies — prebuilt"
arch=(
    'aarch64'
    'armv7h'
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
    'pipewire: WebRTC desktop sharing under Wayland'
    'qt6-base: enable Qt6 with --enable-features=AllowQt'
    'gtk4: for --gtk-version=4 (GTK4 IME might work better on Wayland)'
    'trash-cli: file deletion support (trash-put)'
    "xdg-utils: open URLs with desktop's default (xdg-email, xdg-open)"
)
noextract=(
    "${_pkgname}-chromedriver-${pkgver}-${CARCH}.zip"
    "${_pkgname}-${pkgver}-${CARCH}.zip"
)
source=("${pkgname%-bin}.sh")
source_aarch64=(
    "${_pkgname}-chromedriver-${pkgver}-aarch64.zip::${_ghurl}/releases/download/v${_pkgver//_/-}/chromedriver-v${_pkgver//_/-}-linux-arm64.zip"
    "${_pkgname}-${pkgver}-aarch64.zip::${_ghurl}/releases/download/v${_pkgver//_/-}/electron-v${_pkgver//_/-}-linux-arm64.zip"
)
source_armv7h=(
    "${_pkgname}-chromedriver-${pkgver}-armv7h.zip::${_ghurl}/releases/download/v${_pkgver//_/-}/chromedriver-v${_pkgver//_/-}-linux-armv7l.zip"
    "${_pkgname}-${pkgver}-armv7h.zip::${_ghurl}/releases/download/v${_pkgver//_/-}/electron-v${_pkgver//_/-}-linux-armv7l.zip"
)
source_x86_64=(
    "${_pkgname}-chromedriver-${pkgver}-x86_64.zip::${_ghurl}/releases/download/v${_pkgver//_/-}/chromedriver-v${_pkgver//_/-}-linux-x64.zip"
    "${_pkgname}-${pkgver}-x86_64.zip::${_ghurl}/releases/download/v${_pkgver//_/-}/electron-v${_pkgver//_/-}-linux-x64.zip"
)
sha256sums=('7583672050c8131697949cdba39fd2e86f6ed9555c063bc1bc81efc9e661d78e')
sha256sums_aarch64=('336f67cce0d702066c9d42fbc1221a2ab136193b85c5ca102dafc4050ebb3a02'
                    '8a8bc763406ad19954432922347ca7c3c8db130f966871687cfb8b4ddccfa28e')
sha256sums_armv7h=('c7d42966f343703353e1b14a37ac7724f3661f6f11095f845149cafbf3e90941'
                   '895ecc3b61321699c24d3554272d116113c5dc2bf72df9b94ade87957cb8c9b3')
sha256sums_x86_64=('15abcca021cd649a03aa73c058cdbb3a32bf9cb882191c4930073458de496189'
                   '0165fc68656f49ad7ae0c4254b1ff3af1718c114b6007a2aeef5211e0562f174')
prepare() {
    sed -i "s/@ELECTRON@/${_pkgname}/g" "${srcdir}/${pkgname%-bin}.sh"
    install -Dm755 -d "${srcdir}/${_pkgname}"
    bsdtar -xf "${srcdir}/${_pkgname}-${pkgver}-${CARCH}.zip" -C "${srcdir}/${_pkgname}"
    bsdtar -xf "${srcdir}/${_pkgname}-chromedriver-${pkgver}-${CARCH}.zip" -C "${srcdir}/${_pkgname}"
    rm -rf "${srcdir}/${_pkgname}/"{gen,chromedriver.debug}
    chmod u+s "${srcdir}/${_pkgname}/chrome-sandbox"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm755 -d "${pkgdir}/usr/lib"
    cp -a "${srcdir}/${_pkgname}" "${pkgdir}/usr/lib"
    rm -rf "${pkgdir}/usr/lib/${_pkgname}/LICENSE"*
    install -Dm644 "${srcdir}/${_pkgname}/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
