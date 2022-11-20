pkgname=webcord-bin
pkgver=3.10.0
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
sha256sums_x86_64=('6fae0a644974cd52390ec34d5b919f742d59fafe0d95d801585a74f92178acf8')
sha256sums_aarch64=('8141594e3c45180fcf9c1c8abd5b981a833004a9bd3b2303a33c934e4dd6e7c9')
sha256sums_armv7h=('fddaf861e63abc42e6ad0420fa00cc330fd67eaf1c236347cd7272f53c11a3be')

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
