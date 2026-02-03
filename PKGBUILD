# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Co-maintainer: Yurii Kolesnykov <root@yurikoles.com>
# Based on extra/electron* by
# Bruno Pagani <archange@archlinux.org>
# Caleb Maclennan <caleb@alerque.com>
_projectname=electron
_major=39
_pkgname="${_projectname}${_major}"
pkgname="${_pkgname}"-bin
_subver='5.1'
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
sha256sums_aarch64=('5df8e3a801713af1936f59eaec5cc8b91d558fbf86fdcfe81012bc7f23fac8f4'
                    '86a472cc6725b62e5ff4f5e1e3307018b884588550f4c191d5503577f7dbfc27')
sha256sums_armv7h=('7cf415a804461c1b5ff625d9bb3cec75e356e81fc215b0a04159f098dc1f755c'
                   '4410f7783bdc378db19c1f0720658ed5a94465adcb7397c327c578f37061165a')
sha256sums_x86_64=('7aa3c1db1d441d355ae8997dcf965ec9ada1b5e5c49dca09e07de9bee506c15e'
                   'c1a84a627a5fff984774f0c147152c4fe3249dcc344b8b8e08a7dfbeb6de477c')
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
    rm -rf "${pkgdir}/usr/lib/${_pkgname}/LICENSE"*
    install -Dm644 "${srcdir}/${_pkgname}/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
