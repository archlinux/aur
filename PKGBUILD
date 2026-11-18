# Maintainer: czyt <czytcn@gmail.com>
pkgname=msime-bin
pkgver=0.17.0
pkgrel=1
pkgdesc="MSIME (Metasequoia) Linux input method: IBus host, desktop tools and a Fcitx5 addon"
arch=('x86_64' 'aarch64')
url="https://github.com/metasequoiaime/msime"
license=('GPL-3.0-only')
# Both input method frameworks are optional, and deliberately not installed
# together: the Fcitx5 addon is only ever loaded by Fcitx5, and the IBus host
# (which links libibus, a library that comes with the ibus package) is only ever
# started by ibus-daemon. Installing this package with Fcitx5 therefore pulls in
# no part of IBus.
depends=('alsa-lib' 'cairo' 'dbus' 'gcc-libs' 'gdk-pixbuf2' 'glib2' 'gtk3' 'gtk4' 'libsoup3' 'libx11' 'libxext' 'libxfixes' 'libxkbcommon' 'libxrandr' 'pango' 'procps-ng' 'python' 'wayland' 'webkit2gtk-4.1')
optdepends=(
    'fcitx5: type with MSIME inside Fcitx5'
    'ibus: type with MSIME inside IBus (also brings the libibus the IBus host links)'
    'python-websockets: cloud candidates and online providers'
    'pipewire: audio capture for the local voice provider (alternatively pulseaudio-utils or alsa-utils)'
    'quickshell: bar status widget for Omarchy/Quickshell sessions'
)
provides=('msime-linux')
conflicts=('msime-linux')
options=('!strip' '!debug')

_upstream_deb="msime-linux_${pkgver}"

source_x86_64=("${_upstream_deb}_amd64.deb::https://github.com/metasequoiaime/msime/releases/download/linux-v${pkgver}/${_upstream_deb}_amd64.deb")
source_aarch64=("${_upstream_deb}_arm64.deb::https://github.com/metasequoiaime/msime/releases/download/linux-v${pkgver}/${_upstream_deb}_arm64.deb")
sha256sums_x86_64=('144a90598fa900ab27ce8c28e20c439b6f4cfb613434ff27b845b3bcf81e5a02')
sha256sums_aarch64=('0486ffc35428dc408c2482d3626fd77cc9fcfd90f51e9a3e0ad83fe84d135b52')
noextract=(
    "${_upstream_deb}_amd64.deb"
    "${_upstream_deb}_arm64.deb"
)

package() {
    local _suffix
    case "$CARCH" in
        x86_64)  _suffix=amd64 ;;
        aarch64) _suffix=arm64 ;;
    esac

    # The package keeps the upstream layout, including /usr/lib/x86_64-linux-gnu:
    # the binaries find their bundled libraries through $ORIGIN-relative RUNPATHs
    # and the Fcitx5 addon through an absolute Library= path.
    bsdtar -xOf "${srcdir}/${_upstream_deb}_${_suffix}.deb" 'data.tar.*' |
        bsdtar --no-same-owner -xf - -C "${pkgdir}"
}
