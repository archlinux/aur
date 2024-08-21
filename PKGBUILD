# Maintainer: Yurii Kolesnykov <root@yurikoles.com>
# Co-Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Based on aur/electron8-bin by Tom Vincent <http://tlvince.com/contact>
# Based on extra/electron28 by
# Caleb Maclennan <caleb@alerque.com>
# loqs <bugs-archlinux@entropy-collector.net>
# kxxt <rsworktech@outlook.com>
# https://releases.electronjs.org/
_projectname=electron
_major=25
_pkgname="${_projectname}${_major}"
pkgname="${_pkgname}-bin"
_subver="9.8"
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
sha256sums_aarch64=('d60463f02ee09e3b620ee1c1a4441a05992a1937f98e47ed8b249d392fc9d212'
                    'e1a0e898410569fbc9b1611b55f99d7ca0d50d1e8dad0450e6a0959ad9b3ed93')
sha256sums_armv7h=('4d5a84bd413a40475c6b545cb63c34ec17323fa753887012283d02c32a851f3b'
                   '0a8bff6d84f934c3387d24c467aa3a0bec817d735b7b16677043c47692ef3524')
sha256sums_x86_64=('ceceb5c2ea8569b837952005d71f61036c1827128f387fd467c95a175771f3b7'
                   'c77fec4d32d473f75611c76ef46d947da253821a64e48edf70dafb120b434752')
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