# Maintainer: Maarten de Vries <maarten@de-vri.es>
pkgbase=ensenso-sdk
pkgname=(ensenso-sdk ensenso-sdk-doc)
pkgdesc="Ensenso SDK and tools"
pkgver=3.0.311
pkgrel=2
arch=(x86_64)
license=(custom)
url='http://ensenso.com'
depends=('glibc' 'glu' 'libsm')
optdepends=(
	'ueyed: for capturing from live cameras'
	'qt4: for included GUI tools'
)

source=(
	"$pkgname-$pkgver.tar.bz2::https://download.ensenso.com/s/ensensosdk/download?files=ensenso-sdk-$pkgver-x64.tar.bz2"
)

sha512sums=('0a7f5cdf12d4b48e86caef2bd66ec7cbe3c018af57783ed45e25aee6c315763a765abba9e8c48dd8c54a8646ea4c2175c57dbdb6b9d00b435963350b3112439d')

# Stripping results in a segfaulting NxView somehow.
options=(!strip)

package_ensenso-sdk() {
	local dir="$srcdir/ensenso-sdk-$pkgver-x64-262641c"

	install -Dd "$pkgdir/usr"
	install -Dd "$pkgdir/usr/bin"
	install -Dd "$pkgdir/usr/include"
	install -Dd "$pkgdir/usr/share/doc"
	install -Dd "$pkgdir/usr/share/licenses/$pkgname"

	cp -a "$dir/usr/lib" "$pkgdir/usr/"
	cp -a "$dir/opt" "$pkgdir/"

	rm -r "$pkgdir/opt/ensenso/lib"
	rm -r "$pkgdir/opt/ensenso/manual"

	ln -s "/opt/ensenso/development/c/include" "$pkgdir/usr/include/ensenso"

	ln -s "/opt/ensenso/bin/NxView"     "$pkgdir/usr/bin/nxView"
	ln -s "/opt/ensenso/bin/NxCalTab"   "$pkgdir/usr/bin/nxCalTab"
	ln -s "/opt/ensenso/bin/NxProfiler" "$pkgdir/usr/bin/nxProfiler"
	ln -s "/opt/ensenso/bin/NxTreeEdit" "$pkgdir/usr/bin/nxTreeEdit"

	install -D "$dir/opt/ensenso/eula.txt" "$pkgdir/usr/share/licenses/$pkgname/eula.txt"
	install -D "$dir/Readme"               "$pkgdir/opt/ensenso/"
}

package_ensenso-sdk-doc() {
	local dir="$srcdir/ensenso-sdk-$pkgver-x64-262641c"
	install -Dd "$pkgdir/usr/share/doc"
	install -Dd "$pkgdir/opt/ensenso"

	cp -a "$dir/opt/ensenso/manual" "$pkgdir/opt/ensenso/manual"
	ln -s "/opt/ensenso/manual/html" "$pkgdir/usr/share/doc/$pkgname"
}
