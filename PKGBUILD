# Maintainer: Roman Titov <titovroman@gmail.com>

pkgname=pgmodeler
pkgver=0.8.1_alpha1
pkgrel=1
pkgdesc="PostgreSQL Database Modeler: an open source CASE tool for modeling PostgreSQL databases"

url="http://www.pgmodeler.com.br/"
license=('GPL3')

arch=('i686' 'x86_64')

depends=('qt5-base' 'qt5-svg' 'libxml2' 'libsm' 'libpqxx')
makedepends=('qt5-tools')
optdepends=('postgresql')

source=("https://github.com/$pkgname/$pkgname/archive/v${pkgver//_/-}.tar.gz"
		'pgmodeler'
        'pgmodeler-cli'
        'pgmodeler_logo.png'
        'pgmodeler_dbm.png'
        'pgmodeler.desktop')
sha1sums=('b84a198c8c60a936c2cf95c398ee5151d3c6d8b7'
          'f11a0b25b747ab0438d4a3fb47af2caa953e3997'
          '01eab1f1a3c0d163289e9b26855775cc5622acab'
          'c5bb090a1cbb784cd2ec9e1449cac02af2ba6538'
          '4c4e4260f4b2d2d4c154a8fb5cd7060a6585c83a'
          'b19e826b6fb64429df952780b8519100c65b8383')

install='pgmodeler.install'

build() {
	cd "$srcdir/$pkgname-${pkgver//_/-}"

        # Debug is needed to get the full dummy and xml2object plugins
	qmake CONFIG+=release pgmodeler.pro
 	make
}

package() {
	cd "$srcdir/$pkgname-${pkgver//_/-}"
 	make INSTALL_ROOT="${pkgdir}" install
	buildir="$srcdir/$pkgname-${pkgver//_/-}"

	msg2 "Creating required dirs"
	mkdir -p "$pkgdir"/{etc/$pkgname,usr/{bin,share/{applications,icons/hicolor/64x64/{apps,mimetypes},licenses/$pkgname,$pkgname}},opt/$pkgname}

	msg2 "Moving stuff in place"
	cp -R "$buildir"/conf/*.conf "$pkgdir/etc/$pkgname/"
	cp -R "$buildir"/conf/{schemas,defaults,dtd,example.dbm} "$pkgdir/usr/share/$pkgname/"
#	cp -R "$buildir"/* "$pkgdir/opt/$pkgname/" # What was this for ? we copy everything ?

	local fmp=''
	for fmp in schemas dtd;
	do
		ln -s "/usr/share/$pkgname/$fmp" "$pkgdir/etc/$pkgname/$fmp"
	done
	ln -s "/usr/share/$pkgname/example.dbm" "$pkgdir/etc/$pkgname/example.dbm"

	install -m755 "$srcdir/pgmodeler" "$pkgdir/usr/bin"
	install -m755 "$srcdir/pgmodeler-cli" "$pkgdir/usr/bin"
	install -m644 "$srcdir/pgmodeler_logo.png" "$pkgdir/usr/share/icons/hicolor/64x64/apps/pgmodeler.png"
	#install -m644 "$srcdir/pgmodeler_dbm.png" "$pkgdir/usr/share/icons/hicolor/64x64/mimetypes/TODO_REGISTER_MIME_ICON.png"
	install -m644 "$srcdir/pgmodeler.desktop" "$pkgdir/usr/share/applications"

	msg2 "Removing redundant files"
	rm -rf "$pkgdir/opt/$pkgname/"{conf,LICENSE,pgmodeler.vars}
}
