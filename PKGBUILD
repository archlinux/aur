pkgname=halcyon
pkgver=0.9.31.6242
pkgrel=2
pkgdesc="InWorldz Halcyon 3d virtual reality world simulator"
arch=(any)
url="https://github.com/InWorldz/$pkgname"
license=("BSD")
depends=(mariadb mono sqlite whip-server)
makedepends=(doxygen graphviz)
provides=(opensimulator)
install=$pkgname.install
source=("https://github.com/InWorldz/$pkgname/archive/v$pkgver.tar.gz"
"$pkgname.sh"
"hc-database.sh"
"$pkgname.service")
md5sums=('17c080db2d3104e92d433cacc10a964f'
         '86977d028c882ee1e9615f4b8d1a68e6'
         'ee63724ab4ed7ba836ea6205689b0029'
         '5dc2dbf0f37060b7d921c7cf8f322abd')

build() {
	cd $pkgname-$pkgver
	./runprebuild.sh
	xbuild Halcyon.sln
	doxygen doc/doxygen.conf
}

package() {
	install -Dm644 $pkgname.service "$pkgdir/usr/lib/systemd/system/$pkgname.service"
	install -Dm755 $pkgname.sh "$pkgdir/usr/bin/$pkgname"
	install -m755 hc-database.sh "$pkgdir/usr/bin/hc-database"
	cd $pkgname-$pkgver
	mkdir -p "$pkgdir/srv/inworldz"
	cp -r bin/* "$pkgdir/srv/inworldz/"
	chmod -R 644 "$pkgdir/srv/inworldz"
	mkdir -p "$pkgdir/usr/share/$pkgname"
	cp -r share/* "$pkgdir/usr/share/$pkgname/"
	chmod -R 644 "$pkgdir/usr/share/$pkgname"
	mkdir -p "$pkgdir/usr/share/doc/$pkgname/bot LSL Functions"
	mkdir -p "$pkgdir/usr/share/doc/$pkgname/html"
	cp -r "doc/bot LSL Functions/"* "$pkgdir/usr/share/doc/$pkgname/bot LSL Functions/"
	cp -r html/* "$pkgdir/usr/share/doc/$pkgname/html/"
	chmod -R 644 "$pkgdir/usr/share/doc/$pkgname"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	cd "$pkgdir/srv/inworldz"
	rm PhysX3*.dll
	rm Prebuild.exe
	rm aperture.example.cfg
	rm aperture.exe
	rm cg*.dll
	rm cudart64_32_16.dll
	rm glut32.dll
	rm libapr*.dll
	rm libbulletnet.dll
	rm libcurl.dll
	rm libdb44d.dll
	rm libeay32.dll
	rm *.dylib
	rm *.so.*
	rm libssh2.dll
	rm msvc*.dll
	rm openjpeg*.dll
	rm sqlite3.dll
	rm sqlite3.dll.version.txt
	rm ssleay32.dll
	rm zlib1.dll
}

# vim:set ts=2 sw=2 et:
