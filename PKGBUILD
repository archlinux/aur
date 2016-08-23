# $Id: PKGBUILD 273385 2016-08-06 06:47:33Z bisson $
# Maintainer: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>
# Contributor: Ben <ben@benmazer.net>

_pkgname=mpd
pkgname=mpd-m4afix
pkgver=0.19.18
pkgrel=2
pkgdesc='Flexible, powerful, server-side application for playing music'
url='http://www.musicpd.org/'
license=('GPL')
arch=('i686' 'x86_64')
depends=('libao' 'ffmpeg' 'libmodplug' 'audiofile' 'libshout' 'libmad' 'curl' 'faad2'
         'sqlite' 'jack' 'libmms' 'wavpack' 'avahi' 'libid3tag' 'yajl' 'libmpdclient'
         'icu' 'libupnp' 'libnfs' 'libsamplerate' 'libsoxr' 'smbclient' 'libcdio-paranoia')
makedepends=('boost' 'doxygen')
replaces=("mpd")
conflicts=("mpd")
validpgpkeys=('0392335A78083894A4301C43236E8A58C6DB4512')
source=("http://www.musicpd.org/download/${_pkgname}/${pkgver%.*}/${_pkgname}-${pkgver}.tar.xz"{,.sig}
        'tmpfiles.d'
        'conf'
        'm4a.patch'
        'wildmidi.patch')
sha1sums=('41065043589208db1100c5a3f3c15fbd3ac87669'
          'SKIP'
          'f4d5922abb69abb739542d8e93f4dfd748acdad7'
          '291fd5cda9f0845834a553017327c4586bd853f6'
          '8e97b8113eac706f974356d200e22f5da73b87dc'
          '6c257cff45edf9666ce13e0f0bfd791162a5bb94')

backup=('etc/mpd.conf')
install=install

prepare() {
	# Temporary; see FS#48372
	install -d "${srcdir}"/pkg-config
	ln -s /usr/lib/pkgconfig/libsystemd.pc "${srcdir}"/pkg-config/libsystemd-daemon.pc
    cd "${srcdir}/${_pkgname}-${pkgver}"
    patch -p1 < "${srcdir}/m4a.patch"
    patch -p1 < "${srcdir}/wildmidi.patch"
}

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	export PKG_CONFIG_PATH="${srcdir}"/pkg-config
	./configure \
		--prefix=/usr \
		--sysconfdir=/etc \
		--enable-cdio-paranoia \
		--enable-libmpdclient \
		--enable-jack \
		--enable-soundcloud \
		--enable-pipe-output \
		--enable-pulse \
		--disable-sidplay \
		--with-systemdsystemunitdir=/usr/lib/systemd/system
	make
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
	install -Dm644 ../conf "${pkgdir}"/etc/mpd.conf
	install -Dm644 ../tmpfiles.d "${pkgdir}"/usr/lib/tmpfiles.d/mpd.conf
	install -d -g 45 -o 45 "${pkgdir}"/var/lib/mpd{,/playlists}

	install -Dm644 "${pkgdir}"/usr/lib/systemd/{system,user}/mpd.service
	sed '/\[Service\]/a User=mpd' -i "${pkgdir}"/usr/lib/systemd/system/mpd.service
	sed '/WantedBy=/c WantedBy=default.target' -i "${pkgdir}"/usr/lib/systemd/{system,user}/mpd.service
}
