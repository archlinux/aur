# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=spotify-web-player
pkgname=${_pkgname}-git
pkgver=1.0.35.r0.gd3587fc
pkgrel=1
pkgdesc="A Spotify Web Player wrapper in Electron"
arch=('i686' 'x86_64')
url="https://github.com/Quacky2200/Spotify-Web-Player-for-Linux"
license=('MIT')
depends=('libappindicator-gtk3' 'libnotify' 'unzip' 'electron' 'pepper-flash')
makedepends=('npm')
optdepends=('dbus: Notification and MPRIS controller support')
conflicts=("$_pkgname")
provides=("$_pkgname")
source=("$_pkgname::git+https://github.com/Quacky2200/Spotify-Web-Player-for-Linux.git"
        'use_system_flash.patch')
sha256sums=('SKIP'
            'c3f8aceb2cc7e323d61303b191c4a717fdd0c54a3655f9e52f5976c6c2224732')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
	cd "${srcdir}/${_pkgname}"
	# Don't need to get an electron package since we're using the system's
	sed -i '/^[\ ]*"electron":/d' package.json

	# Use the system's flash plugin
	patch -uNp2 -r- -i ../use_system_flash.patch
}

package() {
	cd "${srcdir}/${_pkgname}"
	# We use the system flash plugin, remove the bundled ones
	rm -fr ./plugins

	# Fix permissions!
	find . -type f -exec chmod 644 '{}' \;
	find . -type d -exec chmod 755 '{}' \;

	# Get additional modules
	HOME=~/.electron-gyp npm install
	npm rebuild --runtime=electron --target=$( electron --version | sed 's:^v::' ) --build-from-source

	cd "${srcdir}"
	mkdir -p "$pkgdir"/usr/lib
	cp -ar --no-preserve=ownership "${_pkgname}" "$pkgdir"/usr/lib/spotifywebplayer

	# Write our own file to /usr/bin so we can use system provided electron
	mkdir -p "$pkgdir"/usr/bin
	cat >> "$pkgdir"/usr/bin/spotifywebplayer <<- EOF
		#!/bin/bash

		electron --app=/usr/lib/spotifywebplayer "\$@"

		exit 0
	EOF

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

	chmod 755 "$pkgdir"/usr/bin/spotifywebplayer
}
