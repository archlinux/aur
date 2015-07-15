_pkgname=m3u8-segmenter
pkgname=${_pkgname}-git
pkgdesc="Apple HTTP Live Streaming Segmenter"
pkgver=20120803
pkgrel=1
arch=('i686' 'x86_64')
license=('GPL2')
url="http://m3u8-segmenter.inodes.org/"

makedepends=('git' 'pkgconfig')
depends=('ffmpeg')
provides=('m3u8-segmenter')

sha256sums=('e1e6cc6a7e55df1981ff5df1bd345221e657ed68ac12583553b951e454695d67')


_gitroot="git://github.com/johnf/m3u8-segmenter.git"
_gitname=$_pkgname


options=('!libtool')
build() {
	cd "$srcdir"
	msg "Performing source checkout..."
	if [ -d "$_gitname" ]; then
		cd "$_gitname"
		git pull origin || return 1
		cd ..
	else
		git clone "$_gitroot" || return 1
	fi
	msg "Source checkout finished."
	rm -rf "$_gitname-build"
	git clone "$_gitname" "$_gitname-build" || return 1
	cd "$_gitname-build"

    aclocal
    automake -ac
    autoconf
    ./configure --prefix=/usr
	make || return 1
}
package() {
	cd "$srcdir/$_gitname-build"
	make DESTDIR="$pkgdir" install || return 1
	install -Dm644 COPYING "$pkgdir/usr/share/licenses/$_pkgname/COPYING" || return 1
}
