# Maintainer: Yurii Kolesnykov <root@yurikoles.com>
# Co-Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Based on aur/electron8-bin by Tom Vincent <http://tlvince.com/contact>
# Based on extra/electron28 by
# Caleb Maclennan <caleb@alerque.com>
# loqs <bugs-archlinux@entropy-collector.net>
# kxxt <rsworktech@outlook.com>
# https://releases.electronjs.org/
_projectname=electron
_major=27
_pkgname="${_projectname}${_major}"
pkgname="${_pkgname}-bin"
_subver="3.11"
_pkgver="${_major}.${_subver}"
pkgver="${_pkgver/-/.}"
pkgrel=3
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
    'qt5-base: enable Qt5 with --enable-features=AllowQt'
    'trash-cli: file deletion support (trash-put)'
    'xdg-utils: open URLs with desktop`s default'
)
source_aarch64=(
    "${pkgname%-bin}-chromedriver-${pkgver}-aarch64.zip::${_ghurl}/releases/download/v${_pkgver}/chromedriver-v${_pkgver}-linux-arm64.zip"
    "${pkgname%-bin}-${pkgver}-aarch64.zip::${_ghurl}/releases/download/v${_pkgver}/electron-v${_pkgver}-linux-arm64.zip"
)
source_armv7h=(
    "${pkgname%-bin}-chromedriver-${pkgver}-armv7h.zip::${_ghurl}/releases/download/v${_pkgver}/chromedriver-v${_pkgver}-linux-armv7l.zip"
    "${pkgname%-bin}-${pkgver}-armv7h.zip::${_ghurl}/releases/download/v${_pkgver}/electron-v${_pkgver}-linux-armv7l.zip"
)
source_x86_64=(
    "${pkgname%-bin}-chromedriver-${pkgver}-x86_64.zip::${_ghurl}/releases/download/v${_pkgver}/chromedriver-v${_pkgver}-linux-x64.zip"
    "${pkgname%-bin}-${pkgver}-x86_64.zip::${_ghurl}/releases/download/v${_pkgver}/electron-v${_pkgver}-linux-x64.zip"
)
sha256sums_aarch64=('ebfaee21a1f0040408b27e060666f414844a1a9bd4d6eab75fd1a4448933fc48'
                    'ddbfcd5e04450178ca4e3113f776893454822af6757761adc792692f7978e0df')
sha256sums_armv7h=('cda967fd294aeb2a1a5fc97288f1033c0578f69c2e70575801d697f96a8389d4'
                   '012127a3edf79e0e4623a08e853286e1cba512438a0414b1ab19b75d929c1cf2')
sha256sums_x86_64=('690fa0b38e029d09f0ef22b0bc3be6c1f0f938c5617449b6005199e4b379ff74'
                   'e3a6f55e54e7a623bba1a15016541248408eef5a19ab82a59d19c807aab14563')
package() {
    install -dm755 "${pkgdir}/usr/lib/${_pkgname}/"
    find . -mindepth 1 -maxdepth 1 -type f ! -name "*.zip" ! -name "LICENSE*" -exec cp -r --no-preserve=ownership --preserve=mode -t "${pkgdir}/usr/lib/${_pkgname}/." {} +
    for _folder in 'locales' 'resources'; do
        cp -r --no-preserve=ownership --preserve=mode "${_folder}/" "${pkgdir}/usr/lib/${_pkgname}/${_folder}/"
    done
    chmod u+s "${pkgdir}/usr/lib/${_pkgname}/chrome-sandbox"
    install -dm755 "${pkgdir}/usr/bin"
    ln -nfs "/usr/lib/${_pkgname}/${_projectname}" "${pkgdir}/usr/bin/${_pkgname}"
   
    for _license in 'LICENSE' 'LICENSES.chromium.html'; do
        install -Dm644 "${_license}" "${pkgdir}/usr/share/licenses/${pkgname}/${_license}"
    done
}