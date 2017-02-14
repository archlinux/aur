# Maintainer: AudioLinux  <audiolinux AT fastmail DOT fm>

# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>
# Contributor: Ben <ben@benmazer.net>

pkgname=mpd-dsd
pkgver=0.19.19
pkgrel=1
pkgdesc='Flexible, powerful, server-side application for playing music with DSD patches and Sox enabled'
url='https://github.com/lintweaker/mpd-dsd-019'
license=('GPL')
arch=('i686' 'x86_64')
depends=('libao' 'ffmpeg' 'libmodplug' 'audiofile' 'libshout' 'libmad' 'curl' 'faad2'
         'sqlite' 'jack' 'libmms' 'wavpack' 'avahi' 'libid3tag' 'yajl' 'libmpdclient'
         'icu' 'libupnp' 'libnfs' 'libsamplerate' 'libsoxr' 'smbclient')
optdepends=('sox-dsd-git')
makedepends=('boost' 'doxygen' 'automake-1.14')
conflicts=('mpd')
validpgpkeys=('0392335A78083894A4301C43236E8A58C6DB4512')
source=("http://www.musicpd.org/download/mpd/${pkgver%.*}/mpd-${pkgver}.tar.xz"{,.sig}
        'tmpfiles.d'
        'conf'
        'dsd_native.patch')
sha1sums=('SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP')

backup=('etc/mpd.conf')
install=install

prepare() {
cd "${srcdir}/mpd-${pkgver}"
  patch -Np1 -i "../dsd_native.patch"
}

build() {
	cd "${srcdir}/mpd-${pkgver}"
	./configure \
		--prefix=/usr \
		--sysconfdir=/etc \
		--enable-libmpdclient \
		--enable-jack \
		--enable-soundcloud \
		--enable-pipe-output \
		--enable-pulse \
		--disable-sidplay \
		--enable-soxr \
		--with-systemdsystemunitdir=/usr/lib/systemd/system
	make
}

package() {
	cd "${srcdir}/mpd-${pkgver}"
	make DESTDIR="${pkgdir}" install
	install -Dm644 ../conf "${pkgdir}"/etc/mpd.conf
	install -Dm644 ../tmpfiles.d "${pkgdir}"/usr/lib/tmpfiles.d/mpd.conf
	install -d -g 45 -o 45 "${pkgdir}"/var/lib/mpd{,/playlists}

	install -Dm644 "${pkgdir}"/usr/lib/systemd/{system,user}/mpd.service
	sed '/\[Service\]/a User=mpd' -i "${pkgdir}"/usr/lib/systemd/system/mpd.service
	sed '/WantedBy=/c WantedBy=default.target' -i "${pkgdir}"/usr/lib/systemd/{system,user}/mpd.service
}
