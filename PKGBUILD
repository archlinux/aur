# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Joel Goguen <contact+aur@jgoguen.ca>
# Contributor: Jordan Klassen <forivall@gmail.com>
_pkgname='flow'
pkgname="$_pkgname-bin"
pkgver='0.277.1'
pkgrel='1'
pkgdesc='A static type checker for JavaScript - binary version'
arch=('x86_64' 'aarch64')
url="https://$_pkgname.org"
license=('MIT')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source_x86_64=(
	"$pkgname-$pkgver-x86_64.zip::https://github.com/facebook/$_pkgname/releases/download/v$pkgver/$_pkgname-linux64-v$pkgver.zip"
	"$pkgname-$pkgver-parser-x86_64.zip::https://github.com/facebook/$_pkgname/releases/download/v$pkgver/lib${_pkgname}parser-linux64-v$pkgver.zip"
)
source_aarch64=(
	"$pkgname-$pkgver-aarch64.zip::https://github.com/facebook/$_pkgname/releases/download/v$pkgver/$_pkgname-linux-arm64-v$pkgver.zip"
)
source=(
	"$pkgname-$pkgver-bash-completion::https://github.com/facebook/$_pkgname/raw/v$pkgver/resources/shell/bash-completion"
	"$pkgname-$pkgver-LICENSE::https://github.com/facebook/$_pkgname/raw/v$pkgver/LICENSE"
)
b2sums=('31a3133c70ea57e8fd8025add5701b9be627020d4f82655e7911853b33e3197eb53893fd119348112839d877a8d668aedfa15c7bb214de8f573b8453f69c4cc3'
        '20291e21101540292f47589798cc1264fd5fc496b556ccdb1264381ff093a6be8677270fa7b3d342a42d78758b1f2d41fb4a759d3a590c41cefd0b375b8d8b70')
b2sums_x86_64=('dc37e61f7aa2a5021e7465bdb1109dad144f52a4022980866e169673f7ec423713280cce11471c496839d6a73d25560b99bf5be3d7322dd872eb3eab1d8e8d31'
               '7449dfef6c7a23ff6294ad1613d58ba9b1720dc3f52c11d709543d8f7e6b40d27318f678dda04aad98b16d83d004ff401746f9c9fd385cff0df834b3813ab5f4')
b2sums_aarch64=('fe46f1e4c07a8fe69d106720080e4e597e953e7d99b60dc13c806b350d2f1e60cc92b95a6738366e634011d5ea91b50c47d2ee75db2d7e027d8f4f537fb072c0')

check() {
	_checkoutput="$("$srcdir/$_pkgname/$_pkgname" --version)"
	printf '%s\n' "$_checkoutput"
	printf '%s\n' "$_checkoutput" | grep -q "version $pkgver$"
}

package() {
	cd "$srcdir/"

	# Binary
	install -Dm755 "$_pkgname/$_pkgname" "$pkgdir/usr/bin/$_pkgname"

	# Parser library files (if we have them)
	if [ "$CARCH" != 'aarch64' ]; then
		install -dm755 "$pkgdir/usr/lib/ocaml/${_pkgname}parser/"
		install -Dm644 "lib${_pkgname}parser/include/${_pkgname}parser/"* "$pkgdir/usr/lib/ocaml/${_pkgname}parser/"

		install -dm755 "$pkgdir/usr/lib/"
		install -Dm644 "lib${_pkgname}parser/lib/"* "$pkgdir/usr/lib/"
	fi

	# Misc files
	install -Dm644 "$pkgname-$pkgver-bash-completion" "$pkgdir/usr/share/bash-completion/completions/$_pkgname"
	install -Dm644 "$pkgname-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/MIT"
}
