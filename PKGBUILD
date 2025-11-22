# Maintainer: ilovemikael <itsmeguys2247 at gmail dot com>
# Contributor: Faaris <faaris dot ansari at proton dot me>

# PKGBUILD 'forked' from electron*-bin [https://aur.archlinux.org/packages/electron37-bin] by
# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Co-maintainer: Yurii Kolesnykov <root@yurikoles.com>

# Which in turn is based on extra/electron* by
# Bruno Pagani <archange@archlinux.org>
# Caleb Maclennan <caleb@alerque.com>
_pkgname=electron41
pkgname=electron-nightly-bin
_pkgver=41.0.0-nightly.20251121
pkgver="${_pkgver/-}"
pkgrel=1
pkgdesc="Build cross platform desktop apps with web technologies — prebuilt nightly binary"
arch=(
    'aarch64'
    'armv7h'
    'x86_64'
)
url='https://electronjs.org'
_ghurl="https://github.com/electron/nightlies"
license=('MIT')
provides=(
    'electron'
    "electron=${pkgver}"
)
conflicts=(
    'electron'
    "${_pkgname}"
)
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
noextract=("electron-${_pkgver}-${CARCH}.zip")
#source_aarch64=("electron-${_pkgver}-aarch64.zip::${_ghurl}/releases/download/v${_pkgver//_/-}/electron-v${_pkgver//_/-}-linux-arm64.zip")
#source_armv7h=("electron-${_pkgver}-armv7h.zip::${_ghurl}/releases/download/v${_pkgver//_/-}/electron-v${_pkgver//_/-}-linux-armv7l.zip")
source_x86_64=("electron-${_pkgver}-x86_64.zip::${_ghurl}/releases/download/v${_pkgver//_/-}/electron-v${_pkgver//_/-}-linux-x64.zip"
'electron')
sha256sums_x86_64=('2f7e76a5440473a143216cc6e804f029f19c449eea68c061ce6135e3ac887fa7'
                   '52d37554d0e729262652afd52c8430eda02ca7a89a6f6ad5610d5fe71144aa6a')
prepare() {
    install -Dm755 -d "${srcdir}/${_pkgname}"
    bsdtar -xf "${srcdir}/electron-${_pkgver}-${CARCH}.zip" -C "${srcdir}/${_pkgname}"
    chmod u+s "${srcdir}/${_pkgname}/chrome-sandbox"
}
package() {
    install -Dm755 electron "${pkgdir}/usr/bin/electron"
    install -Dm755 -d "${pkgdir}/usr/"{bin,lib}
    cp -r --no-preserve=ownership --preserve=mode "${srcdir}/${_pkgname}" "${pkgdir}/usr/lib"
    ln -nfs "/usr/lib/${_pkgname}/electron" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "${srcdir}/${_pkgname}/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
    rm -rf "${pkgdir}/usr/bin/${_pkgname}/LICENSE"*
}
