# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Co-maintainer: Yurii Kolesnykov <root@yurikoles.com>
# Based on extra/electron* by
# Bruno Pagani <archange@archlinux.org>
# Caleb Maclennan <caleb@alerque.com>
_projectname=electron
_major=32
_pkgname="${_projectname}${_major}"
pkgname="${_pkgname}"-bin
_subver="0.0"
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
sha256sums_aarch64=('c549470d49f068f03f3d7bc60255a427812ba8cc33f21b3c92943f580b3a7daa'
                    '71af014d5f2fa87289e86ffcc25c464ab9228a610d94a19eea7249c2f8a04878')
sha256sums_armv7h=('5f5311604a7978679e82ddf1f61c2594cd32f961c5d35a0fd56e761cecac978a'
                   'ac2a56602ef3ba268148148f2bbfc6dae3fd4343221149edc5b3f543c3960dea')
sha256sums_x86_64=('2c9a206034d0e46276559c96e775f9a038a922092d8d87e5cafe019517a84acc'
                   '1d4e3d6805c42cf69943e33b8691aaa4fbda88d7becd48d5b342ccaef512ff60')
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