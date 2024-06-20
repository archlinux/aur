# Maintainer: Ren Tatsumoto <tatsu at autistici dot org>
# Contributor: darkgrin <darkgrin at yahoo dot com>
pkgname=subs2srs
pkgver=29.7
pkgrel=8
pkgdesc="A small utility that allows you to create Anki (flash card software) import files based on your favorite foreign language movies and TV shows to aid in the language learning process."
arch=('any')
url="http://subs2srs.sourceforge.net/"
license=('GPL')
depends=('mono' 'ffmpeg' 'mp3gain' 'mkvtoolnix-cli')
optdepends=('anki' 'noto-fonts-cjk: display japanese characters')
makedepends=('p7zip' 'icoutils')
source=("${pkgname}_v${pkgver}.zip::https://github.com/nihil-admirari/${pkgname}-net48-builds/releases/download/2023-02-23-13-35/subs2srs_v${pkgver}.zip"
        "${pkgname}.sh"
        "${pkgname}.desktop"
        "subsretimer.desktop"
        "90-avoid-microsoft-sans-serif.conf")
sha256sums=('70b71f73b26e35cf0d202522656142432d75287a0910907d8f023271cd5f200b'
            'e47c9f7e1216230fecf316591b182a8fe65b13f4781564accfdae2911098425c'
            '3b66602d3be448b2305f3bb8908f2f8ee814fd40e1594c74520a383d79d69175'
            '9fb5d61ad017cecd536b6d1ab76ad8e4488f82a34b28306aadce9ff0ccb9735c'
            '763763709426ae8a0969616f06c7fda557b9324883a3c84c42d9d9431d8569f9')

package() {
	cd -- "$srcdir/$pkgname"

	# create directories
	mkdir -p "$pkgdir/opt" \
		 "$pkgdir/usr/bin" \
		 "$pkgdir/usr/share/applications" \
		 "$pkgdir/usr/share/licenses/$pkgname" \
		 "$pkgdir/etc/fonts/conf."{avail,d}

	# install the bulk of the app to /opt.
	cp -r -- "$srcdir/$pkgname" "$pkgdir/opt/"

	# create a shortcut in /bin
	install -Dm755 "$srcdir/${pkgname}.sh" "$pkgdir/usr/bin/$pkgname"

	# create .desktop files
	install -Dm644 "$srcdir/${pkgname}.desktop" "$pkgdir/usr/share/applications/${pkgname}.desktop"
	install -Dm644 "$srcdir/subsretimer.desktop" "$pkgdir/usr/share/applications/subsretimer.desktop"

	# link to the correct system executables
	ln -sf /usr/bin/ffmpeg     "$pkgdir/opt/subs2srs/Utils/ffmpeg/ffmpeg.exe"
	ln -sf /usr/bin/mp3gain    "$pkgdir/opt/subs2srs/Utils/mp3gain/mp3gain.exe"
	ln -sf /usr/bin/mkvextract "$pkgdir/opt/subs2srs/Utils/mkvtoolnix/mkvextract.exe"
	ln -sf /usr/bin/mkvinfo    "$pkgdir/opt/subs2srs/Utils/mkvtoolnix/mkvinfo.exe"

	# install app icons
	7z -y e "$pkgname.exe" '3.ico' '4.ico' -r 1>/dev/null
	icotool -x '3.ico' '4.ico'
	for size in 16 32; do
		install -Dm644 \
		./?"_1_${size}x${size}x24.png" \
		"$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/$pkgname.png"
	done

	7z -y e 'Utils/SubsReTimer/SubsReTimer.exe' '*.ico' -r 1>/dev/null
	icotool -x ./*.ico
	for size in 16 32 48; do
		install -Dm644 \
		./?"_1_${size}x${size}x32.png" \
		"$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/subsretimer.png"
	done

	rm -- ./*.ico ./*.png

	# install the license file
	mv -- "$pkgdir/opt/subs2srs/gpl.txt" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"

	# fix fonts
	font_conf="90-avoid-microsoft-sans-serif.conf"
	avail_dir="/usr/share/fontconfig/conf.avail/"
	d_dir="/etc/fonts/conf.d/"
	install -Dm644 "$srcdir/$font_conf" "$pkgdir/$avail_dir/$font_conf"
	ln -s -- "$(readlink -m -- "/$avail_dir/$font_conf")" "$pkgdir/$d_dir/$font_conf"
}
