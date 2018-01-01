# Maintainer: ValHue <vhuelamo at gmail dot com>
#
# Contributor: FzerorubigD <Fzerorubigd {AT} GMail {DOT} com>
#
_pkgname="lastfm-desktop"
pkgname="lastfm"
pkgver="2.1.36"
pkgrel="2"
pkgdesc="The official Last.fm desktop application suite"
url="http://www.last.fm/"
arch=('any')
license=('GPL3')
conflicts=('lastfm-git' 'lastfm-mpd-cli' 'lastfm-msk' 'lastfm-msk-light')
provides=("${pkgname}")
depends=('qt4>4.8' 'ruby' 'liblastfm' 'pkg-config' 'fftw' 'taglib'\
         'libsamplerate' 'libmad' 'libgpod' 'sqlite' 'phonon-qt4'\
         'phonon-qt4-vlc' 'ffmpeg' 'qtwebkit'
)
source=("Last.fm-$pkgver.tar.zip::https://github.com/lastfm/${_pkgname}/archive/$pkgver.zip"
        'lastfm-scrobbler'
        'LAV_Source_fix.patch'
        'lastfm-scrobbler.desktop'
        'cast-bug.patch'
)
sha256sums=('871d9d8e0c2942fe1fdce4df445fe55ebd92573fcc4420a669254344eef2c642'
            '882523081fadfd5c52315229414324aab61affeb9d4213543b6ac051c84b4476'
            'de2d91e1534348d8d6f4260b23fd9447a443c79ebe65a8e02a9a40e008ea4c85'
            'ecaeea027ad77da731f77268afd94da74e1ede4bc3f90765de58b7e407c82210'
            '3b0c66c639b0506692f02ba71c135981f1c5374820200f143485aa473aa6aa67'
)


build() {
    cd "${srcdir}/${_pkgname}-${pkgver}/app"
    patch -Np1 -i ../../LAV_Source_fix.patch
    cd "${srcdir}/${_pkgname}-${pkgver}"
    patch -Np1 -i ../cast-bug.patch
    qmake-qt4 -r
    make
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    mkdir -p ${pkgdir}/usr/bin
    mkdir -p ${pkgdir}/opt/last.fm/css
    mkdir -p ${pkgdir}/usr/share/{applications,pixmaps}
    cp -R _bin ${pkgdir}/opt/last.fm/bin
    cp ./app/client/Last.fm\ Scrobbler.css ${pkgdir}/opt/last.fm/css/
    install -m755 ${srcdir}/lastfm-scrobbler ${pkgdir}/usr/bin/
    install -D -m644 ${srcdir}/lastfm-scrobbler.desktop ${pkgdir}/usr/share/applications/
    install -D -m644 ${srcdir}/${_pkgname}-${pkgver}/app/client/audioscrobbler.ico ${pkgdir}/usr/share/pixmaps/
}

# vim:set ts=4 sw=2 ft=sh et syn=sh ft=sh:
