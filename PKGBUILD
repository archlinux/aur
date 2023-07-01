_name=webcord
pkgname=${_name}-bin
pkgver=4.3.0
pkgrel=1
pkgdesc='A Discord and SpaceBar Electron-based client implemented without Discord API'
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/SpacingBat3/WebCord"
license=('MIT')
provides=("${_name}")
conflicts=("${_name}")
options=('!emptydirs')

_get_source() {
    echo "${url}/releases/download/v${pkgver}/webcord-${pkgver}-1.$1.rpm"
}

source_x86_64=("$(_get_source x86_64)")
source_aarch64=("$(_get_source arm64)")
source_armv7h=("$(_get_source armv7hl)")

sha256sums_x86_64=('aa662e13c163bb98fd66b6458933ef1775fa04bee7b3628c0d7e7d1943f2e2af')
sha256sums_aarch64=('e2e14320d514ce9d14c3742eed043ce9636e9e756f10be4851047c6e9999e8de')
sha256sums_armv7h=('f99bad5d3239d7ead5d7f6008291d08644dd42f09b479f90594012947bf533c2')

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
