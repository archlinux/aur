_name=webcord
pkgname=${_name}-bin
pkgver=4.9.0
pkgrel=1
pkgdesc='A Discord and SpaceBar Electron-based client implemented without Discord API (binary release)'
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/SpacingBat3/WebCord"
license=('MIT')
provides=("${_name}")
conflicts=("${_name}")
options=('!strip' '!emptydirs')

_get_source() {
    echo -n "${url}/releases/download/v${pkgver}/${_name}-${pkgver}-1.${1}.rpm"
}

source_x86_64=("$(_get_source x86_64)")
source_aarch64=("$(_get_source arm64)")
source_armv7h=("$(_get_source armv7hl)")

sha256sums_x86_64=('4c08da042d55f73345ca8932c6527931487e1c04a9ea8e8968425d1078fdec3f')
sha256sums_aarch64=('f7ee48d2d6ff2a3b0bde94cbbf2d7e9a62e81e0c396e1d69e433e6dd47e6e617')
sha256sums_armv7h=('dcdd4047c13227d670851d7796f06d0b48783c7746dcc187445aa0525714a8e4')

noextract=(
    "${source_x86_64[0]##*/}"
    "${source_aarch64[0]##*/}"
    "${source_armv7h[0]##*/}"
)

package() {
    local sname="source_${CARCH}"
    bsdtar -xf "${!sname[0]##*/}" \
        -C "${pkgdir}" \
        --exclude="usr/lib/.build-id" \
        --exclude="usr/bin" \
        --exclude="usr/share/doc"

    mv "${pkgdir}/usr/lib" "${pkgdir}/opt"

    local bin="${pkgdir}/usr/bin"
    install -dm755 "${bin}"
    ln -s "/opt/${_name}/${_name}" -t "${bin}"
}
