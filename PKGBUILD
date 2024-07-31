# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Joel Goguen <contact+aur@jgoguen.ca>
# Contributor: Jordan Klassen <forivall@gmail.com>
_pkgname='flow'
pkgname="$_pkgname-bin"
pkgver='0.242.1'
pkgrel='1'
pkgdesc='A static type checker for JavaScript - binary version'
arch=('x86_64' 'aarch64')
url="https://$_pkgname.org"
license=('MIT')
provides=("$_pkgname")
conflicts=("$_pkgname")
optdepends=('bash-completion: Tab completion support for bash')
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
b2sums_x86_64=('72dbbd94730d766402987cdd9ab3d5bb2d7ab1421beb0f69c1451c31c80379572fb69959dc96de2a846ba9c86ccf7eb8d5dfa1b77e19c1d38db60a66fe6533b3'
               '81c5734d9b7a29ca574067d2fcad73d23fcd5878984aa5b94d30703659e608a3964e12e644c9f110ba64eb7873364716d59f2b57701e3f56bd0ff69fc17afcfe')
b2sums_aarch64=('2a06cb9252d9e1896d92cc5aae690d396e9d00894d074b4a8615be44111c284e9e5fab4dd2a3364e33b9517bc15327677332fc024056b06e2745fc9879e7f950')

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
