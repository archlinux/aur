# Maintainer: ValHue <vhuelamo at gmail dot com>
#
# Contributor: Jaroslav Lichtblau <svetlemodry at archlinux dot org>
# Contributor: Daenyth
# Contributor: Allan McRae <allan at archlinux dot org>
# Contributor: Vrob (Markus Heuser) <mheuser at mi dot fu-berlin dot de>
#
pkgname="ogmrip"
pkgver="1.0.1"
pkgrel="7"
pkgdesc="Libraries and GTK2 interface for DVD ripping using mencoder"
arch=('x86_64')
url="http://ogmrip.sourceforge.net/"
license=('GPL')
depends=('libdvdread>=4.1.3' 'mplayer' 'mencoder' 'enca' 'pkg-config' 'gconf' 'libglade' 'libnotify' 'enchant')
makedepends=('patch' 'intltool' 'perl-xml-parser' 'faac' 'lame' 'libtheora'
             'ogmtools' 'gpac' 'vorbis-tools' 'tesseract' 'python'
)
optdepends=('faac: support for the AAC audio codec'
            'lame: support for the MP3 audio codec'
            'libtheora: decode and encode Ogg Theora files'
            'ogmtools: support for the Ogg Media container'
            'gpac: support for the MP4 container'
            'vorbis-tools: support for the Ogg Vorbis audio codec'
            'gocr: support for the SRT subtitle format'
            'ocrad: support for the SRT subtitle format'
            'tesseract: support for the SRT subtitle format'
)
options=('!makeflags')
changelog=$pkgname.changelog
source=("https://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz"
         enchant-2.patch
)
sha256sums=('4e2e9778ac4da9fe1ab159e3dc6d4367b7a9dbd8f3501df99733ecedb25b02ff'
            '61fa359d44af8135ca80fbef2c98d6c30dcaf82e8817aeaf477d9203835f0ba8')

prepare() {
    cd $pkgname-$pkgver
    patch -Np1 -i ../enchant-2.patch

# enchant-2 naming change
    sed -i 's/enchant >=/enchant-2 >=/' configure
}

build() {
    cd "${srcdir}"/${pkgname}-${pkgver}
    ./configure --prefix=/usr --sysconfdir=/usr/share
    sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
    make
}

package() {
    cd "${srcdir}"/${pkgname}-${pkgver}

    make DESTDIR="${pkgdir}" install
}

# vim:set ts=4 sw=4 et syn=sh ft=sh:
