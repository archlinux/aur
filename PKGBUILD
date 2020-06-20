# Maintainer: Ren Tatsumoto <tatsu at autistici dot org>
# Contributor: darkgrin <darkgrin at yahoo dot com>
pkgname=subs2srs
pkgver=29.7
pkgrel=2
pkgdesc="A small utility that allows you to create Anki (flash card software) import files based on your favorite foreign language movies and TV shows to aid in the language learning process."
arch=('any')
url="http://subs2srs.sourceforge.net/"
license=('GPL')
depends=('mono' 'ffmpeg' 'mp3gain' 'mkvtoolnix-cli')
optdepends=('anki')
makedepends=('p7zip' 'imagemagick')
source=("${pkgname}_v${pkgver}.zip::https://sourceforge.net/projects/${pkgname}/files/${pkgname}/${pkgname}_v${pkgver}/${pkgname}_v${pkgver}.zip/download")
sha256sums=('b6731c6c02b63315669f1ad28587052af39dff3e7aba9dd6bcb49a9667b075d1')

package() {
	cd "$srcdir/$pkgname"
	mkdir -p "$pkgdir/opt" \
		 "$pkgdir/usr/bin" \
		 "$pkgdir/usr/share/applications" \
		 "$pkgdir/usr/share/icons/hicolor/32x32/apps"

	cp -r "$srcdir/$pkgname" "$pkgdir/opt/"

	cat <<-END > "$pkgdir/usr/bin/$pkgname"
	#!/bin/bash
	conf_dir="\$HOME/.config/$pkgname"

	[ ! -d "\$conf_dir" ] && mkdir -p "\$conf_dir"
	[ ! -f "\$conf_dir/preferences.txt" ] && cp "/opt/subs2srs/preferences.txt" "\$conf_dir/"

	cd "\$conf_dir"
	exec mono /opt/subs2srs/subs2srs.exe
	END
	chmod 755 "$pkgdir/usr/bin/$pkgname"

	cat <<-END > "$pkgdir/usr/share/applications/$pkgname.desktop"
	[Desktop Entry]
	Name=$pkgname
	Comment=Convert movies and TV shows to flashcards
	GenericName=$pkgname
	Exec=$pkgname
	Icon=$pkgname
	Categories=Education;Languages;AudioVideo;Audio;Video;
	Terminal=false
	Type=Application
	StartupNotify=true
	Version=1.0
	END

	cat <<-END > "$pkgdir/usr/share/applications/subsretimer.desktop"
	[Desktop Entry]
	Name=Subs Re-Timer
	Comment=Re-time a subtitle file based on the timings of another subtitle file
	GenericName=Subs Re-Timer
	Exec=mono /opt/subs2srs/Utils/SubsReTimer/SubsReTimer.exe
	Icon=subsretimer
	Categories=Education;Languages;AudioVideo;Audio;Video;
	Terminal=false
	Type=Application
	StartupNotify=true
	Version=1.0
	END

	ln -sf /usr/bin/ffmpeg     "$pkgdir/opt/subs2srs/Utils/ffmpeg/ffmpeg.exe"
	ln -sf /usr/bin/mp3gain    "$pkgdir/opt/subs2srs/Utils/mp3gain/mp3gain.exe"
	ln -sf /usr/bin/mkvextract "$pkgdir/opt/subs2srs/Utils/mkvtoolnix/mkvextract.exe"
	ln -sf /usr/bin/mkvinfo    "$pkgdir/opt/subs2srs/Utils/mkvtoolnix/mkvinfo.exe"

	7z -y e "$pkgname.exe" '3.ico' -r 1>/dev/null
	convert '3.ico' "$pkgdir/usr/share/icons/hicolor/32x32/apps/$pkgname.png"
}
