# Maintainer: Gabriel Cavallo <gabrielcavallo@mail.com>

_name=libfm
pkgname=libfm-directory_thumbnails
pkgver=1.2.4
pkgrel=2
pkgdesc='Library for file management. Patched to allow directory thumbnails.'
depends=('menu-cache')
makedepends=('git' 'gtk-doc' 'libexif' 'intltool' 'vala')
provides=("$_name=$pkgver" "$_name-extra=$pkgver")
conflicts=("$_name=$pkgver" "$_name-extra=$pkgver")
url="https://github.com/lxde/$_name"
arch=('i686' 'x86_64')
license=('GPL2')
source=("git+https://github.com/lxde/$_name.git"
        "https://sourceforge.net/p/pcmanfm/bugs/1020/attachment/directory_thumbnails.patch"
        "https://github.com/tsujan/libfm/commit/49150d1f66e1be15ac9fdcb4416e4f0cd06a9dd3.patch")
sha256sums=('SKIP'
            '7065c345ae29762a6e3d75c6757b999c5d609a967f61522c15f6e85d8b4bc9ef'
            'b288c7ba468e954f67dddc05c8447e1c6192c08069d564fa40724781a1caa709')

prepare() {
	cd "$srcdir/$_name"
	patch -Np1 < "../directory_thumbnails.patch"
	patch -Np1 < "../49150d1f66e1be15ac9fdcb4416e4f0cd06a9dd3.patch"
}

build() {
	cd "$srcdir/$_name"
	./autogen.sh
	./configure --prefix=/usr \
		--sysconfdir=/etc \
		--without-gtk \
		--disable-gtk-doc \
		--disable-udisks \
		--enable-actions \

	# https://bugzilla.gnome.org/show_bug.cgi?id=656231
	sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

	make 
}

package() {
	cd "$srcdir/$_name"

	make DESTDIR="$pkgdir/" install

	# Temporary fix to FS#32361
	rm -rf "$pkgdir"/usr/include/libfm
	mv "$pkgdir"/usr/include/libfm-1.0/ "$pkgdir"/usr/include/libfm
}
