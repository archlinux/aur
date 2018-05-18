# Maintainer: Daniel Appelt <daniel.appelt@gmail.com>
# Contributor: SpepS <dreamspepser at yahoo dot it>

_pkgbasename=gmidimonitor
pkgname=${_pkgbasename}-git
pkgver=3.6.r0.ga506126
pkgrel=3
pkgdesc="A GTK+ application that shows MIDI events"
arch=('i686' 'x86_64')
url="http://repo.or.cz/gmidimonitor.git"
license=('GPL')
depends=('gtk2' 'alsa-lib' 'jack')
makedepends=('git' 'python2')
provides=("${_pkgbasename}")
conflicts=("${_pkgbasename}")
install="${_pkgbasename}.install"
source=("${_pkgbasename}::git://repo.or.cz/gmidimonitor.git"
        "${_pkgbasename}.svg::http://upload.wikimedia.org/wikipedia/commons/d/d5/RB_keyboard_icon.svg"
        "${_pkgbasename}-alsa.desktop"
        "${_pkgbasename}-jack.desktop")
sha256sums=('SKIP'
            '16d3e31b4e9ef6e9c7ba3ab79876726f52da21631870cea95076a98913a0bd2c'
            '47aa020a7e99a0ff7cfafcbf537522d2b11e782990f9bd8f8ed5c56993925d06'
            '8500421582b757c781378ffc65e5373f3f6bccd6a9cd846ce8d648b82d143cca')

pkgver() {
    cd "${srcdir}/${_pkgbasename}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${_pkgbasename}"

    python2 waf configure --prefix=/usr --lash=no
    python2 waf
}

package() {
    cd "${srcdir}/${_pkgbasename}"

    python2 waf install --destdir="${pkgdir}"

    # pixmaps and desktop file
    install -d "$pkgdir/usr/share/applications"
    install -Dm644 ../${_pkgbasename}-{alsa,jack}.desktop \
        "$pkgdir/usr/share/applications"

    install -Dm644 ../${_pkgbasename}.svg \
        "$pkgdir/usr/share/pixmaps/${_pkgbasename}.svg"
}
