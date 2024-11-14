# Maintainer: ZeroDegress <zerodegress@outlook.com>
# Contributor: VitalyR <vr@vitalyr.com>
# Contributor: tas <tasgon_@out/look.com>
# Contributor: QuantMint <qua/ntmint@/protonm/ail.com>
# Contributor: Daniel Segesdi <sege/sdi.d/ani@/gma/il.com>
# Contributor: Cristian Porras <porrascristian@gmail.com>
# Contributor: Matthew Bentley <matthew@mtbentley.us>

_pkgname=blazium
pkgname=${_pkgname}-git
pkgver=4.3.r66567.955c142ebe
pkgrel=1
pkgdesc="An advanced, feature packed, multi-platform 2D and 3D game engine."
url="https://blazium.app/"
license=('MIT')
arch=('i686' 'x86_64')

makedepends=(git alsa-lib scons wayland yasm)
depends=(embree3 freetype2 graphite harfbuzz harfbuzz-icu libglvnd libspeechd
    libsquish libtheora libvorbis libwebp libwslay libxcursor libxi
    libxinerama libxrandr mbedtls2 miniupnpc pcre2)
optdepends=('pipewire-alsa: for audio support'
    'pipewire-pulse: for audio support')
conflicts=("blazium")
provides=("blazium")
_arch=''
if test "$CARCH" == x86_64; then
    _arch=('x86_64')
else
    _arch=('32')
fi

source=(
    "${_pkgname}::git+https://github.com/blazium-engine/blazium.git"
    blazium.desktop
    blazium-wayland.desktop
    "icon.png::https://raw.githubusercontent.com/blazium-engine/blazium-assets/refs/heads/main/blazium.svg"
)
sha256sums=(
    'SKIP'
    'e2c395f18fc185463e5c51ed8fb0722a151d1783505c40fecb067ffedad072d3'
    '50631b884c78ae72950a1b83ee7f9adff0b20989819bb45981efa5ad0d42a3cc'
    '272fff1ba4b2bf8dc593ae91ac3d598bc20341f5d84316a8a55e8ba06278d255'
)

pkgver() {
    cd "${srcdir}/${_pkgname}"
    _major=$(cat version.py | grep "major" | sed 's/major = //')
    _minor=$(cat version.py | grep "minor" | sed 's/minor = //')
    _revision=$(printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)")
    echo "${_major}.${_minor}.${_revision}"
}

build() {
    cd "${srcdir}"/${_pkgname}
    # by default built using LTO, use `lto=none` to disable
    scons platform=linuxbsd target=editor production=yes werror=no -j$(($(nproc) + 1))
}

package() {

    cd "${srcdir}"

    install -Dm644 blazium.desktop "${pkgdir}"/usr/share/applications/blazium.desktop
    install -Dm644 blazium-wayland.desktop "${pkgdir}"/usr/share/applications/blazium-wayland.desktop
    install -Dm644 icon.png "${pkgdir}"/usr/share/pixmaps/blazium.png

    cd "${srcdir}"/${_pkgname}

    install -D -m755 bin/blazium.linuxbsd.editor.${_arch} "${pkgdir}"/usr/bin/blazium
    install -D -m644 LICENSE.txt "${pkgdir}"/usr/share/licenses/blazium/LICENSE
}
