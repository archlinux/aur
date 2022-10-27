pkgname=webcord-bin
pkgver=3.9.0
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

sha256sums_x86_64=('a6a401eb35d2a15976b9dea2b3e9604c208bac42995344dccd38b86143dcde9f')
sha256sums_aarch64=('81ae729e323c5ce036a595e9a5f8cb55687d7b3427fbbaaaee0ec73bc91196e7')
sha256sums_armv7h=('f975778f3b2e75b7ed4f8a293d0de05694b161600f644757ed1ab1672a17aee8')

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
    mv -t "${licenses}" "${pkgdir}/opt/${_name}/LICENSE"*
    ln -s "/opt/${_name}/${_name}" "${bin}/${_name}"
}
