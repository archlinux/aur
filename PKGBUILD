_name=webcord
pkgname=${_name}-bin
pkgver=4.9.2
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

sha256sums_x86_64=('5effeb3753f32583e859f1de1aa474953ae5ffb86abd3378e1041621f8c7fd56')
sha256sums_aarch64=('b0c16aef7253098059b9acaff6b968157eb2e6d6b9c5b9e2b1351df6e6c816ed')
sha256sums_armv7h=('3336099c99f779cabbc7a4403e5c3d440af5eb43be67be9e56c5e86c6776e3ff')

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
