# Maintainer: Maarten de Vries <maarten@de-vri.es>
pkgname=ensenso-sdk
pkgdesc="Ensenso SDK and tools"
pkgver=2.0.147
pkgrel=1
arch=(x86_64)
license=(custom)
url='http://ensenso.com'
depends=('glibc' 'glu' 'libsm' 'codemeter-runtime')
optdepends=('ueyed: for capturing from live cameras')
install="$pkgname.install"

# Libraries are encrypted, strip seems to break them :/
options=('!strip')

source=(
	"$pkgname-$pkgver.tar.bz2::https://download.ensenso.com/s/ensensosdk/download?files=ensenso-sdk-$pkgver-x64.tar.bz2"
)

sha512sums=('b260785514850ed59609af3f3bc88747f86cbb47c9d6446d357fadf64e30ceab89bee5c3202a11cbe3bc97580fdf11d09e589880f3a60f53c3512944fd5e3018')

_install_dir() {
	local source_dir="$1"
	local target_dir="$2"
	local mode="$3"

	for file in $(find "$source_dir" -type f); do
		install -m "$mode" -D "$file" "$target_dir/${file#${source_dir}/}"
	done
}

package() {
	local dir="$srcdir/ensenso-sdk-$pkgver-x64-b05786e"

	_install_dir  "$dir/usr/lib"                            "$pkgdir/usr/lib"                      755
	_install_dir  "$dir/usr/bin"                            "$pkgdir/usr/bin"                      755
	_install_dir  "$dir/opt/ensenso/manual/html"            "$pkgdir/usr/share/doc/$pkgname"       644
	_install_dir  "$dir/opt/ensenso/development/c/include"  "$pkgdir/usr/include/ensenso"          644
	_install_dir  "$dir/opt/ensenso/development/examples"   "$pkgdir/usr/share/$pkgname/examples"  644
	_install_dir  "$dir/opt/ensenso/development/halcon"     "$pkgdir/usr/share/$pkgname/halcon"    644
	_install_dir  "$dir/opt/ensenso/license"                "$pkgdir/usr/share/$pkgname/license"   644

	install -D "$dir/opt/ensenso/eula.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -D "$dir/Readme"               "$pkgdir/usr/share/doc/ensenso/README"
}
