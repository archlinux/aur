_name=webcord
pkgname=${_name}-bin
pkgver=4.10.1
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
sha256sums_x86_64=('a9c4aabdf26e986469405feaa14b7f8ada3188d7bff6872b4ff484a00e1c6115')
sha256sums_aarch64=('ba86e8aab3cbcb03eefd4e631614c702fc50f3eb19cfd28784949a8a8af82134')
sha256sums_armv7h=('11f5a684810b1fb7c1ba4e967ce4b715f504d81d0e40d3664ff6a01cbee2694a')

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
