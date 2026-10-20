# Maintainer: czyt <czytcn@gmail.com>
pkgname=msime-bin
pkgver=0.13.0
pkgrel=1
pkgdesc="MSIME (Metasequoia) Linux input method: IBus host, desktop tools and a Fcitx5 addon"
arch=('x86_64' 'aarch64')
url="https://github.com/metasequoiaime/msime"
license=('GPL-3.0-only')
depends=('alsa-lib' 'cairo' 'dbus' 'fcitx5' 'gcc-libs' 'gdk-pixbuf2' 'glib2' 'gtk3' 'ibus' 'libsoup3' 'libx11' 'libxext' 'libxfixes' 'libxkbcommon' 'libxrandr' 'pango' 'procps-ng' 'python' 'wayland' 'webkit2gtk-4.1')
optdepends=(
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
sha256sums_x86_64=('84b023a69689a4493b70f36c1af3e27cb186bcbacc4ae2d5424f45f83208a5d6')
sha256sums_aarch64=('4240ad172a73771f7ba598cef9aba2e219358cc9867306ffef859686f815a71d')
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
