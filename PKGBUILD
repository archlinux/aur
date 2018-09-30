# Maintainer: Melvin Vermeeren <mail@mel.vin>

pkgname=mpd-sacd
pkgver=0.21.0
pkgrel=9
pkgdesc='MPD with patches for SACD and DVDA ISO playback.'
url='https://sourceforge.net/p/sacddecoder/mpd/MPD.git/ci/master/tree/'
license=('GPL')
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
depends=('libao' 'ffmpeg' 'libmodplug' 'audiofile' 'libshout' 'libmad' 'curl' 'faad2'
	'sqlite' 'jack' 'libmms' 'wavpack' 'avahi' 'libid3tag' 'yajl' 'libmpdclient'
	'icu' 'libupnp' 'libnfs' 'libsamplerate' 'libsoxr' 'smbclient' 'libcdio-paranoia'
	'libgme' 'zziplib')
makedepends=('boost' 'doxygen')
conflicts=('mpd')
provides=("mpd=${pkgver}")
source=('mpd::git+https://git.code.sf.net/p/sacddecoder/mpd/MPD.git#commit=5690d1d9a6a61e0b90ad6d58b89838c2275959e1'
	'tmpfiles.d'
	'conf')
sha1sums=('SKIP'
          'f4d5922abb69abb739542d8e93f4dfd748acdad7'
          '291fd5cda9f0845834a553017327c4586bd853f6')

backup=('etc/mpd.conf')
install=install

build() {
	cd "${srcdir}/mpd"
	./autogen.sh
	./configure \
		--prefix=/usr \
		--sysconfdir=/etc \
		--enable-cdio-paranoia \
		--enable-iso9660 \
		--enable-jack \
		--enable-libmpdclient \
		--enable-pipe-output \
		--enable-pulse \
		--enable-soundcloud \
		--enable-zzip \
		--disable-sidplay \
		--with-systemduserunitdir=/usr/lib/systemd/user \
		--with-systemdsystemunitdir=/usr/lib/systemd/system \
		--enable-sacdiso \
		--enable-dvdaiso

	make
}

package() {
	cd "${srcdir}/mpd"
	make DESTDIR="${pkgdir}" install
	install -Dm644 ../conf "${pkgdir}"/etc/mpd.conf
	install -Dm644 ../tmpfiles.d "${pkgdir}"/usr/lib/tmpfiles.d/mpd.conf
	install -d -g 45 -o 45 "${pkgdir}"/var/lib/mpd{,/playlists}

	sed '/\[Service\]/a User=mpd' -i "${pkgdir}"/usr/lib/systemd/system/mpd.service
	sed '/WantedBy=/c WantedBy=default.target' -i "${pkgdir}"/usr/lib/systemd/system/mpd.service
}
