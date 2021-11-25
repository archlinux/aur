# Maintainer: xiretza <xiretza+aur@xiretza.xyz>
_pkgname=libargparse
pkgname=$_pkgname-git
pkgver=r65.1315fd7
pkgrel=1
pkgdesc="A C++ command-line parsing library"
arch=(x86_64)
url="https://github.com/kmurray/libargparse"
license=('MIT')
makedepends=('git' 'cmake')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=(
	"git+$url"
	"0001-include-limits-in-argparse.cpp.patch"
	"0002-Install-library.patch"
	"0003-Enable-test.patch"
)
sha256sums=('SKIP'
            '5dd98546397332234ca037a5cbcf6009966bb9a15d5146799d8538cc983b2deb'
            'a13d4e5e73f015b86fef7f3060fbcd1f7d3135b6769254de38c85e1e74784bdc'
            'd8873f143be2cd0e77df1c9cab90273eecc11f4732daf1f8ed56dfff8719c29e')

pkgver() {
	cd "$srcdir/$_pkgname"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/$_pkgname"

	patch -p1 < "$srcdir/0001-include-limits-in-argparse.cpp.patch"
	patch -p1 < "$srcdir/0002-Install-library.patch"
	patch -p1 < "$srcdir/0003-Enable-test.patch"
}

build() {
	cmake -B build -S "$_pkgname" \
		-DCMAKE_INSTALL_PREFIX=/usr
	make -C build
}

check() {
	make -C build -k test
}

package() {
	make -C build DESTDIR="$pkgdir/" install

	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$_pkgname/LICENSE.md"
}
