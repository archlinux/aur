# Maintainer: twa022 <twa022 at gmail dot com>

pkgname=spotify-web-player
pkgver=1.0.0
pkgrel=1
pkgdesc="A Spotify Web Player wrapper in Electron"
arch=('i686' 'x86_64')
url="https://github.com/Quacky2200/Spotify-Web-Player-for-Linux"
license=('MIT')
depends=('libappindicator-gtk3' 'libnotify' 'unzip' 'electron')
optdepends=('dbus: Notification and MPRIS controller support')
conflicts=('spotify-web-player-for-linux' 'lib32-spotify-web-player-for-linux')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Quacky2200/Spotify-Web-Player-for-Linux/archive/$pkgver.tar.gz")
source_i686=("https://github.com/Quacky2200/Spotify-Web-Player-for-Linux/releases/download/$pkgver/node_modules_x86.zip")
source_x86_64=("https://github.com/Quacky2200/Spotify-Web-Player-for-Linux/releases/download/$pkgver/node_modules_x64.zip")
noextract=('node_modules_x64.zip' 'node_modules_x86.zip')
sha256sums=('1a063926c8434908ce6ffe39324509d933bb659129616329d46528598d9bc445')
sha256sums_i686=('e8759db701746c136293a33792b438a639da50ebd8a0b1154e6f94719a2d7140')
sha256sums_x86_64=('020fc586b8614aac160c3b74b76ba26edc552e64523a024955ea35a788c928a4')

package() {
	cd "$srcdir"
	mkdir -p "$pkgdir"/usr/lib
	cp -ar --no-preserve=ownership "Spotify-Web-Player-for-Linux-${pkgver}" "$pkgdir"/usr/lib/spotifywebplayer
	# Remove unnecessary scripts
	rm "$pkgdir"/usr/lib/spotifywebplayer/{make_deb.sh,spotifywebplayer,get_prerequisites.sh,LICENSE}
	
	mkdir -p "$pkgdir"/usr/lib/spotifywebplayer/node_modules
	unzip "$node_modules_*.zip" -d "$pkgdir"/usr/lib/spotifywebplayer/node_modules
	
	# Write our own file to /usr/bin so we can use system provided electron
	mkdir -p "$pkgdir"/usr/bin
	cat >> "$pkgdir"/usr/bin/spotifywebplayer <<- EOF
		#!/bin/bash

		electron --app=/usr/lib/spotifywebplayer "$@"

		exit 0
	EOF
	
	mkdir -p "${pkgdir}"/usr/share/pixmaps/
	cp /usr/lib/spotifywebplayer/icons/spotify.png "${pkgdir}"/usr/share/pixmaps/spotifywebplayer.png
	
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

	# Fix permissions!
	find "$pkgdir" -type f -exec chmod 644 '{}' \;
	find "$pkgdir" -type d -exec chmod 755 '{}' \;
	chmod 755 "$pkgdir"/usr/bin/spotifywebplayer
}
