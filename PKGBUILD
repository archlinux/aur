# Maintainer: Guillaume Hayot <ghayot@postblue.info>
pkgname=parlatype
pkgver=1.5.3
pkgrel=2
pkgdesc="GNOME audio player for transcription"
arch=('any')
url="https://gkarsay.github.io/parlatype/"
license=('GPL')
depends=('gtk3' 'gst-plugins-base' 'gst-plugins-good')
makedepends=('libreoffice' 'yelp-tools' 'intltool' 'gobject-introspection')
# makedepends=('libreoffice' 'yelp-tools' 'intltool' 'gobject-introspection' 'glade' 'gtk-doc')
optdepends=('libreoffice: LibreOffice macros' 'gst-plugins-ugly: Play MP3 files')
source=("https://github.com/gkarsay/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('584a739770e85dd91249fbb716aafdf490b325e2eea393857af80a16f7080fd4')

prepare() {
	cd "$pkgname-$pkgver"
}

build() {
	cd "$pkgname-$pkgver"
	autoreconf
	# Parlatype ships its own library, libparlatype.
	# Developers might be interested in having a library documentation, gobject introspection
	# and a glade catalog for the widgets.
	# These are the configure options:
	# --with-libreoffice: install LibreOffice macros (default: yes)
	# --enable-introspection: install gobject introspection (default: yes)
	# --enable-tests: build unit tests (default: yes)
	# --enable-gtk-doc: install library documentation (default: no)
	# --enable-glade-catalog: install a glade catalog (default: no)
	# --enable-code-coverage: enable gcov/lcov code coverage (default: no)
	# If you want the program only, you would use --prefix=/usr --disable-introspection.
	./configure --prefix=/usr --disable-introspection --disable-tests
	make
}

check() {
	cd "$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
