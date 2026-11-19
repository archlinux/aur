# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Co-maintainer: Yurii Kolesnykov <root@yurikoles.com>
# Based on extra/electron* by
# Bruno Pagani <archange@archlinux.org>
# Caleb Maclennan <caleb@alerque.com>
pkgname=electron43-bin
pkgver=43.8.12
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
    "${pkgname%-bin}=${pkgver}"
)
conflicts=("${pkgname%-bin}")
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
    "${pkgname%-bin}-chromedriver-${pkgver}-${CARCH}.zip"
    "${pkgname%-bin}-${pkgver}-${CARCH}.zip"
)
source=("${pkgname%-bin}.sh")
source_aarch64=(
    "${pkgname%-bin}-chromedriver-${pkgver}-aarch64.zip::${_ghurl}/releases/download/v${pkgver}/chromedriver-v${pkgver}-linux-arm64.zip"
    "${pkgname%-bin}-${pkgver}-aarch64.zip::${_ghurl}/releases/download/v${pkgver}/electron-v${pkgver}-linux-arm64.zip"
)
source_armv7h=(
    "${pkgname%-bin}-chromedriver-${pkgver}-armv7h.zip::${_ghurl}/releases/download/v${pkgver}/chromedriver-v${pkgver}-linux-armv7l.zip"
    "${pkgname%-bin}-${pkgver}-armv7h.zip::${_ghurl}/releases/download/v${pkgver}/electron-v${pkgver}-linux-armv7l.zip"
)
source_x86_64=(
    "${pkgname%-bin}-chromedriver-${pkgver}-x86_64.zip::${_ghurl}/releases/download/v${pkgver}/chromedriver-v${pkgver}-linux-x64.zip"
    "${pkgname%-bin}-${pkgver}-x86_64.zip::${_ghurl}/releases/download/v${pkgver}/electron-v${pkgver}-linux-x64.zip"
)
sha256sums=('cea9f99f6d0a9a8bab239ffd2192dca3adf4f769b3123a2f366983c82d572ac9')
sha256sums_aarch64=('bcb7be36988f28bfa13065f29b12fe8ebf61266c48a1dd97e245e0c31ed42071'
                    '9293a0a8458e1bc9fe50b4e0ccd0edc780ead1818aca7d0080871f2e9b78bff7')
sha256sums_armv7h=('43f41d5e95d436cc5589e4bedffd4d97bab61e9feb31ec941b59c08cc034f09d'
                    '55e059a829c7c94020099886e7f7a428711984275ce269c2e0a7693c4f2a7359')
sha256sums_x86_64=('80068011119353809803aa4d2121fe689ec92053f2a03430116b0302bbc18c29'
                    'd3ef64c9110e5d76a382047c4557329dbd01b01cdcab1eccf8c49b382bc4e386')
prepare() {
    sed -i "s/@ELECTRON@/${pkgname%-bin}/g" "${srcdir}/${pkgname%-bin}.sh"
    install -Dm755 -d "${srcdir}/${pkgname%-bin}"
    bsdtar -xf "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.zip" -C "${srcdir}/${pkgname%-bin}"
    bsdtar -xf "${srcdir}/${pkgname%-bin}-chromedriver-${pkgver}-${CARCH}.zip" -C "${srcdir}/${pkgname%-bin}"
    rm -rf "${srcdir}/${pkgname%-bin}/"{gen,chromedriver.debug}
    chmod u+s "${srcdir}/${pkgname%-bin}/chrome-sandbox"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib"
    cp -a "${srcdir}/${pkgname%-bin}" "${pkgdir}/usr/lib"
    rm -rf "${pkgdir}/usr/lib/${pkgname%-bin}/LICENSE"*
    install -Dm644 "${srcdir}/${pkgname%-bin}/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
