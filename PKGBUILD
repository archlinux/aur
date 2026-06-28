_name=webcord
pkgname=${_name}-bin
pkgver=4.13.2
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
sha256sums_x86_64=('2bc0a40a22462ca43f43ddbca44632a515aeaf70794fb3106d39b724f02b60e5')
sha256sums_aarch64=('4c650fe46f3295fedc4a5ef397e60136a9a5cb44b24bb080a580efc1c9ec7949')
sha256sums_armv7h=('e2545a6a469ab9baa058f1bc6f58e23b337a07c9359c0969cda80f04eabab173')

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
