# Maintainer: fenuks
# Based on ultrastardx-git PKGBUILD

_usdx_package=WorldParty
_pkgname=ultrastardxwp
_ffmpeg="ffmpeg"
pkgname=${_pkgname}-git
pkgver=r367.532b1ca
pkgrel=1
pkgdesc="UltraStar Deluxe WorldParty is a free and open source karaoke game. It allows up to six players to sing along with music using microphones in order to score points, depending on the pitch of the voice and the rhythm of singing."
arch=("i686" "x86_64")
url="http://ultrastar-es.org"
license=("GPL")
depends=(${_ffmpeg} "lua" "pcre" "portaudio" "sdl2" "sdl2_gfx" "sdl2_mixer" "sdl2_ttf" "sdl2_image" "sdl2_net" "sqlite" "ttf-dejavu" "gnu-free-fonts")
makedepends=("git" "fpc")  
optdepends=()
conflicts=("${pkgname}")
options=("!buildflags")
install=${pkgname}.install
source=("${_pkgname}.desktop"
        "${_pkgname}::git+https://github.com/ultrastares/usdxworldparty")
md5sums=('45e724d9c3ab756ed908774daedfac24'
         'SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${srcdir}/${_pkgname}"
    chmod +x autogen.sh
    ./autogen.sh
}

build() {
    cd "${srcdir}/${_pkgname}"
    chmod +x configure
    PKG_CONFIG_PATH="/usr/lib/${_ffmpeg}/pkgconfig" ./configure --prefix=/usr
    make
}

package() {
    cd "${srcdir}/${_pkgname}"
    make install DESTDIR="${pkgdir}"
    install -Dm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${pkgdir}/usr/share/${_usdx_package}/resources/icons/${_usdx_package}.png" "${pkgdir}/usr/share/icons/${_usdx_package}.png"
}
