# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Joel Goguen <contact+aur@jgoguen.ca>
# Contributor: Jordan Klassen <forivall@gmail.com>
_pkgname='flow'
pkgname="$_pkgname-bin"
pkgver='0.272.0'
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
b2sums_x86_64=('3554441f823204d405e4200e7ddea2cc6f4070a6db491d7f1a2acaf4d4d4fd7a025c049c5321a35845a6510ca996a722a7ff8167bd9c9d76cfbf003c23baddfb'
               '97e8b744f6233dd5003af744a54914e0c8e38a8e946cbb39e056fc96c92c8fce0a9bcec83f61a0b45f4dbaa6e00770caf8b0788b9d52d42d3a7e6f5ff8e856a9')
b2sums_aarch64=('81a056f9fdfd1bb56859624fd863c7eaaecc413a0222f26cb1309a5b630166516e07f85b17cf1523ab604f977c951e3adc5d44f0a5406b6bf71be2be65e5d01a')

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
