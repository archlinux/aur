# Maintainer: Dan Ziemba <zman0900@gmail.com>
# Contributor: Benjamin Hedrich <kiwisauce (a) pagenotfound (dot) de>

pkgname=tvheadend-atsc-epg-git
_gitname='tvheadend-git'
pkgver=4.1.r475.g92b5af3
pkgrel=3
pkgdesc="TV streaming server for Linux (with PSIP ATSC EPG Grabber)"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="https://tvheadend.org/"
license=('GPL3')
depends=('avahi' 'openssl' 'python2' 'uriparser' 'ffmpeg2.8' 'linuxtv-dvb-apps')
makedepends=('git')
optdepends=('xmltv: For an alternative source of programme listings')
provides=('tvheadend')
conflicts=('tvheadend' 'hts-tvheadend' 'hts-tvheadend-svn' 'tvheadend-git')
install=tvheadend.install

source=("${_gitname}::git+https://github.com/zman0900/tvheadend.git#branch=atsc-epg"
        "dvb-scan-tables::git+https://github.com/tvheadend/dtv-scan-tables.git#branch=tvheadend"
        'tvheadend.service')

md5sums=('SKIP'
         'SKIP'
         'b546f4486f0d28bea13ad1fb676acb27')

pkgver() {
    cd "${srcdir}/${_gitname}"
    git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${srcdir}"
    _dvbscan="${_gitname}/data/dvb-scan"
    cp -a "dvb-scan-tables" "${_dvbscan}"
    rm -rf "${_dvbscan}/.git"
    touch "${_dvbscan}/.stamp"
}

build() {
    cd "${srcdir}/${_gitname}"
    PKG_CONFIG_PATH="/usr/lib/ffmpeg2.8/pkgconfig" \
    ./configure --prefix=/usr --mandir=/usr/share/man/man1 --python=python2 --release \
        --disable-libffmpeg_static --disable-libffmpeg_static_x264 \
        --disable-hdhomerun_static
    make
}

package() {
    cd "${srcdir}/${_gitname}"
    make DESTDIR="$pkgdir/" install
    install -D -m 644 "$srcdir/tvheadend.service" "$pkgdir/usr/lib/systemd/system/tvheadend.service"
}

