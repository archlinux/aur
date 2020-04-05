# Maintainer: Cédric Schieli <cschieli@gmail.com>

pkgname=tvheadend-satip-server-git
_gitname='tvheadend-git'
pkgver=4.3.r1857.g221c29b40
pkgrel=1
pkgdesc="TV streaming server for Linux"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://tvheadend.org/"
license=('GPL3')
depends=(
    'openssl'
    'pcre2'
    'uriparser'
)
makedepends=(
    'git'
    'python'
)
optdepends=(
    'xmltv: For an alternative source of programme listings'
)
provides=('tvheadend')
conflicts=('tvheadend' 'hts-tvheadend' 'hts-tvheadend-svn' 'tvheadend-git')
install=tvheadend.install
backup=('etc/conf.d/tvheadend')

source=(
    "${_gitname}::git+https://github.com/tvheadend/tvheadend.git#branch=master"
    'dvb-scan-tables::git+https://git.linuxtv.org/dtv-scan-tables.git#branch=master'
)
md5sums=(
    'SKIP'
    'SKIP'
)

pkgver() {
    cd "${srcdir}/${_gitname}"
    git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${srcdir}"
    _dvbscan="${_gitname}/data/dvb-scan"
    rm -rf "${_dvbscan}"
    cp -a "dvb-scan-tables" "${_dvbscan}"
    rm -rf "${_dvbscan}/.git"
    touch "${_dvbscan}/.stamp"
}

build() {
    cd "${srcdir}/${_gitname}"

    ./configure --prefix=/usr --mandir=/usr/share/man/man1 --release \
        --python=python3 \
        --enable-pie \
        --disable-ccdebug \
        --disable-cardclient \
        --disable-cwc \
        --disable-cccam \
        --disable-capmt \
        --disable-constcw \
        --enable-linuxdvb \
        --enable-satip_server \
        --disable-satip_client \
        --disable-hdhomerun_static --disable-hdhomerun_client \
        --disable-iptv \
        --enable-tsfile \
        --enable-dvbscan \
        --disable-timeshift \
        --enable-trace \
        --disable-avahi \
        --enable-zlib \
        --disable-ffmpeg_static --disable-libav \
        --disable-libx264_static --disable-libx264 \
        --disable-libx265_static --disable-libx265 \
        --disable-libvpx_static --disable-libvpx \
        --disable-libtheora_static --disable-libtheora \
        --disable-libvorbis_static --disable-libvorbis \
        --disable-libfdkaac_static --disable-libfdkaac \
        --disable-libopus_static --disable-libopus \
        --disable-nvenc \
        --disable-vaapi \
        --disable-mmal \
        --disable-omx \
        --enable-inotify \
        --enable-epoll \
        --disable-pcre --enable-pcre2 \
        --enable-uriparser \
        --disable-ccache \
        --disable-tvhcsa \
        --disable-bundle \
        --disable-pngquant \
        --disable-kqueue \
        --disable-dbus_1 \
        --disable-android \
        --disable-gtimer_check \
        --disalbe-slow_memoryinfo \
        --enable-libsystemd_daemon \
        --disable-pcloud_cache \
        --disable-ddci \
        --disable-cclang_threadsan \
        --disable-gperftools
    make
}

package() {
    cd "${srcdir}/${_gitname}"
    make DESTDIR="$pkgdir/" install

    install -D -m 644 "${srcdir}/${_gitname}/rpm/tvheadend.service" \
        "$pkgdir/usr/lib/systemd/system/tvheadend.service"
    sed -i 's|/etc/sysconfig|/etc/conf.d|g' \
        "$pkgdir/usr/lib/systemd/system/tvheadend.service"

    install -d "$pkgdir/etc/conf.d"
    cat << EOF > "$pkgdir/etc/conf.d/tvheadend"
# Configuration file for the tvheadend service.

MALLOC_ARENA_MAX=4
OPTIONS="-u hts -g video -6 --http_port 9981 --htsp_port 9982"
EOF
}

