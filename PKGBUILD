pkgname=webcord-bin
pkgver=3.10.1
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
sha256sums_x86_64=('48a18572692a3b48b612da3bc0db3571a8d5eadbb00adb4ff9cd96cf4e7cbae8')
sha256sums_aarch64=('b9742ef47deafe0300c9f395c21c7d51b4323f7f587c3d958fd8f827b26a2f71')
sha256sums_armv7h=('446dfa897fdb712f101fa82d4d4c726d8a97f21d71967d394daf977a90c1994e')

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
