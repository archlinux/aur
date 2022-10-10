pkgname=webcord-bin
pkgver=3.8.8
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

sha256sums_x86_64=('ccc53962297d11eb26f404d9c14ef1f4285dafd844db4eecd6ae56d02a20186c')
sha256sums_aarch64=('6456fd36276e811fe33fd440d5c542fd814ef9cbd964b8bee5998aeb65af2a9b')
sha256sums_armv7h=('99fc985176bf69a69319c9e8938ba9d4d9d4ce33717c2bacc3117ea920bf46c4')

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
