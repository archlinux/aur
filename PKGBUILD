# Maintainer: Alexey D. <lq07829icatm@rambler.ru>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>
# Contributor: Ben <ben@benmazer.net>

pkgname=mpd-light
pkgver=0.18.9
pkgrel=2
pkgdesc='Flexible, powerful, server-side application for playing music. Light version without ao, ffmpeg, jack, modplug, pulse, shout, sidplay, soundcloud, wavpack, avahi'
url='http://www.musicpd.org/'
license=('GPL')
arch=('i686' 'x86_64')
depends=('audiofile' 'libmad' 'curl' 'faad2' 'sqlite' 'libmms' 'libid3tag' 'libmpdclient')
makedepends=('doxygen')
provides=("mpd=$pkgver")
conflicts=('mpd')
replaces=('mpd')
source=("http://www.musicpd.org/download/mpd/${pkgver%.*}/mpd-${pkgver}.tar.xz"
        'mpd.tmpfile'
	'mpd.conf')
sha1sums=('70e96857d68c0191bbf721aa08a8b5f4ec8120c7'
          'f4d5922abb69abb739542d8e93f4dfd748acdad7'
          '57cd637ac6419ca50e3da28977727eb5c3a7770e')
backup=('etc/mpd.conf')
install=mpd.install

build() {
	cd "${srcdir}/mpd-${pkgver}"

	./configure \
		--prefix=/usr \
		--sysconfdir=/etc \
		--enable-libmpdclient \
		--disable-ao \
		--disable-ffmpeg \
		--disable-jack \
		--disable-modplug \
		--disable-pulse \
		--disable-shout \
		--disable-sidplay \
		--disable-soundcloud \
		--disable-wavpack \
		--with-zeroconf=no \
		--with-systemdsystemunitdir=/usr/lib/systemd/system

	make
}

package() {
	cd "${srcdir}/mpd-${pkgver}"
	
	make DESTDIR="${pkgdir}" install

	install -Dm644 ../mpd.conf "${pkgdir}"/etc/mpd.conf
	install -Dm644 ../mpd.tmpfile "${pkgdir}"/usr/lib/tmpfiles.d/mpd.conf
	install -d -g 45 -o 45 "${pkgdir}"/var/lib/mpd/playlists

	install -Dm644 "${pkgdir}"/usr/lib/systemd/{system,user}/mpd.service
	sed '/WantedBy=/c WantedBy=default.target' -i "${pkgdir}"/usr/lib/systemd/user/mpd.service
}
