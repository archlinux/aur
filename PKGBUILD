# Maintainer: fossdd <fossdd@pwned.life>
# Contributor: Louis Tim Larsen <louis(a)louis.dk>, Alex Mekkering <amekkering at gmail dot com>
# Contributor: Bjoern Franke <bjo@nord-west.org>

pkgname=tvheadend
# 4.3.0 is beta and older than 4.2.8
pkgver=4.2.8
pkgrel=8
pkgdesc="TV streaming server for Linux"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://tvheadend.org/"
license=('GPL-3.0-only')
depends=(
	'avahi'
	'dbus'
	'openssl'
	'uriparser'
)
makedepends=(
	'git'
	'python'
	'wget'
)
optdepends=(
	'libiconv: For conversion of character encodings'
	'xmltv: For an alternative source of programme listings'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/tvheadend/tvheadend/archive/v$pkgver.tar.gz"
	"tvheadend.sysusers"
	"service-no-sysconfig.patch"
	"gcc10.patch"
	"update-vendored-libhdhomerun.patch"
)
sha256sums=('1aef889373d5fad2a7bd2f139156d4d5e34a64b6d38b87b868a2df415f01f7ad'
            'fcdd5803857ccecd69fdacf6588b05807948939fc9e23e0d78b432e67fe45ad6'
            'c7fa91e1a93e8b7a4d623bb56de5a3d19486d2621b15d6a1348c8bd4cdacccb8'
            '67feec28c10ae8bf9273f44af98675e89f7fd3df306d8c7d990450bbe21c96f9'
            'fba1b02700a0bee5c456e6e0904fd371978b92890e0a7d44b43b46d162f0fe1f')

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	# Disables use of /etc/sysconfig
	patch -p1 -i "${srcdir}/service-no-sysconfig.patch"

	# Fix building with -fno-common (default from GCC 10)
	patch -p1 -i "${srcdir}/gcc10.patch"

	# Change libhdhomerun source from 20171221 to 20180327
	patch -i "${srcdir}/update-vendored-libhdhomerun.patch"
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	# Temporary for GCC 15 defaulting to C23
	export CFLAGS="$CFLAGS -std=gnu11"

	# libswresample is disabled in Arch ffmpeg, therefore libav
	# (which is e.g. used for transcoding) has to be disabled
	./configure \
		--prefix=/usr \
		--sysconfdir=/etc \
		--mandir=/usr/share/man \
		--infodir=/usr/share/info \
		--localstatedir=/var \
		--disable-libav \
		--disable-ffmpeg_static \
		--disable-libx264_static \
		--disable-libx265_static \
		--disable-libvpx_static \
		--disable-libtheora_static \
		--disable-libvorbis_static \
		--disable-libfdkaac_static \
		--disable-libmfx_static \
		--python=python3 \
		--nowerror

	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="$pkgdir" install

	# systemd
	install -Dvm644 rpm/tvheadend.service "$pkgdir"/usr/lib/systemd/system/tvheadend.service
	install -Dvm644 "$srcdir"/tvheadend.sysusers "$pkgdir"/usr/lib/sysusers.d/tvheadend.conf

	# Fix permission mode of man-page
	chmod 0644 "${pkgdir}/usr/share/man/man1/tvheadend.1"
}
