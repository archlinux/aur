# Maintainer: Inc44
pkgname=ampl-bin
pkgver=20261109
pkgrel=1
pkgdesc="A Mathematical Programming Language"
arch=(
	aarch64
	x86_64
)
url=https://ampl.com
license=(
	Apache-2.0
	BSD-3-Clause
	EPL-1.0
	LicenseRef-AMPL
	MIT
	Zlib
)
depends=(
	glibc
	gmp
	libgcc
	libstdc++
	zlib
)
optdepends_x86_64=(
	'cuda: CUDA support for HiGHS and Xpress'
	'dotnet-runtime: .NET support for AMPL API'
	'java-runtime: Java support for AMPL API'
	'unixodbc: ODBC support'
)
provides=("ampl=$pkgver")
conflicts=(ampl)
options=(
	!debug
	!strip
)
source=(ampl.sh)
source_aarch64=("ampl-$pkgver-aarch64.tgz::https://portal.ampl.com/dl/amplce/ampl.linux-arm64.tgz")
source_x86_64=("ampl-$pkgver-x86_64.tgz::https://portal.ampl.com/dl/amplce/ampl.linux64.tgz")
sha256sums=(67215ec21c6c7d443f487ea5ed39ab07c753c83475bae0b5b39f447a9dd9649b)
sha256sums_aarch64=(SKIP)
sha256sums_x86_64=(SKIP)

_srcname() {
	case $CARCH in
		aarch64) echo . ;;
		x86_64)  echo ampl.linux-intel64 ;;
	esac
}

prepare() {
	"$srcdir/$(_srcname)/ampl" -vvq 2>&1 | grep -qw "$pkgver"
}

package() {
	install -dm755 "$pkgdir/opt" "$pkgdir/usr/share/licenses/$pkgname"
	cp -a --no-preserve=ownership "$srcdir/$(_srcname)" "$pkgdir/opt/ampl"
	rm -f "$pkgdir/opt/ampl/ampl.sh" "$pkgdir/opt/ampl/ampl-$pkgver-$CARCH.tgz"
	install -Dm755 "$srcdir/ampl.sh" "$pkgdir/usr/bin/ampl"
	ln -s ampl "$pkgdir/usr/bin/amplkey"
	echo -e 'AMPL Terms and End-User License Agreement\nhttps://ampl.com/terms-eula' > "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	ln -s \
		/opt/ampl/highs-license.txt \
		/opt/ampl/highs-third_party_notices.md \
		/opt/ampl/scip-license.txt \
		/opt/ampl/gcg-license.txt \
		/opt/ampl/docs/coin-license.txt \
		"$pkgdir/usr/share/licenses/$pkgname"
}
