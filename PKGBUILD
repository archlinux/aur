_name=webcord
pkgname=${_name}-bin
pkgver=4.7.0
pkgrel=1
pkgdesc='A Discord and SpaceBar Electron-based client implemented without Discord API (binary release)'
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/SpacingBat3/WebCord"
license=('MIT')
provides=("${_name}")
conflicts=("${_name}")
options=('!strip' '!emptydirs')

_get_source() {
    echo "${url}/releases/download/v${pkgver}/${_name}-${pkgver}-1.${1}.rpm"
}

source_x86_64=("$(_get_source x86_64)")
source_aarch64=("$(_get_source arm64)")
source_armv7h=("$(_get_source armv7hl)")

sha256sums_x86_64=('f430f903aae896e6519932925ef12f2fde3388cd5f009b121408b750489e77c7')
sha256sums_aarch64=('f0868e7ced0bf45a5da4832daf623a962bd47f3556a518b7327c5d09653204d5')
sha256sums_armv7h=('047498ef026e14f921ba37add102815494f3546b50e5fc4156a9783466835a63')

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

    local bin="${pkgdir}/usr/bin"
    install -dm755 "${bin}"
    mv "${pkgdir}/usr/lib" "${pkgdir}/opt"
    ln -s "/opt/${_name}/${_name}" "${bin}/${_name}"
}
