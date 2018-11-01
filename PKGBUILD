# Maintainer:  Alex Mekkering <amekkering at gmail dot com>
# Contributor: Bjoern Franke <bjo@nord-west.org>

pkgname=tvheadend

pkgver=4.2.7
pkgrel=2
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
)
sha256sums=('e333e2b3756ce20d32cbff5dc4e126e2d9efe8adac7a942ba73cacb0cd131a79'
            '23897afe6a6aa1382d0d37bf2c38bd4d04deabcb2bcc1f966b57323ffdc23f2c')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    # Patch tvheadend.service for Arch Linux
    patch -p1 -i "${srcdir}/tvheadend-service.patch"

    ./configure --prefix=/usr --python=python3 \
        --disable-ffmpeg_static \
        --disable-libx264_static \
        --disable-libx265_static \
        --disable-libvpx_static \
        --disable-libtheora_static \
        --disable-libvorbis_static \
        --disable-libfdkaac_static \
        --disable-libav
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
