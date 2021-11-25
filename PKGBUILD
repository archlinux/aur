# Maintainer: xiretza <xiretza+aur@xiretza.xyz>
_pkgname=libargparse
pkgname=$_pkgname-git
pkgver=r65.1315fd7
pkgrel=2
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
	"0004-Install-headers.patch"
)
sha256sums=('SKIP'
            '97fa62a5e93fe181bdde23d0507323c0f302acc892b285fcdc9464b3a0f76121'
            '6908089ba45176c06995aa1ecf99335e523d560622386cd59c076874676370f3'
            '11a673f5e9a167e1dfcc6a3c6a5b708bd4f655c5769c1d6ef2dc6770bbe74bc1'
            'f8745e604e2514d1bf3848912ad340557b630a810ebd2fecbe2a30c1d8dfcb89')

pkgver() {
	cd "$srcdir/$_pkgname"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/$_pkgname"

	patch -p1 < "$srcdir/0001-include-limits-in-argparse.cpp.patch"
	patch -p1 < "$srcdir/0002-Install-library.patch"
	patch -p1 < "$srcdir/0003-Enable-test.patch"
	patch -p1 < "$srcdir/0004-Install-headers.patch"
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
