# Maintainer: Maarten de Vries <maarten@de-vri.es>
pkgname=ensenso-sdk
pkgdesc="Ensenso SDK and tools"
pkgver=2.3.1536
pkgrel=1
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

sha512sums=('dcce023ec35dc1502a6557a1d8c08b7d40d7a7ddf3b9b48e48e2582a4e5a79da057addfc195e743a341955b63d0626e3108101e9e2e75d1ea941b8581b8f4fb1')

# Stripping results in a segfaulting NxView somehow.
options=(!strip)

_install_dir() {
	local source_dir="$1"
	local target_dir="$2"
	local mode="$3"

	for file in $(find "$source_dir" -type f); do
		install -m "$mode" -D "$file" "$target_dir/${file#${source_dir}/}"
	done
}

package() {
	local dir="$srcdir/ensenso-sdk-$pkgver-x64-c01d55d"

	_install_dir  "$dir/usr/lib"                            "$pkgdir/usr/lib"                      755
	_install_dir  "$dir/opt/ensenso/bin"                    "$pkgdir/usr/bin"                      755
	_install_dir  "$dir/opt/ensenso/manual/html"            "$pkgdir/usr/share/doc/$pkgname"       644
	_install_dir  "$dir/opt/ensenso/development/c/include"  "$pkgdir/usr/include/ensenso"          644
	_install_dir  "$dir/opt/ensenso/development/examples"   "$pkgdir/usr/share/$pkgname/examples"  644
	_install_dir  "$dir/opt/ensenso/development/halcon"     "$pkgdir/usr/share/$pkgname/halcon"    644

	ln -s "NxView"     "$pkgdir/usr/bin/nxView"
	ln -s "NxCalTab"   "$pkgdir/usr/bin/nxCalTab"
	ln -s "NxProfiler" "$pkgdir/usr/bin/nxProfiler"
	ln -s "NxTreeEdit" "$pkgdir/usr/bin/nxTreeEdit"

	install -D "$dir/opt/ensenso/eula.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -D "$dir/Readme"               "$pkgdir/usr/share/doc/ensenso/README"
}
