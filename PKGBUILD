# Maintainer: Riedler <dev@riedler.wien>
# Contributor: spider-mario <spidermario@free.fr>
# Contributor: Christoph Zeiler <rabyte*gmail>

pkgname=gbsplay-git
pkgver=0.0.100.1242
pkgrel=1
pkgdesc="A command line application for playing GameBoy sound files (GBS)"
arch=('i686' 'x86_64')
url='https://github.com/mmitch/gbsplay'
license=('GPL-1.0-or-later')
optdepends=('nas: for NAS sound driver'
			'alsa-lib: for ALSA sound driver'
			'libpulse: for pulseaudio sound driver'
			'sdl2: for SDL sound driver'
			'pipewire: for pipewire support'
			'vorbis-tools: for gbs2ogg'
			'zlib: for compressed input files')
makedepends=('git')
source=("git+https://github.com/mmitch/gbsplay.git#branch=master"
        'do-not-update-database.patch')
sha512sums=('SKIP'
            '2de20d227fe5cb17fd29b666fb55438560b6859a2bcccad910a631189a3698f220b29791493b5ab105fcabd92419b04edd220b85a4b5034723a63fe2f4b898ff')
provides=('gbsplay')
conflicts=('gbsplay')

pkgver() {
	cd gbsplay
	printf "%s.%s" "$(git describe --tags --abbrev=0)" "$(git rev-list --count HEAD)"
}

prepare() {
	cd gbsplay
	
	# modifies usage string to print the full path instead of just the filename
	sed 's|gbs2ogg.sh|gbs2ogg|g' --in-place contrib/gbs2ogg.sh
	
	# stops mime database from updating
	git apply -3 "$srcdir"/do-not-update-database.patch
}

build() {
	cd gbsplay

	./configure --prefix=/usr --mandir=/usr/share/man
	make
}

package() {
	cd gbsplay

	make DESTDIR="$pkgdir" install

	cd contrib
	install -Dm755 gbs2ogg.sh "$pkgdir"/usr/bin/gbs2ogg
	install -Dm644 gbsplay.bashcompletion "$pkgdir"/etc/bash_completion.d/gbsplay
	install -Dm644 gbsplay.zshcompletion "$pkgdir"/usr/share/zsh/site-functions/_gbsplay
}
