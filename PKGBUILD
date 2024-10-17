# Maintainer: Paczek <paczek654321@gmail.com>
# Contributor: VitalyR <vr@vitalyr.com>

_pkgname="redot"
pkgname=${_pkgname}-git
pkgver=4.4.r68037.01acc791d7
pkgrel=2
pkgdesc="A multi-platform 2D and 3D game engine"
arch=('i686' 'x86_64')
_arch=''
if test "$CARCH" == x86_64; then
    _arch=('x86_64')
else
    _arch=('32')
fi
url="https://github.com/Redot-Engine/redot-engine"
license=('MIT')
provides=('redot')
conflicts=('redot-bin')
depends=(embree3 freetype2 graphite harfbuzz harfbuzz-icu libglvnd libspeechd
    libsquish libtheora libvorbis libwebp libwslay libxcursor libxi
    libxinerama libxrandr mbedtls2 miniupnpc pcre2)
optdepends=('pipewire-alsa: for audio support'
    'pipewire-pulse: for audio support')
makedepends=(git alsa-lib scons wayland yasm)
options=('!debug')
source=(
    "${_pkgname}::git+https://github.com/Redot-Engine/redot-engine.git"
    Redot.desktop
)
sha256sums=(
    'SKIP'
    '5a3a48aa6aaa0f29c5c57c0c9ee521330386a073308fa06901f680a111f44479'
)

pkgver() {
    cd "${srcdir}/${_pkgname}"
    _major=$(cat version.py | grep "^major" | sed 's/major = //')
    _minor=$(cat version.py | grep "^minor" | sed 's/minor = //')
    _revision=$(printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)")
    echo "${_major}.${_minor}.${_revision}"
}

build() {
    cd "${srcdir}"/"${_pkgname}"
    scons platform=linuxbsd target=editor production=yes werror=no -j$(($(nproc) + 1))
}

package() {

    cd "${srcdir}"

    install -Dm644 Redot.desktop "${pkgdir}"/usr/share/applications/Redot.desktop

    cd "${srcdir}"/"${_pkgname}"

    engname=$(cat .scons_env.json | grep vsproj_name | sed 's/\"vsproj_name\"\: \"//g' | sed 's/\"\,//g' | sed 's/ //g')

    install -Dm644 icon.png "${pkgdir}"/usr/share/pixmaps/Redot.png
    install -D -m755 bin/"${engname}".linuxbsd.editor."${_arch}" "${pkgdir}"/usr/bin/Redot
    install -D -m644 LICENSE.txt "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}
