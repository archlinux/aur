# Maintainer graysky <graysky AT archlnux.us>
pkgname=athcool
pkgver=0.3.12
pkgrel=7
pkgdesc="Enables powersaving mode on AMD Duron/Athlon/Athlon XP processors."
url="http://members.jcom.home.ne.jp/jacobi/linux/softwares.html#athcool"
license='GPL'
arch=('i686')
source=("http://members.jcom.home.ne.jp/jacobi/linux/files/$pkgname-$pkgver.tar.gz"
'non-verbose.patch'
"$pkgname.service")
sha256sums=('8a80654cb616064d60e6188fe6d426fe104a439930fceab865930bf1c9ffbbc9'
'ba239c3887502ee7986de6a1707c48cbc772053401dc6c287b9c37aee06e24e5'
'fa80fd0c1b52c0103bc3581969d328734cf19ae509e81cbd6aa3e6d7d4283bab')

prepare() {
	cd "$pkgname-$pkgver"

	# suppress superfluous warning on start/stop
	patch -i "$srcdir/non-verbose.patch"

	# move binaries to /usr/bin and fix build
	sed -i -e '/sbindir    =/ s,\/sbin,/\bin,' \
		-i -e '/LIBS	=/ s,-lpci,-lpci -lz,' Makefile
}

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
	install -Dm644 "$srcdir"/$pkgname.service "$pkgdir/usr/lib/systemd/system/$pkgname.service"
}
