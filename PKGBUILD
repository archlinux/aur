_name=webcord
pkgname=${_name}-bin
pkgver=4.4.0
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

sha256sums_x86_64=('db140d575fdcaef0eaa07ea2e8858b6c9a34e5614cbb26f9491da773ed4b2bd5')
sha256sums_aarch64=('50d9b53ec136fd729b9a723467479f212a46a18daf9a2c67b061bd996e88840a')
sha256sums_armv7h=('337c2aeaeadb52b6b452a1131122d311aa668e0a7615214538c69332c35c44b3')

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
