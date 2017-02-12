# Maintainer: Melvin Vermeeren <mail@mel.vin>

pkgname=mpd-sacd
pkgver=0.20
pkgrel=8
pkgdesc='MPD with patches for SACD and DVDA ISO playback.'
url='http://git.musicpd.org/cgit/manisiutkin/mpd.git/'
license=('GPL')
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
depends=('libao' 'ffmpeg' 'libmodplug' 'audiofile' 'libshout' 'libmad' 'curl' 'faad2'
         'sqlite' 'jack' 'libmms' 'wavpack' 'avahi' 'libid3tag' 'yajl' 'libmpdclient'
         'icu' 'libupnp' 'libnfs' 'libsamplerate' 'libsoxr' 'smbclient' 'libcdio-paranoia')
makedepends=('boost' 'doxygen')
conflicts=('mpd')
provides=('mpd=0.20')
source=('git://git.musicpd.org/manisiutkin/mpd.git#commit=093f880674826dab55c5063128813f543d8c063b'
        'tmpfiles.d'
        'conf')
sha1sums=('SKIP'
          'f4d5922abb69abb739542d8e93f4dfd748acdad7'
          '291fd5cda9f0845834a553017327c4586bd853f6')

backup=('etc/mpd.conf')
install=install

prepare() {
	# Temporary; see FS#48372
	install -d "${srcdir}"/pkg-config
	ln -s /usr/lib/pkgconfig/libsystemd.pc "${srcdir}"/pkg-config/libsystemd-daemon.pc
}

build() {
	cd "${srcdir}/mpd"
	./autogen.sh
	./configure \
		--prefix=/usr \
		--sysconfdir=/etc \
		--enable-cdio-paranoia \
		--enable-libmpdclient \
		--enable-jack \
		--enable-soundcloud \
		--enable-pipe-output \
		--enable-pulse \
		--enable-sacdiso \
		--enable-dvdaiso \
		--disable-sidplay \
		--disable-wildmidi \
		--with-systemdsystemunitdir=/usr/lib/systemd/system

	# Quick fix for missing glib-2.0 include.
	sed -i 's/DSD_CFLAGS = \\/DSD_CFLAGS = $(MMS_CFLAGS) \\/' "${srcdir}"/mpd/Makefile

	make
}

package() {
	cd "${srcdir}/mpd"
	make DESTDIR="${pkgdir}" install
	install -Dm644 ../conf "${pkgdir}"/etc/mpd.conf
	install -Dm644 ../tmpfiles.d "${pkgdir}"/usr/lib/tmpfiles.d/mpd.conf
	install -d -g 45 -o 45 "${pkgdir}"/var/lib/mpd{,/playlists}

	install -Dm644 "${pkgdir}"/usr/lib/systemd/{system,user}/mpd.service
	sed '/\[Service\]/a User=mpd' -i "${pkgdir}"/usr/lib/systemd/system/mpd.service
	sed '/WantedBy=/c WantedBy=default.target' -i "${pkgdir}"/usr/lib/systemd/{system,user}/mpd.service
}
