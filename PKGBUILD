# Maintainer: Riedler <dev@riedler.wien>
# Contributor: spider-mario <spidermario@free.fr>
# Contributor: Christoph Zeiler <rabyte*gmail>

pkgname=gbsplay
pkgver=0.0.97
pkgrel=1
pkgdesc="A command line application for playing GameBoy sound files (GBS)"
arch=('i686' 'x86_64')
url='https://github.com/mmitch/gbsplay'
license=('GPL-1.0-or-later')
optdepends=('nas: for Network Audio System sound driver'
			'alsa-lib: for ALSA sound driver'
			'libpulse: for pulseaudio sound driver'
			'sdl2: for SDL sound driver'
			'pipewire<1.0.0: for pipewire support'
			'vorbis-tools: for gbs2ogg'
			'zlib: for compressed input files')
source=("https://github.com/mmitch/gbsplay/archive/refs/tags/$pkgver.tar.gz"
        'do-not-update-database.patch')
sha512sums=('efb1f7eebe1075fafbed4d040cf19533222e2289ab5ccc66d4d9d7701420a00bc616f3d392b2b9e4f2aac1718068160130897e4e613f1d118ce2840413260896'
            '2de20d227fe5cb17fd29b666fb55438560b6859a2bcccad910a631189a3698f220b29791493b5ab105fcabd92419b04edd220b85a4b5034723a63fe2f4b898ff')

prepare() {
	cd gbsplay-$pkgver
	
	# modifies usage string to print the full path instead of just the filename
	sed 's|gbs2ogg.sh|gbs2ogg|g' --in-place contrib/gbs2ogg.sh
	
	# stops mime database from updating
	patch -p1 < "$srcdir"/do-not-update-database.patch
}

build() {
	cd gbsplay-$pkgver
	./configure --prefix=/usr --mandir=/usr/share/man
	make
}

package() {
	cd gbsplay-$pkgver

	make DESTDIR="$pkgdir" install

	install -Dm644 LICENCE "$pkgdir"/usr/share/licenses/gbsplay/LICENCE

	cd contrib
	install -Dm755 gbs2ogg.sh "$pkgdir"/usr/bin/gbs2ogg
	install -Dm644 gbsplay.bashcompletion "$pkgdir"/etc/bash_completion.d/gbsplay
}
