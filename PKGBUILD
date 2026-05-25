# Maintainer: Alexander Bocken <alexander@bocken.org>

pkgname=brouter
pkgver=1.7.9
pkgrel=1
pkgdesc="Offline-capable OSM bike/foot routing engine with elevation-aware profiles (routing server)"
arch=('any')
url="https://github.com/abrensch/brouter"
license=('MIT')
depends=('java-runtime-headless')
backup=('etc/conf.d/brouter')
install="$pkgname.install"
source=("$pkgname-$pkgver.zip::https://github.com/abrensch/brouter/releases/download/v$pkgver/brouter-$pkgver.zip"
        "LICENSE-$pkgver::https://raw.githubusercontent.com/abrensch/brouter/v$pkgver/LICENSE"
        'brouter.service'
        'brouter.conf'
        'brouter.sysusers'
        'brouter.tmpfiles')
sha256sums=('5f8ea4acc72d791589cbd7453c472df12ab955e2ad42e6ac84339ed883ce7987'
            '73408906d3e5226b76a3649051221c7faadb076fac25013feb600821b923f05e'
            '010b99a52ef8e9ee552b6d40d45ca2ea9dab0b796de10193cc3aafa2f878cdc8'
            'fd651cc0395f174e061dbe9ce010ae6132e91ebad3f36c521f5f9d48c7a791dd'
            '4846c6f3d7122823623de3d5d078928ce5e1b156f3f1b4d7e6730ee1b8af2541'
            '5b3abbcf2ad4012ad3ce4b8312ac9c15532985a5b90f71dbfbc9a030433bb411')

package() {
	# Server jar: the shaded "-all" jar bundles every runtime dependency. Its
	# manifest Main-Class is the CLI router, so the service runs the server class
	# (btools.server.RouteServer) off the classpath explicitly.
	install -Dm644 "$srcdir/brouter-$pkgver/brouter-$pkgver-all.jar" \
		"$pkgdir/usr/share/java/$pkgname/brouter.jar"

	# Bundled routing profiles + tag-lookup table (read-only, package-owned).
	install -d "$pkgdir/usr/share/$pkgname/profiles2"
	install -m644 "$srcdir/brouter-$pkgver"/profiles2/*.brf \
		"$srcdir/brouter-$pkgver/profiles2/lookups.dat" \
		"$pkgdir/usr/share/$pkgname/profiles2/"

	# Service, config, system user + state dirs.
	install -Dm644 "$srcdir/brouter.service"   "$pkgdir/usr/lib/systemd/system/brouter.service"
	install -Dm644 "$srcdir/brouter.conf"      "$pkgdir/etc/conf.d/brouter"
	install -Dm644 "$srcdir/brouter.sysusers"  "$pkgdir/usr/lib/sysusers.d/brouter.conf"
	install -Dm644 "$srcdir/brouter.tmpfiles"  "$pkgdir/usr/lib/tmpfiles.d/brouter.conf"

	install -Dm644 "$srcdir/LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
