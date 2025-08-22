_name=webcord
pkgname=${_name}-bin
pkgver=4.11.1
pkgrel=1
pkgdesc='A Discord client implemented directly without Discord API (binary release)'
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
sha256sums_x86_64=('52b8ec0053993c3b07de8d1b9dd7f0b867bd68359ad3de97076b7ee9c8a25fdb')
sha256sums_aarch64=('44b8da0e87a8f12e56a085033fcf55b3029d4b99586632d838e30047601165af')
sha256sums_armv7h=('59ebf6344cee0d81bc2a5e647da7d073af4963fdef42332053197c706796a0f7')

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
