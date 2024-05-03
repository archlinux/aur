_name=webcord
pkgname=${_name}-bin
pkgver=4.9.1
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

sha256sums_x86_64=('09e535d796618c8b4dd8cba9039488d65f6d7bdeff636fccacffcab41791d9e8')
sha256sums_aarch64=('985bf618a704ac4dd2add28c3f886e68f0778becbb2a92e4f9e04c684adcef6c')
sha256sums_armv7h=('45cb7523a6caf1154fd2a71849d2b0d99dbb00c5568917f4b85944967db3bbe3')

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
