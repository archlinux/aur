# Maintainer: Josef Miegl <josef@miegl.cz>
# Contributor: goll <adrian.goll+aur[at]gmail>
# Contributor: Kosava <kosava@gmail.com>

pkgname=butt
pkgver=0.1.16
pkgrel=3
pkgdesc="butt (broadcast using this tool) is an easy to use, multi OS streaming tool"
arch=('i686' 'x86_64')
license=('GPL2')
url="http://butt.sourceforge.net/"
depends=('fltk' 'libpng12' 'portaudio' 'libfdk-aac' 'libvorbis' 'libogg' 'lame' 'flac' 'opus' 'libsamplerate')
optdepends=('icecast')
source=("http://sourceforge.net/projects/$pkgname/files/$pkgname/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz"
        "butt-gcc6.patch")
sha256sums=('50feef4fe051484a2eb897b0175cf5f7b3f94f395c34c84d917b1a41c6fb6897'
            'a420be932c97ee949c18428230d8f3a1aabada07c06cd8109757aef68910b5ab')

prepare() {
	cd "$pkgname-$pkgver"
	patch -Np1 -i "$srcdir/butt-gcc6.patch"
}


build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install

	# Desktop file
	# Category "Sound" is invalid, replace it with "AudioVideo;Audio"
	desktop-file-install --remove-category="Sound" --add-category="AudioVideo;Audio" --dir="$pkgdir/usr/share/applications" "icons/$pkgname.desktop"

	# Icons
	for size in 16 22 24 32 48 64 96 128 256 512; do
		format="${size}x${size}"
		install -D -m644 "icons/icon_${format}.png" "$pkgdir/usr/share/icons/hicolor/${format}/apps/$pkgname.png"
	done

	install -D -m644 "icons/icon_scalable.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"

	# Documentation
	for doc in AUTHORS ChangeLog KNOWN_BUGS NEWS README THANKS; do
		install -D -m644 "${doc}" "$pkgdir/usr/share/doc/$pkgname/${doc}"
	done

	# Pixmaps
	for file in usr/share/pixmaps/"$pkgname"*; do
		filename=`basename "${file}"`
		install -D -m644 "${file}" "$pkgdir/usr/share/pixmaps/${filename}"
	done
}
