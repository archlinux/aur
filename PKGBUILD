# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Co-maintainer: Yurii Kolesnykov <root@yurikoles.com>
# Based on extra/electron* by
# Bruno Pagani <archange@archlinux.org>
# Caleb Maclennan <caleb@alerque.com>
_projectname=electron
_major=32
_pkgname="${_projectname}${_major}"
pkgname="${_pkgname}"-bin
_subver="0.0-beta.6"
_pkgver="${_major}.${_subver}"
pkgver="${_pkgver/-/.}"
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
source_aarch64=(
    "${_pkgname}-chromedriver-${pkgver}-aarch64.zip::${_ghurl}/releases/download/v${_pkgver}/chromedriver-v${_pkgver}-linux-arm64.zip"
    "${_pkgname}-${pkgver}-aarch64.zip::${_ghurl}/releases/download/v${_pkgver}/electron-v${_pkgver}-linux-arm64.zip"
)
source_armv7h=(
    "${_pkgname}-chromedriver-${pkgver}-armv7h.zip::${_ghurl}/releases/download/v${_pkgver}/chromedriver-v${_pkgver}-linux-armv7l.zip"
    "${_pkgname}-${pkgver}-armv7h.zip::${_ghurl}/releases/download/v${_pkgver}/electron-v${_pkgver}-linux-armv7l.zip"
)
source_x86_64=(
    "${_pkgname}-chromedriver-${pkgver}-x86_64.zip::${_ghurl}/releases/download/v${_pkgver}/chromedriver-v${_pkgver}-linux-x64.zip"
    "${_pkgname}-${pkgver}-x86_64.zip::${_ghurl}/releases/download/v${_pkgver}/electron-v${_pkgver}-linux-x64.zip"
)
sha256sums_aarch64=('f74ab600c9679f945fdee68e19d1bea65428b262b69cc54efb3800fbbb4987f8'
                    '8ae1f3112aae7b9e64fba28d5cfa54534b5884aa702c5e966616023dde2149bc')
sha256sums_armv7h=('67284ee3f4c3e6cfa08c1a6e6912b7941af5a97b9dcaf31c7cde67673c54f30a'
                   '3ad5427ca40a657a93d94cb29347e7ff01c37df1bf7eaed894fc530ac3a89ee4')
sha256sums_x86_64=('1ae0df96085e969d910589844409f6507bbe874e265059f0231a83d65e38c3bd'
                   'e9b88bd593dab0b8df74152f407896e3227adf9c1a8a5e3f9be2a94928c9ba72')
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