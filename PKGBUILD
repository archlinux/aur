_srcname=lms
_srcver=8.0.0
_srcrel=7

pkgname=intel-$_srcname
pkgver=$_srcver.$_srcrel
pkgrel=1
pkgdesc="Intel Local Manageability Service"
arch=('i686' 'x86_64')
url="https://software.intel.com/en-us/articles/download-the-latest-intel-amt-open-source-drivers/"
license=('BSD')
depends=('gcc-libs')
source=("https://software.intel.com/sites/default/files/$_srcname-$_srcver-$_srcrel.tar.gz"
        "$pkgname.service"
        'gcc-47.patch')
md5sums=('3cbd027a0e6e9ced8238478b24cde3c6'
         'd344fa672b31ce6e065ef46d4dabac60'
         'a6e645b4abe32bfd7206c246a6b9ae83')

prepare() {
	cd "$_srcname-$_srcver-$_srcrel"
	patch -p1 < "$srcdir"/gcc-47.patch
}

build() {
	cd "$_srcname-$_srcver-$_srcrel"
	./configure --prefix=/usr \
	            --sbindir=/usr/bin
	make
}

package() {
	cd "$_srcname-$_srcver-$_srcrel"
	make DESTDIR="$pkgdir/" install

	# Replace default sysvinit script with a systemd unit
	rm -r "$pkgdir/etc"
	install -D -m644 {"$srcdir","$pkgdir/"usr/lib/systemd/system}/$pkgname.service

	install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim: set ft=sh ts=4 sw=4 noet:
