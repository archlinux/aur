# Maintainer: Yurii Kolesnykov <root@yurikoles.com>
# Co-Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Based on aur/electron8-bin by Tom Vincent <http://tlvince.com/contact>
# Based on extra/electron28 by
# Caleb Maclennan <caleb@alerque.com>
# loqs <bugs-archlinux@entropy-collector.net>
# kxxt <rsworktech@outlook.com>
# https://releases.electronjs.org/
_projectname=electron
_major=28
_pkgname="${_projectname}${_major}"
pkgname="${_pkgname}-bin"
_subver="3.3"
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
    'qt6-base: enable Qt6 with --enable-features=AllowQt'
    'gtk4: for --gtk-version=4 (GTK4 IME might work better on Wayland)'
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
sha256sums_aarch64=('c9d8092bb21198fc90eba452233871d81d1b549c3505e4fbd505eca61ce2c294'
                    'f77107266581a6b9880757876518df1c4bf6eeff5c193bb5de0a8f6c9902bd1f')
sha256sums_armv7h=('5ea3a62da4e0c44de8a498eaca963849daffe8e96128fb9d9d52ca254e6072bc'
                   '384d8b43f52b5350a438031ad12980418fc244b4b0aecfa5f7dcc3d6f103ebed')
sha256sums_x86_64=('5272607001d4294d536e5ebdc6a10555557bd81b905bebe89b128e2c3ec106a5'
                   '20f6be493cbd6c9924206e744b1c490af1f97f4735451b9dc19f0d305366d546')
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