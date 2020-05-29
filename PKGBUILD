# Maintainer:  Alex Mekkering <amekkering at gmail dot com>
# Contributor: Bjoern Franke <bjo@nord-west.org>

pkgname=tvheadend

pkgver=4.2.8
pkgrel=4
pkgdesc="TV streaming server for Linux"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://tvheadend.org/projects/tvheadend"
license=('GPL3')
depends=('avahi' 'ffmpeg' 'uriparser' 'openssl' 'tar')
makedepends=('git' 'wget' 'python')
optdepends=('xmltv: For an alternative source of programme listings'
	    'libiconv: For conversion of character encodings'
        'libavresample.so: For use of libav (i.e. for transcoding)'
)
provides=('tvheadend')
conflicts=('tvheadend-git')
install=tvheadend.install

source=("https://github.com/tvheadend/tvheadend/archive/v$pkgver.tar.gz"
	"tvheadend-service.patch"
	"tvheadend-4.2.8-fno-common.patch"
)
sha256sums=('1aef889373d5fad2a7bd2f139156d4d5e34a64b6d38b87b868a2df415f01f7ad'
            '23897afe6a6aa1382d0d37bf2c38bd4d04deabcb2bcc1f966b57323ffdc23f2c'
            '79a6f04859050830f2b0a8f3c025841627d8ab91fe2f5f73109cd72b02bb4ea8')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    # Patch tvheadend.service for Arch Linux
    patch -p1 -i "${srcdir}/tvheadend-service.patch"

    # Fix building with -fno-common (default from GCC 10)
    patch -p1 -i "${srcdir}/tvheadend-4.2.8-fno-common.patch"

    # detect libavresample and prepare for using it
    uselibav=""
    if [ -f /usr/include/libavresample/avresample.h ]; then
        echo "libavresample found, enabling use of libav!"
        CFLAGS="${CFLAGS} -Wno-error=stringop-truncation"
    else
        echo "libavresample not found, disabling use of libav! Please install libavresample to enable libav (i.e. for transcoding)."
        uselibav="--disable-libav"
    fi

    ./configure --prefix=/usr --python=python3 \
        --disable-ffmpeg_static \
        --disable-libx264_static \
        --disable-libx265_static \
        --disable-libvpx_static \
        --disable-libtheora_static \
        --disable-libvorbis_static \
        --disable-libfdkaac_static \
        ${uselibav}
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR="$pkgdir" install

    # Fix permission mode of man-page
    chmod 0644 "${pkgdir}/usr/share/man/man1/tvheadend.1"

    # Install service file
    install -Dm644 "rpm/tvheadend.service" "$pkgdir/usr/lib/systemd/system/tvheadend.service"
}
