# Maintainer: twa022 <twa022 at gmail dot com>

pkgname=spotify-web-player
pkgver=1.0.35
pkgrel=2
pkgdesc="A Spotify Web Player wrapper in Electron"
arch=('i686' 'x86_64')
url="https://github.com/Quacky2200/Spotify-Web-Player-for-Linux"
license=('MIT')
depends=('libnotify' 'unzip' 'electron' 'pepper-flash')
makedepends=('npm')
optdepends=('dbus: Notification and MPRIS controller support')
conflicts=("${pkgname}-git")
source=("$pkgname-$pkgver.tar.gz::https://github.com/Quacky2200/Spotify-Web-Player-for-Linux/archive/$pkgver.tar.gz"
        'use_system_flash.patch')
sha256sums=('6c999e3bf0e19464181f77fddf5c1a882039478c4d1d505802ac3d5fcb897365'
            '7d2b0582d1d66e8f7e6bd7e08c16d024d3b12339c625d3519320412c051240f7')

prepare() {
	cd "$srcdir"/Spotify-Web-Player-for-Linux-${pkgver}
	# Don't need to get an electron package since we're using the system's
	sed -i '/^[\ ]*"electron":/d' package.json

	# Use the system's flash plugin
	patch -uNp2 -r- -i ../use_system_flash.patch
}

package() {
	cd "$srcdir"/Spotify-Web-Player-for-Linux-${pkgver}
	# We use the system flash plugin, remove the bundled ones
	rm -r plugins

	# Fix permissions!
	find . -type f -exec chmod 644 '{}' \;
	find . -type d -exec chmod 755 '{}' \;

	# Get additional modules
	HOME=~/.electron-gyp npm install
	npm rebuild --runtime=electron --target=$( electron --version | sed 's:^v::' ) --disturl=https://atom.io/download/atom-shell --abi=50

	# Install the program
	mkdir -p "$pkgdir"/usr/lib
	cp -ar --no-preserve=ownership "${srcdir}/Spotify-Web-Player-for-Linux-${pkgver}" "$pkgdir"/usr/lib/spotifywebplayer

	# Write our own file to /usr/bin so we can use system provided electron
	mkdir -p "$pkgdir"/usr/bin
	cat >> "$pkgdir"/usr/bin/spotifywebplayer <<- EOF
		#!/bin/bash

		electron --app=/usr/lib/spotifywebplayer "\$@"

		exit 0
	EOF
	chmod 755 "$pkgdir"/usr/bin/spotifywebplayer

	# Add the icon to the pixmap directory
	mkdir -p "${pkgdir}"/usr/share/pixmaps/
	cp "${pkgdir}"/usr/lib/spotifywebplayer/icons/spotify.png "${pkgdir}"/usr/share/pixmaps/spotifywebplayer.png

	# No desktop file provided
	mkdir -p "$pkgdir"/usr/share/applications
	cat >> "$pkgdir"/usr/share/applications/spotifywebplayer.desktop <<- EOF
		[Desktop Entry]
		Version=$pkgver_new
		Name=Spotify Web Player
		Comment=Music for every moment. Spotify is a digital music service that gives you access to millions of songs.
		Exec=bash /usr/bin/spotifywebplayer
		Path=/usr/lib/spotifywebplayer
		Icon=spotifywebplayer
		Categories=GNOME;GTK;AudioVideo;Audio;Player;
		Actions=PlayPause;Next;Previous;
		Type=Application
		Terminal=false
		[Desktop Action PlayPause]
		Name=Play/Pause
		Exec=dbus-send --print-reply --reply-timeout=2500 --session --dest=org.mpris.MediaPlayer2.spotifywebplayer /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.PlayPause
		[Desktop Action Next]
		Name=Next
		Exec=dbus-send --print-reply --session --dest=org.mpris.MediaPlayer2.spotifywebplayer /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Next
		[Desktop Action Previous]
		Name=Previous
		Exec=dbus-send --print-reply --session --dest=org.mpris.MediaPlayer2.spotifywebplayer /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Previous
	EOF
}
