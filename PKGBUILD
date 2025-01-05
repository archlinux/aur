# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=benben
pkgdesc='Multi-format, fast and efficient command line audio player and audio converter'
pkgver=0.6.1
pkgrel=2
arch=(x86_64)
license=(AGPL-3.0-or-later)
depends=(libsidplayfp slang libxmp wavpack libvorbis opus mpg123 libpulse libao portaudio)
makedepends=(ruby crystal fossil shards tcl)
url=https://chiselapp.com/user/MistressRemilia/repository/benben
source=("$pkgname-$pkgver::fossil+$url#tag=v$pkgver")
b2sums=(SKIP)

export USER=nobody

prepare () {
	cd "$pkgname-$pkgver"
	shards install --production
	ruby configure.rb --prefix=/usr --sharedir=share
}

build () {
	cd "$pkgname-$pkgver"
	make -C src/audio-formats/lib

	# benben
	shards build --release --frame-pointers=always -s -p \
		-Dpreview_mt -D{yunosynth,haematite,remiaudio}_wd40

	# remote-benben
	crystal build --release --frame-pointers=always -s -p \
		-Dpreview_mt -Dcompile_benben_remote \
		-o bin/remote-benben tools/remote-benben/main.cr
}

package () {
	cd "$pkgname-$pkgver"
	install -Dm755 -t "$pkgdir/usr/bin" bin/{remote-,}benben
}
