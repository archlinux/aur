pkgname=webcord-bin
pkgver=3.8.6
pkgrel=1
pkgdesc="A Discord and Fosscord client made with the Electron API."
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

sha256sums_x86_64=('e54c1bcd85146a2431a5ed336c2ff06709590da17c13532558268f23d90e2a54')
sha256sums_aarch64=('c7fc9c756dc8a6c010776d7321c15deb50e34b862dd65b61a3ff637e8b30248a')
sha256sums_armv7h=('8c4b03ca4eb3f43e157e2f2cd78d88c63a81b08bc558c90eaab0901a98852cb3')

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
