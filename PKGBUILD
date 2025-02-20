_name=webcord
pkgname=${_name}-bin
pkgver=4.10.4
pkgrel=1
pkgdesc='A Discord and SpaceBar Electron-based client implemented without Discord API (binary release)'
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/SpacingBat3/WebCord"
license=('MIT')
provides=("${_name}")
conflicts=("${_name}")
options=('!strip' '!emptydirs')

depends=(
    'bash'
    'glibc'
)

_get_source() {
    echo -n "${url}/releases/download/v${pkgver}/${_name}-${pkgver}-1.${1}.rpm"
}

source=('flags.sh')
source_x86_64=("$(_get_source x86_64)")
source_aarch64=("$(_get_source arm64)")
source_armv7h=("$(_get_source armv7hl)")

sha256sums=('d83693ffd8034c21030262ac00ce529c8da7b0196ea4b4eb2168861fc2657a2a')
sha256sums_x86_64=('57baeff9e0161274661b38c68ecb2f6970c4b4fcf3def4f87d658ecfcd1dbbb8')
sha256sums_aarch64=('e8682fccee4898c78718a7ce2fbf69b113603f031e509315bd70139a52ff17bd')
sha256sums_armv7h=('d6663464704aaadba998f954a446a6e4912730ee6797282df14376fcb9359e63')

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

    sed -e "s|@NAME@|${_name}|;s|@EXEC@|/opt/${_name}/${_name}|" "${source[0]}" |
        install -Dm755 '/dev/stdin' "${pkgdir}/usr/bin/${_name}"
}
