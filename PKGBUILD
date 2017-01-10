# Maintainer: twa022 <twa022 at gmail dot com>

pkgname=spotify-web-player
pkgver=1.0.0
pkgrel=2
pkgdesc="A Spotify Web Player wrapper in Electron"
arch=('i686' 'x86_64')
url="https://github.com/Quacky2200/Spotify-Web-Player-for-Linux"
license=('MIT')
depends=('libappindicator-gtk3' 'libnotify' 'unzip' 'electron' 'pepper-flash')
makedepends=('npm')
optdepends=('dbus: Notification and MPRIS controller support')
conflicts=('spotify-web-player-for-linux' 'lib32-spotify-web-player-for-linux' "${pkgname}-git")
source=("$pkgname-$pkgver.tar.gz::https://github.com/Quacky2200/Spotify-Web-Player-for-Linux/archive/$pkgver.tar.gz"
        'use_system_flash.patch'
        'use_system_electron.patch')
sha256sums=('1a063926c8434908ce6ffe39324509d933bb659129616329d46528598d9bc445'
            '2d6ec0514d4e0117284746c0885abbc15d42e091f81c20429ca28201474e6ddc'
            'c3f2a515a3cd31fcb3c78417a6f1da6790ee797ec70e1de8f1ca3f5ad0fc5ab5')

prepare() {
	cd "$srcdir"/Spotify-Web-Player-for-Linux-${pkgver}
	# Don't use the bundled flash plugins, use the system copy
	patch -uNp2 -r- -i ../use_system_flash.patch
	# Don't download a prebuilt electron, use the system copy
	patch -uNp2 -r- -i ../use_system_electron.patch
}

package() {
	cd "$srcdir"/Spotify-Web-Player-for-Linux-${pkgver}
	# Remove unneeded scripts
	rm ./{make_deb.sh,spotifywebplayer,get_prerequisites.sh,LICENSE}
	# We use the system flash plugin, remove the bundled ones
	rm -r plugins
	
	# Fix permissions!
	find . -type f -exec chmod 644 '{}' \;
	find . -type d -exec chmod 755 '{}' \;
	
	# Install dependencies
	npm install
	
	# Install the program
	mkdir -p "$pkgdir"/usr/lib
	cp -ar --no-preserve=ownership "${srcdir}/Spotify-Web-Player-for-Linux-${pkgver}" "$pkgdir"/usr/lib/spotifywebplayer
	
	# Write our own file to /usr/bin so we can use system provided electron
	mkdir -p "$pkgdir"/usr/bin
	cat >> "$pkgdir"/usr/bin/spotifywebplayer <<- EOF
		#!/bin/bash

		electron --app=/usr/lib/spotifywebplayer "$@"

		exit 0
	EOF
	chmod 755 "$pkgdir"/usr/bin/spotifywebplayer

	# Add the icon to the pixmap directory
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
}
