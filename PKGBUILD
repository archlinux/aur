pkgname=webcord-bin
pkgver=3.9.3
pkgrel=1
pkgdesc="A Discord and Fosscord client made with the Electron API."
arch=('x86_64' 'aarch64' 'armv7h')
_repo='SpacingBat3/WebCord'
url="https://github.com/${_repo}"
license=('MIT')
_name="${pkgname%-*}"
provides=("${_name}")
conflicts=("${_name}")
options=('!emptydirs')

_get_source() {
    local archive="webcord-${pkgver}-1.$1.rpm"
    echo "${archive}::${url}/releases/download/v${pkgver}/${archive}"
}

source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/${_repo}/v${pkgver}/LICENSE")
source_x86_64=("$(_get_source x86_64)")
source_aarch64=("$(_get_source arm64)")
source_armv7h=("$(_get_source armv7hl)")

sha256sums=('1611f35d608dd3b100f66d4e6954bceef80ff73209679ba38def974254a04f40')
sha256sums_x86_64=('ded46be3816009c0a2db9c141fdd49067e4cde40f9981b20dda2c46f877f86a5')
sha256sums_aarch64=('dbb4f33ca9ef64321bf5933c608392b4cee43ad28a9c64f1d95dcb3367c19a56')
sha256sums_armv7h=('35e782921158cdf0fe9c8e6cc1af931572799579fe47867a5b793613b7125378')

noextract=(
    "${source_x86_64[0]%%::*}"
    "${source_aarch64[0]%%::*}"
    "${source_armv7h[0]%%::*}"
)

package() {
    local sname="source_${CARCH}"
    bsdtar -xf "${!sname[0]%%::*}" \
        -C "${pkgdir}" \
        --exclude="usr/lib/.build-id" \
        --exclude="usr/bin" \
        --exclude="usr/share/doc"

    local bin="${pkgdir}/usr/bin"
    local licenses="${pkgdir}/usr/share/licenses/${pkgname}"
    install -dm755 "${bin}" "${licenses}"

    mv "${pkgdir}/usr/lib" "${pkgdir}/opt"
    ln -s "/opt/${_name}/${_name}" "${bin}/${_name}"
    install -Dm644 "${source[0]%%::*}" "${licenses}/LICENSE"
}
