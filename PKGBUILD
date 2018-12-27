# Maintainer: Josef Miegl <josef@miegl.cz>
# Contributor: goll <adrian.goll+aur[at]gmail>
# Contributor: Kosava <kosava@gmail.com>

pkgname=butt
pkgver=0.1.17
pkgrel=1
pkgdesc="butt (broadcast using this tool) is an easy to use, multi OS streaming tool"
arch=('i686' 'x86_64' 'armv7h')
license=('GPL2')
url="http://butt.sourceforge.net/"
depends=('fltk' 'libpng12' 'portaudio' 'libfdk-aac' 'libvorbis' 'libogg' 'lame' 'flac' 'opus' 'libsamplerate')
optdepends=('icecast')
source=("http://sourceforge.net/projects/$pkgname/files/$pkgname/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('afe9596b1d9ef38d2fde1f3255e5a3a12b206c73c8e6601e37cccb07e67ae33d')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install

	# Desktop file
	install -D -m644 "usr/share/applications/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"

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
