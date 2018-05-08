# Maintainer:  Alex Mekkering <amekkering at gmail dot com>
# Contributor: Bjoern Franke <bjo@nord-west.org>

pkgname=tvheadend

pkgver=4.2.6
pkgrel=3
pkgdesc="TV streaming server for Linux"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://tvheadend.org/projects/tvheadend"
license=('GPL3')
depends=('avahi' 'ffmpeg' 'uriparser' 'openssl' 'tar')
makedepends=('git' 'wget' 'python')
optdepends=('xmltv: For an alternative source of programme listings'
	    'libiconv: For conversion of character encodings'
)
provides=('tvheadend')
conflicts=('tvheadend-git')
install=tvheadend.install

source=("https://github.com/tvheadend/tvheadend/archive/v$pkgver.tar.gz"
	"tvheadend.override"
)
sha256sums=('09b4d4ff436a2006001ef3c3f38553dc4db3ea31bf9871b046a33180a0e8a8b9'
            'bbb54ae46fbb1b00f987c0a8dde644ee9a0121fa173ee21cc6bf7a6a6fb12146')
 
prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    ./configure --prefix=/usr --python=python3 \
        --disable-ffmpeg_static \
        --disable-libx264_static \
        --disable-libx265_static \
        --disable-libvpx_static \
        --disable-libtheora_static \
        --disable-libvorbis_static \
        --disable-libfdkaac_static
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    # TODO: temporary fix to succeed compilation with GCC 8+
    make CFLAGS_NO_WERROR=yes
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR="$pkgdir" install

    # Fix permission mode of man-page
    chmod 0644 "${pkgdir}/usr/share/man/man1/tvheadend.1"

    # Install service file
    install -Dm644 "rpm/tvheadend.service" "$pkgdir/usr/lib/systemd/system/tvheadend.service"

    # Install service override
    install -Dm644 "$srcdir/tvheadend.override" "$pkgdir/usr/lib/systemd/system/tvheadend.service.d/override.conf"
}
