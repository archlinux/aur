# Maintainer: Gabriel Cavallo <gabrielcavallo@mail.com>

_name=libfm
pkgname=libfm-directory_thumbnails
pkgver=1.2.4
pkgrel=1
pkgdesc='Library for file management. Patched to allow directory thumbnails'
depends=('dbus-glib' 'libexif' 'menu-cache' 'shared-mime-info' "libfm-extra=$pkgver")
makedepends=('udisks' 'intltool' 'gtk-doc')
optdepends=('pcmanfm-covers: Directory thumbnailer for PCManFM (gtk2/3 and qt)')
provides=("libfm=$pkgver")
conflicts=("libfm=$pkgver")
url='http://pcmanfm.sourceforge.net/'
arch=('i686' 'x86_64')
license=('GPL')
source=("https://downloads.sourceforge.net/pcmanfm/libfm-$pkgver.tar.xz"
        "https://sourceforge.net/p/pcmanfm/bugs/1020/attachment/directory_thumbnails.patch")
sha256sums=('7804f6f28cb3d1bc8ffb3151ab7ff0c063b27c5f9b06c682eb903e01cf25502f'
            '7065c345ae29762a6e3d75c6757b999c5d609a967f61522c15f6e85d8b4bc9ef')

prepare() {
	cd "$srcdir/$_name-$pkgver"
	patch -Np1 < "../directory_thumbnails.patch"
}

build() {
	cd "$srcdir/$_name-$pkgver"
	./configure --prefix=/usr \
		--sysconfdir=/etc \
		--enable-udisks \
		--enable-gtk-doc \
		--with-gnu-ld

	# https://bugzilla.gnome.org/show_bug.cgi?id=656231
	sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

	make 
}

package() {
	cd "$srcdir/$_name-$pkgver"

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
