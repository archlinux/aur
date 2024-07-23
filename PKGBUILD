# Maintainer: Daniel Peukert <daniel@peukert.cc>
pkgname='hlsdl'
pkgver='0.27'
_commit='cbf4301a912a3c0bbb418bd92b861f390f9c519c'
pkgrel='3'
pkgdesc='C program to download VoD HLS (.m3u8) files'
arch=('x86_64' 'i486' 'i686' 'pentium4' 'armv7h' 'aarch64')
url="https://github.com/selsta/$pkgname"
license=('MIT')
depends=('curl' 'openssl')
source=(
	"$pkgname-$pkgver.tar.gz::$url/archive/$_commit.tar.gz"
	'fix-build.diff'
)
b2sums=('1c6e47dca607e3c7f0b6b30c83c7b28fde51dfe40c5c06ab78e5e321474f01cdf31935db1546b84b2e8327d62adf555e2cba62273c36903ecb70a7768fc59d89'
        'b40fbac24ab2c98d822a7531a7e815f27b2d15b7794835dac3b839051d648f76c1635d10f1671950b63944a01481c5921ed267c1f47e6f88532d0514d39dc414')

_sourcedirectory="$pkgname-$_commit"

prepare() {
	cd "$srcdir/$_sourcedirectory/"
	patch --forward -p1 < '../fix-build.diff'
}

build() {
	cd "$srcdir/$_sourcedirectory/"
	# see https://bbs.archlinux.org/viewtopic.php?id=255727
	CFLAGS="$CFLAGS -fcommon"
	make
}

check() {
	_checkoutput="$("$srcdir/$_sourcedirectory/$pkgname")"
	printf '%s\n' "$_checkoutput"
	printf '%s\n' "$_checkoutput" | grep -q "^$pkgname v$pkgver$"
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/MIT"
}
