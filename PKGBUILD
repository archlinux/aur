_name=webcord
pkgname=${_name}-bin
pkgver=4.2.0
pkgrel=1
pkgdesc="A Discord and Fosscord client made with the Electron API."
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

sha256sums_x86_64=('121135f288d6ee654a41ab350622f91844e03af5fc55c31e544fd712b1c47d7b')
sha256sums_aarch64=('95ae14f55cee899b96ef10e14dcd6af8d6e9df4f8ed74dc2929d460b2ff8caed')
sha256sums_armv7h=('d6a7300bd346aac11a95bcd28cf488dd198f837fe55da05a44d7df5f0a0e153a')

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
