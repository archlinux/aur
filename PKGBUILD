# Maintainer: Paczek <paczek654321@gmail.com>
# Contributor: VitalyR <vr@vitalyr.com>

_pkgname="redot"
pkgname=${_pkgname}-git
pkgver=26.2.r77413.7ff80936be
pkgrel=2
pkgdesc="Multi-platform 2D and 3D game engine with a feature-rich editor"
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
conflicts=('redot')
depends=()
optdepends=('pipewire-alsa: for audio support'
    'pipewire-pulse: for audio support')
makedepends=(git scons wayland)
options=('!debug')
source=(
    "${_pkgname}::git+https://github.com/Redot-Engine/redot-engine.git"
)
sha256sums=(
    'SKIP'
)

pkgver() {
    cd "${_pkgname}"
    _major=$(cat version.py | grep "^major" | sed 's/major = //')
    _minor=$(cat version.py | grep "^minor" | sed 's/minor = //')
    _revision=$(printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)")
    echo "${_major}.${_minor}.${_revision}"
}

build() {
    cd "${_pkgname}"
    scons platform=linuxbsd target=editor production=yes
}

package() {
    cd "${_pkgname}"
    install -Dm644 misc/dist/linux/org.redotengine.Redot.desktop -t "${pkgdir}/usr/share/applications/"
    engname=$(cat .scons_env.json | grep vsproj_name | sed 's/\"vsproj_name\"\: \"//g' | sed 's/\"\,//g' | sed 's/ //g')
    install -Dm644 icon.png "${pkgdir}"/usr/share/pixmaps/Redot.png
    install -D -m755 bin/"${engname}".linuxbsd.editor."${_arch}" "${pkgdir}"/usr/bin/redot
    install -D -m644 LICENSE.txt "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}
