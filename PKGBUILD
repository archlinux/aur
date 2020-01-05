# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
# Contributor: Matthew McGinn <mamcgi@gmail.com>
_pkgname='wxtoimg'
pkgname="$_pkgname-beta"
pkgver='2.11.2'
pkgrel='5'
pkgdesc='Software to decode APT and WEFAX signals from weather satellites'
arch=('x86_64' 'i686' 'armv6h' 'armv7h')
url='https://wxtoimgrestored.xyz/beta'
license=('custom')
depends=('alsa-lib' 'fontconfig' 'libx11' 'libxft')
provides=("$_pkgname")
conflicts=("$_pkgname")
source_x86_64=("$pkgname-$pkgver-$pkgrel-x86_64.deb::$url/$_pkgname-amd64-$pkgver-beta.deb")
source_i686=("$pkgname-$pkgver-$pkgrel-i686.deb::$url/$_pkgname-i386-$pkgver-beta.deb")
source_armv6h=("$pkgname-$pkgver-$pkgrel-armv6h.deb::$url/$_pkgname-armhf-$pkgver-beta.deb")
source_armv7h=("$pkgname-$pkgver-$pkgrel-armv7h.deb::$url/$_pkgname-armhf-$pkgver-beta.deb")
source=(
	"$_pkgname.png"
	'LICENSE'
)
sha256sums=('2eab4bf8debaea35825f07f7adfd6ba69b24c0423c66bdf0718e16600e68857d'
            '62fc6a77bcc0a193c5dda7f0c69dcde991b410f8ddc1536597f0307be552473d')
sha256sums_x86_64=('8ecd1b573563f40515b3e173138b7798cd25c70eb8edb82b07295d1c4021b5fb')
sha256sums_i686=('7e6328cac681b48140ad52c6ddf01568a1441e5be5c1d44f87ffd99889371134')
sha256sums_armv6h=('0be5c72dd17b58d2e428e0cd6af89bd75faea8e592bbac2b23cc826990c1878c')
sha256sums_armv7h=('0be5c72dd17b58d2e428e0cd6af89bd75faea8e592bbac2b23cc826990c1878c')

_sourcedirectory="$pkgname-$pkgver-$pkgrel"

prepare() {
	cd "$srcdir/"
	mkdir "$_sourcedirectory/"
	tar -xzf 'data.tar.gz' -C "$_sourcedirectory/"
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	# Binaries & main man pages
	for binary in 'wxbatch' 'wxmap' 'wxproj' 'wxrec' "$_pkgname"; do
		install -Dm755 "usr/local/bin/$binary" "$pkgdir/usr/bin/$binary"
		install -Dm644 "usr/local/man/man1/$binary.1" "$pkgdir/usr/share/man/man1/$binary.1"
	done
	ln -sf "/usr/bin/$_pkgname" "$pkgdir/usr/bin/x$_pkgname"

	# Lib folder & translated man pages
	lib_directory='usr/lib/wx'

	install -dm755 "$pkgdir/$lib_directory/"
	cp -r --no-preserve=ownership --preserve=mode 'usr/local/lib/wx/'* "$pkgdir/$lib_directory/"

	install -dm755 "$pkgdir/usr/local/lib/"
	ln -sf "/$lib_directory" "$pkgdir/usr/local/lib/wx"

	for language in 'de' 'es' 'fr' 'ja' 'pl'; do
		install -dm755 "$pkgdir/usr/share/man/$language/man1/"
		for manpage in 'wxcalibrate' 'wxfaq' 'wxrego' "x$_pkgname"; do
			ln -sf "/$lib_directory/man/${language}_$manpage.1" "$pkgdir/usr/share/man/$language/man1/$manpage.1"
		done
	done

	# LICENSE, desktop file, icon
	install -Dm644 '../LICENSE' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 "etc/X11/applnk/Applications/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
	sed -E -i -e "s|Exec=/usr/local/bin/x$_pkgname|Exec=x$_pkgname|" -e "s|Icon=/usr/share/icons/$_pkgname.xbm|Icon=$_pkgname|" "$pkgdir/usr/share/applications/$_pkgname.desktop"
	install -Dm644 "../$_pkgname.png" "$pkgdir/usr/share/pixmaps/$_pkgname.png"
}
