# Maintainer: Riedler <dev@riedler.wien>
# Contributor: spider-mario <spidermario@free.fr>
# Contributor: Christoph Zeiler <rabyte*gmail>

pkgname=gbsplay
pkgver=0.0.102
pkgrel=1
pkgdesc="A command line application for playing GameBoy sound files (GBS)"
arch=('i686' 'x86_64')
url='https://github.com/mmitch/gbsplay'
license=('GPL-1.0-or-later')
optdepends=('nas: for Network Audio System sound driver'
			'alsa-lib: for ALSA sound driver'
			'libpulse: for pulseaudio sound driver'
			'sdl2: for SDL sound driver'
			'pipewire: for pipewire sound driver'
			'vorbis-tools: for gbs2ogg'
			'zlib: for compressed input files')
source=("https://github.com/mmitch/gbsplay/archive/refs/tags/$pkgver.tar.gz"
        'do-not-update-database.patch')
sha512sums=('fde81f5861777e1f5aadbe1608e5da105835215ea6c0bf07f6d0d96d17a179f43f60b93c1060ab0d86e432502b0536c612a4f6818d3ac200b78002d320655cc1'
            '2de20d227fe5cb17fd29b666fb55438560b6859a2bcccad910a631189a3698f220b29791493b5ab105fcabd92419b04edd220b85a4b5034723a63fe2f4b898ff')

prepare() {
	cd gbsplay-$pkgver
	
	# modifies usage string to print the full path instead of just the filename
	sed 's|gbs2ogg.sh|gbs2ogg|g' --in-place contrib/gbs2ogg.sh

	# sets version so it doesn't return "0.0.100ish" anymore
	sed 's|^VERSION=unknown$|VERSION='$pkgver'|g' --in-place configure
	
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

	cd contrib
	install -Dm755 gbs2ogg.sh "$pkgdir"/usr/bin/gbs2ogg
	install -Dm644 gbsplay.bashcompletion "$pkgdir"/etc/bash_completion.d/gbsplay
	install -Dm644 gbsplay.zshcompletion "$pkgdir"/usr/share/zsh/site-functions/_gbsplay
}
