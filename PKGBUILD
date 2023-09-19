_name=webcord
pkgname=${_name}-bin
pkgver=4.4.1
pkgrel=1
pkgdesc='A Discord and SpaceBar Electron-based client implemented without Discord API (binary release)'
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/SpacingBat3/WebCord"
license=('MIT')
provides=("${_name}")
conflicts=("${_name}")
options=('!strip' '!emptydirs')

_get_source() {
    echo "${url}/releases/download/v${pkgver}/webcord-${pkgver}-1.$1.rpm"
}

source_x86_64=("$(_get_source x86_64)")
source_aarch64=("$(_get_source arm64)")
source_armv7h=("$(_get_source armv7hl)")

sha256sums_x86_64=('be9464389df9f7e14119b4b858fc5009c1c78f6cd1cb0e19c171dcb23b40cf4d')
sha256sums_aarch64=('a2c02a0cc10a130ae77f52055121eee23e8b7d1532359b9c7e2f6dc8c1b34ff7')
sha256sums_armv7h=('bb43c59408fa5719e7d14f5e7482c52dae99921e5637de4a9c3923eb94943534')

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
