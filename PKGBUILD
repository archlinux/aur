pkgname=webcord-bin
pkgver=3.8.3
pkgrel=1
pkgdesc="A Discord and Fosscord client made with the Electron."
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/SpacingBat3/WebCord"
license=('MIT')
_name="${pkgname%-bin}"
provides=("${_name}")
conflicts=("${_name}")
options=('!emptydirs')

_get_source() {
    local archive="webcord-${pkgver}-1.$1.rpm"
    echo "${archive}::${url}/releases/download/v${pkgver}/${archive}"
}

source_x86_64=("$(_get_source x86_64)")
source_aarch64=("$(_get_source arm64)")
source_armv7h=("$(_get_source armv7hl)")

sha256sums_x86_64=('3a4b0f314d4c2e51ab0a4bd8f71faa105aeeedf44738d2b5653f695fc13f6342')
sha256sums_aarch64=('eac7de8f0e85061a469f685ed95e4f840b60ef64036bead9dbb1efc445d07e6f')
sha256sums_armv7h=('2d8552e4d099a2e0cc60bbe3ad49fd311e8f02b95535b587d774db0bcc5e1b23')

noextract=(
    "${source_x86_64[0]%%::*}"
    "${source_aarch64[0]%%::*}"
    "${source_armv7h[0]%%::*}"
)

package() {
    cd "${srcdir}"

    local sname="source_${CARCH}"
    bsdtar -xf "${!sname[0]%%::*}" \
        -C "${pkgdir}" \
        --exclude="usr/lib/.build-id" \
        --exclude="usr/bin"

    local bin="${pkgdir}/usr/bin"
    local licenses="${pkgdir}/usr/share/licenses"
    install -dm755 "${bin}" "${licenses}"

    mv "${pkgdir}/usr/lib" "${pkgdir}/opt"
    mv "${pkgdir}/usr/share/doc/${_name}" "${licenses}/${pkgname}"
    ln -s "/opt/${_name}/${_name}" "${bin}/${_name}"
}
