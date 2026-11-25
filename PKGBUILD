# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Co-maintainer: Yurii Kolesnykov <root@yurikoles.com>
# Based on extra/electron* by
# Bruno Pagani <archange@archlinux.org>
# Caleb Maclennan <caleb@alerque.com>
pkgname=electron44-bin
pkgver=44.11.6
pkgrel=1
pkgdesc="Build cross platform desktop apps with web technologies — prebuilt"
arch=(
    'aarch64'
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
source_x86_64=(
    "${pkgname%-bin}-chromedriver-${pkgver}-x86_64.zip::${_ghurl}/releases/download/v${pkgver}/chromedriver-v${pkgver}-linux-x64.zip"
    "${pkgname%-bin}-${pkgver}-x86_64.zip::${_ghurl}/releases/download/v${pkgver}/electron-v${pkgver}-linux-x64.zip"
)
sha256sums=('3fc91f3cbd94eeff7f37420454a13fc30b5f6caaaa4c338bc9d63530c4dcc728')
sha256sums_aarch64=('6e721b56a27727ae58c23e773d0c07a009d61f3b62fab0dbf5e293f032d8af36'
                    '8fdd6410c1cc6650caa007c179dfb7b895e12e63eb50493f4f5a62bc7d71be2b')
sha256sums_x86_64=('5038bd557a7110059eb5ba8b5c431aa069b9f9561b70502d18fb53f93868969a'
                   '0852ee34438a1f9590e1cd9641dcd7e81073f480eb540bb1f192838916e5fcde')
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