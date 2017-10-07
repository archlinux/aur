# Maintainer: Gabriel Cavallo <gabrielcavallo@mail.com>

pkgname=libfm-directory_thumbnails
pkgver=1.2.5
pkgrel=1
pkgdesc='Library for file management. Patched to allow directory thumbnails.'
depends=('gtk2' 'libexif' "libfm-extra=$pkgver" 'menu-cache')
makedepends=('gtk-doc' 'intltool' 'vala')
provides=("libfm=$pkgver")
conflicts=("libfm=$pkgver")
url='https://sourceforge.net/projects/pcmanfm/'
arch=('i686' 'x86_64')
license=('GPL2')
source=("https://downloads.sourceforge.net/pcmanfm/libfm-$pkgver.tar.xz"
        'https://sourceforge.net/p/pcmanfm/bugs/1020/attachment/directory_thumbnails.patch'
        "https://github.com/tsujan/libfm/commit/49150d1f66e1be15ac9fdcb4416e4f0cd06a9dd3.patch")
sha256sums=('c706bb1020cf5f2d6f5a9226f692ce1985947134dcf2bde64278bd0420779b5a'
            '7065c345ae29762a6e3d75c6757b999c5d609a967f61522c15f6e85d8b4bc9ef'
            '531a17d3673149b48622221fff997e1dd1d9eeea604902207ce95e8bcfee679d')

prepare() {
	cd "$srcdir/libfm-$pkgver"
	patch -Np1 < '../directory_thumbnails.patch'
	patch -Np1 < "../49150d1f66e1be15ac9fdcb4416e4f0cd06a9dd3.patch"
}

build() {
	cd "$srcdir/libfm-$pkgver"
	./configure --prefix=/usr \
		--sysconfdir=/etc \
		--enable-actions \
		--enable-gtk-doc \
		--with-gnu-ld

	# https://bugzilla.gnome.org/show_bug.cgi?id=656231
	sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

	make 
}

package() {
	cd "$srcdir/libfm-$pkgver"

	make DESTDIR="$pkgdir/" install

	# Temporary fix to FS#32361
	rm -rf "$pkgdir"/usr/include/libfm
	mv "$pkgdir"/usr/include/libfm-1.0/ "$pkgdir"/usr/include/libfm

	# libfm-extra
	rm -rf "$pkgdir"/usr/include/libfm/fm-{extra,version,xml-file}.h \
	       "$pkgdir"/usr/lib/libfm-extra.* \
	       "$pkgdir"/usr/lib/pkgconfig/libfm-extra.pc

	# libfm-gtk2
	rm -rf "$pkgdir"/usr/bin \
	       "$pkgdir"/usr/lib/libfm-gtk.* \
	       "$pkgdir"/usr/lib/libfm/modules/gtk-* \
	       "$pkgdir"/usr/lib/pkgconfig/libfm-gtk.pc \
	       "$pkgdir"/usr/share/applications \
	       "$pkgdir"/usr/share/man
}
