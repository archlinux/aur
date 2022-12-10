pkgname=webcord-bin
pkgver=3.10.2
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
sha256sums_x86_64=('8844d23012594ae289a05eb77f4b5f0ba3adc59217d07b654c3cdbd1203caad6')
sha256sums_aarch64=('08d3618f68129a52d24ff4693a320fb9dddcbf555ccf2090ded94e21f990e6b1')
sha256sums_armv7h=('8d58d09bdc8d16a0a686d552daf883b0881782eff530ba4d20e0eb364495cb94')

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
