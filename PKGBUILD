# Maintainer: Dan Ziemba <zman0900@gmail.com>
# Contributor: Benjamin Hedrich <kiwisauce (a) pagenotfound (dot) de>

# To enable hdhomerun, add 'libhdhomerun' to depends and '--enable-hdhomerun_client' to
# the configure command in build().

pkgname=tvheadend-git
_gitname='tvheadend-git'
pkgver=4.1.r1817.gfc6b8ce
pkgrel=1
pkgdesc="TV streaming server for Linux"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="https://tvheadend.org/"
license=('GPL3')
depends=('avahi' 'openssl' 'uriparser' 'ffmpeg' 'linuxtv-dvb-apps')
makedepends=('git' 'python2')
optdepends=('xmltv: For an alternative source of programme listings')
provides=('tvheadend')
conflicts=('tvheadend' 'hts-tvheadend' 'hts-tvheadend-svn' 'tvheadend-git')
install=tvheadend.install

source=("${_gitname}::git+https://github.com/tvheadend/tvheadend.git#branch=master"
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

    # See: https://tvheadend.org/issues/3696
    sed -i 's|/usr/bin/env python|/usr/bin/env python2|g' \
        "${_gitname}/support/doc/md_to_c.py"
}

build() {
    cd "${srcdir}/${_gitname}"
    ./configure --prefix=/usr --mandir=/usr/share/man/man1 --release \
        --python=python2 \
        --disable-ffmpeg_static --enable-libav \
        --disable-libx264_static --enable-libx264 \
        --disable-libx265_static --enable-libx265 \
        --disable-libvpx_static \
        --disable-libtheora_static \
        --disable-libvorbis_static \
        --disable-libfdkaac_static \
        --disable-libmfx_static --disable-qsv \
        --disable-nvenc \
        --disable-hdhomerun_static
    make
}

package() {
    cd "${srcdir}/${_gitname}"
    make DESTDIR="$pkgdir/" install
    install -D -m 644 "$srcdir/tvheadend.service" \
        "$pkgdir/usr/lib/systemd/system/tvheadend.service"
}

