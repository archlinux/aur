_pkgname=UHDM
pkgname=${_pkgname,,}-git
pkgver=r1173.d6edfd8
pkgrel=1
pkgdesc="A complete modeling of the IEEE SystemVerilog Object Model"
arch=(x86_64)
url="https://github.com/chipsalliance/UHDM"
license=('Apache')
depends=('capnproto')
makedepends=('git' 'cmake' 'python' 'tcl' 'gtest')
provides=("${_pkgname,,}=$pkgver")
conflicts=("${_pkgname,,}")
source=(
	"git+$url"
	"0001-Remove-unnecessary-submodules.patch"
	"0002-Don-t-try-to-_FORTIFY_SOURCE-unoptimized-files.patch"
	"0003-Install-libuhdm.so-to-usr-lib.patch"
	"0004-Install-capnp-file-to-usr-share.patch"
	"0005-Make-shared-instead-of-static-library.patch"
)
sha256sums=('SKIP'
            '844cd92b591369a08ef951367fb99eeacac43d1306989067984045be7b02c3fc'
            '7e6e15e7a8455bfa2c08516a620d006f0dbd643a4a8e4b1705749aaad3466666'
            '6f2fbfcc1b263847558266e7c3f99d08354846fe8fb8ccb2fb049f16ed19b772'
            '37add34d362a454630d202485400f59994e05886838efe3ef61a4b661073b0e0'
            '7e40c7ea12d1c276c923bd28d5074352e7720d4072e2a57df1f85f5c1d624cd3')

pkgver() {
	cd "$srcdir/$_pkgname"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/$_pkgname"

	patch -p1 < "$srcdir/0001-Remove-unnecessary-submodules.patch"
	patch -p1 < "$srcdir/0002-Don-t-try-to-_FORTIFY_SOURCE-unoptimized-files.patch"
	patch -p1 < "$srcdir/0003-Install-libuhdm.so-to-usr-lib.patch"
	patch -p1 < "$srcdir/0004-Install-capnp-file-to-usr-share.patch"
	patch -p1 < "$srcdir/0005-Make-shared-instead-of-static-library.patch"
}

build() {
	cmake -B build -S "$_pkgname" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=None
	make -C build
}

check() {
	make -C build -k test
}

package() {
	make -C build DESTDIR="$pkgdir/" install
}
