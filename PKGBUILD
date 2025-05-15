# Maintainer: ilovemikael <itsmeguys2247@gmail.com>
# Maintainer: Faaris <faaris dot ansari at proton dot me>

# PKGBUILD 'forked' from electron37-bin [https://aur.archlinux.org/packages/electron37-bin] by
# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Co-maintainer: Yurii Kolesnykov <root@yurikoles.com>

# Which in turn is based on extra/electron* by
# Bruno Pagani <archange@archlinux.org>
# Caleb Maclennan <caleb@alerque.com>
_projectname=electron
_major=38
_pkgname="${_projectname}${_major}"
pkgname="electron-nightly-bin"
_subver='0.0-nightly.20250514'
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
_ghurl="https://github.com/electron/nightlies"
license=(
    'MIT'
    'LicenseRef-custom'
)
provides=(electron
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
noextract=("electron-${pkgver}-${CARCH}.zip")
source_aarch64=("electron-${pkgver}-aarch64.zip::${_ghurl}/releases/download/v${_pkgver//_/-}/electron-v${_pkgver//_/-}-linux-arm64.zip")
source_armv7h=("electron-${pkgver}-armv7h.zip::${_ghurl}/releases/download/v${_pkgver//_/-}/electron-v${_pkgver//_/-}-linux-armv7l.zip")
source_x86_64=("electron-${pkgver}-x86_64.zip::${_ghurl}/releases/download/v${_pkgver//_/-}/electron-v${_pkgver//_/-}-linux-x64.zip"
'electron')
sha256sums_aarch64=('a169c8d2ceb0201bc42bcd59a9f3903dd49c3dc850a46cd2d0aeb14fea352904')
sha256sums_armv7h=('2c4d8b6418d6e265a90eb6a16bea334e107dec1790f545628c700c6741de17bd')
sha256sums_x86_64=('1f1de7f0daed689b05e09eea4a059cd5446e8acc2e2dfaea3218c9f150852937'
                   'f074713d0322b652b78ed2491dce2676d05d10a284187c5deba4a047b8283e4c')
prepare() {
    install -Dm755 -d "${srcdir}/${_pkgname}"
    bsdtar -xf "${srcdir}/electron-${pkgver}-${CARCH}.zip" -C "${srcdir}/${_pkgname}"
    chmod u+s "${srcdir}/${_pkgname}/chrome-sandbox"
}
package() {
    install -Dm755 electron "${pkgdir}/usr/bin/electron"
    install -Dm755 -d "${pkgdir}/usr/"{bin,lib}
    cp -r --no-preserve=ownership --preserve=mode "${srcdir}/${_pkgname}" "${pkgdir}/usr/lib"
    ln -nfs "/usr/lib/${_pkgname}/${_projectname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "${srcdir}/${_pkgname}/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
    rm -rf "${pkgdir}/usr/bin/${_pkgname}/LICENSE"*
}
