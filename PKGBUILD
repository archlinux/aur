# Maintainer: fenuks
# Based on ultrastardx-git PKGBUILD

_pkgname=ultrastardxwp
pkgname=${_pkgname}-git
pkgver=r20.915f975
pkgrel=1
pkgdesc="UltraStar Deluxe WorldParty is a free and open source karaoke game. It allows up to six players to sing along with music using microphones in order to score points, depending on the pitch of the voice and the rhythm of singing."
arch=("i686" "x86_64")
url="http://ultrastar-es.org"
license=("GPL")
depends=("ffmpeg2.8" "lua" "pcre" "portaudio" "sdl2" "sdl2_mixer" "sdl2_ttf" "sdl2_image" "sqlite" "ttf-dejavu" "ttf-freefont")
makedepends=("git" "fpc")  
optdepends=()
conflicts=("${pkgname}")
options=("!buildflags")
# install=$pkgname.install
source=("${_pkgname}.patch"
        "${_pkgname}.desktop"
        "${_pkgname}::git+https://github.com/ultrastares/usdxworldparty/")
md5sums=('d9689465f6729ae9bb310f704206be7b'
         '47b4f962b66c6f96929b66a27a073b2e'
         'SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${srcdir}/${_pkgname}"
    patch -p1 -i "${srcdir}/${_pkgname}.patch"
    chmod +x autogen.sh
    ./autogen.sh
}

build() {
    cd "${srcdir}/${_pkgname}"
    chmod +x configure
    PKG_CONFIG_PATH="/usr/lib/ffmpeg2.8/pkgconfig" ./configure --prefix=/usr
    make EXEEXT="wp" USDX_PACKAGE_NAME="ultrastardxwp"
}

package() {
    cd "${srcdir}/${_pkgname}"
    touch COPYING.txt
    make install DESTDIR="$pkgdir" EXEEXT="wp" USDX_PACKAGE_NAME="ultrastardxwp"
    install -Dm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${pkgdir}/usr/share/${_pkgname}/resources/icons/ultrastardx-icon.png" "${pkgdir}/usr/share/icons/${_pkgname}.png"
}
