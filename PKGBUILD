_name=webcord
pkgname=${_name}-bin
pkgver=4.13.0
pkgrel=1
pkgdesc='A Discord client implemented directly without Discord API (binary release)'
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/SpacingBat3/WebCord"
license=('MIT')
provides=("${_name}")
conflicts=("${_name}")
options=('!strip' '!emptydirs')

depends=(
    'alsa-lib'
    'at-spi2-core'
    'bash'
    'cairo'
    'dbus'
    'expat'
    'glib2'
    'glibc'
    'gtk3'
    'libcups'
    'libgcc'
    'libx11'
    'libxcb'
    'libxcomposite'
    'libxdamage'
    'libxext'
    'libxfixes'
    'libxkbcommon'
    'libxrandr'
    'mesa'
    'nspr'
    'nss'
    'pango'
    'systemd-libs'
)

_get_source() {
    echo -n "${url}/releases/download/v${pkgver}/${_name}-${pkgver}-1.${1}.rpm"
}

source=('flags.sh')
source_x86_64=("$(_get_source x86_64)")
source_aarch64=("$(_get_source arm64)")
source_armv7h=("$(_get_source armv7hl)")

sha256sums=('d83693ffd8034c21030262ac00ce529c8da7b0196ea4b4eb2168861fc2657a2a')
sha256sums_x86_64=('59d2a2d7ac1e67cafb22c0b8420b1669f7f3d9babb4f71bed0339581378c4f6d')
sha256sums_aarch64=('36c107609cd49c92629f676f7140a66f99b6a52185a04e67269617d3d80bcd78')
sha256sums_armv7h=('17ed41a30128f52efe0b8e4ccbfcd69b2cda580fcb2f949be1581c6fc9e0215c')

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
