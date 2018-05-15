# Maintainer:  Alex Mekkering <amekkering at gmail dot com>
# Contributor: Bjoern Franke <bjo@nord-west.org>

pkgname=tvheadend

pkgver=4.2.6
pkgrel=5
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
	"tvheadend-service.patch"
	"0001-ffmpeg-3.5-fixes.patch"
)
sha256sums=('09b4d4ff436a2006001ef3c3f38553dc4db3ea31bf9871b046a33180a0e8a8b9'
            '23897afe6a6aa1382d0d37bf2c38bd4d04deabcb2bcc1f966b57323ffdc23f2c'
            '0481d7ab443639d2ffc2e13e7f3207b1489fafbe605b9fbe50d3a8d44acf5a38')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    # Patch tvheadend.service for Arch Linux
    patch -p1 -i "${srcdir}/tvheadend-service.patch"

    # Backport commit 3cb4f580565b307457f6e645f34bf113c2be54a4 to support ffmpeg 4.0
    patch -p1 -i "${srcdir}/0001-ffmpeg-3.5-fixes.patch"

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
}
