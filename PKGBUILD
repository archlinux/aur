_name=webcord
pkgname=${_name}-bin
pkgver=4.4.3
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

sha256sums_x86_64=('11fb5799880bde13acf7eadd9729062c6cc12d3d29733e7ee4f97e880a3156ee')
sha256sums_aarch64=('b4fdef36f08caba4f9a36b5d2f04b6475b323eb305c67b32e7857871b4659dae')
sha256sums_armv7h=('d4572477d6bbe8b614d60c4f5734b7251ffbd46b631a5495850ede4b07336778')

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
