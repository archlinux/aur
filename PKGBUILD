_name=webcord
pkgname=${_name}-bin
pkgver=4.5.2
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

sha256sums_x86_64=('58b7e648fbd6b6d2d14d07b2b1d7175c958ce95cff3d638373238621624536bf')
sha256sums_aarch64=('699839c1cef8710dd73e2609feee43ae2f7a17f3baae05b819d6877e48f02228')
sha256sums_armv7h=('a0ef4556a9e2706d686deec00f9aefac51918db04aad2be602027aae525fba93')

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
