# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Co-maintainer: Yurii Kolesnykov <root@yurikoles.com>
# Based on extra/electron* by
# Bruno Pagani <archange@archlinux.org>
# Caleb Maclennan <caleb@alerque.com>
_projectname=electron
_major=43
_pkgname="${_projectname}${_major}"
pkgname="${_pkgname}"-bin
_subver='7.7'
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
sha256sums=('cea9f99f6d0a9a8bab239ffd2192dca3adf4f769b3123a2f366983c82d572ac9')
sha256sums_aarch64=('091707f83e4191f36848152d664c80c255572dfe36a042250ca94037c06959d2'
                    '16071038a9677d0f00b11d3d0f0b7b4ea3250987727aa73aa563b87789f2d5ab')
sha256sums_armv7h=('9c3dc509c12709522a22e3c4eb3270907050391fe05d89f68ab5ea689f9aa5b2'
                   '088c2817c1b5928c5bea706cc60aa05ea328e6d1d8bd549fda75388a3552482a')
sha256sums_x86_64=('7ea6157ec70b065ef6a7f77fc1822dc6441f5702b0f99660e26cfca1897ecfa4'
                   '4d0a48398c444258dbcf2f5f83b49ca5bc53583130f354e0c299dad5b22b5271')
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
