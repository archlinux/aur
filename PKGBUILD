# Maintainer: Marc Cousin (cousinmarc at gmail dot com)

pkgname=pgmodeler
pkgver=0.9.2_alpha1
pkgrel=1
epoch=2
pkgdesc="PostgreSQL Database Modeler: an open source CASE tool for modeling PostgreSQL databases"

url="https://pgmodeler.io/"
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
        'pgmodeler.desktop'
	'patch_no_check_update.diff')
sha1sums=('b64b3e15052d3142775bdad132a3ea59193f1444'
          'dcdc83e561355b5e456d693d7fe52c4e68ffae2a'
          '8d5edba1b839a61afdc78c4b10df2b92158f4215'
          'c5bb090a1cbb784cd2ec9e1449cac02af2ba6538'
          '4c4e4260f4b2d2d4c154a8fb5cd7060a6585c83a'
          'b19e826b6fb64429df952780b8519100c65b8383'
          '448e756999f5770680eb039f590dd61eb6225b34')
install='pgmodeler.install'

build() {
	cd "$srcdir/$pkgname-${pkgver//_/-}"
	patch -p1 < ../patch_no_check_update.diff

        # release is needed to get the full dummy and xml2object plugins
	#qmake CONFIG+=release pgmodeler.pro
	qmake pgmodeler.pro
 	make || true
	# Temporary ugly fix for https://bugreports.qt.io/browse/QTBUG-65251
	cd libpgmodeler_ui/src
	for i in *.h
	do
		sed -i 's/setShortcut(QLatin1String/setShortcut(QKeySequence/' $i
	done
	cd -
	make

}

package() {
	cd "$srcdir/$pkgname-${pkgver//_/-}"
 	make INSTALL_ROOT="${pkgdir}" install
	buildir="$srcdir/$pkgname-${pkgver//_/-}"

	msg2 "Creating required dirs"
	mkdir -p "$pkgdir"/{etc/$pkgname,usr/{bin,share/{applications,icons/hicolor/64x64/{apps,mimetypes},licenses/$pkgname,$pkgname}}}

	msg2 "Moving stuff in place"
	# To be removed after 0.9-beta
	find $buildir -name connections.conf -exec sed -i 's/connect-timeout/connection-timeout/g' {} \;

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
	# Create an empty plugin directory to get rid of error during startup
	mkdir -p "$pkgdir/usr/local/lib/pgmodeler/plugins/"

#	msg2 "Removing redundant files"
#	rm -rf "$pkgdir/opt/$pkgname/"{conf,LICENSE,pgmodeler.vars}
}
