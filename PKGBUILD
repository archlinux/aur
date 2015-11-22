# Maintainer: Nyarcel <nyarcel AT SPAMFREE gmail DOT com>
# Contributor: eolianoe <eolianoe [at] gmail [DoT] com>
# Contributor: Leonid Isaev <lisaev@indiana.edu>

_pkgname=lapack
pkgname=$_pkgname-manpages
pkgver=3.6.0
pkgrel=1
pkgdesc='LAPACK and BLAS manual pages'
arch=('any')
url='http://netlib.org/lapack'
license=('BSD')
makedepends=('doxygen')
options=('!strip')
source=("http://www.netlib.org/$_pkgname/$_pkgname-$pkgver.tgz")
sha256sums=('a9a0082c918fe14e377bbd570057616768dca76cbdc713457d8199aaa233ffc3')

prepare() {
	cd "$_pkgname-$pkgver"

	# No source code
	sed -i 's/INLINE_SOURCES         = YES/INLINE_SOURCES         = NO/g' \
               DOCS/Doxyfile_man

	# Only documented entities
	sed -i 's/EXTRACT_ALL            = YES/EXTRACT_ALL            = NO/g' \
               DOCS/Doxyfile_man

	# Get rid of unrelated warnings
	doxygen -u DOCS/Doxyfile_man 2&> /dev/null
}

build() {
	cd "$_pkgname-$pkgver"

	echo "Building manpages with doxygen. This may take a while."
	doxygen DOCS/Doxyfile_man

	# Cleaning
	rm -f DOCS/man/man3/_*
}

package() {
	install -Dm644 "$srcdir/$_pkgname-$pkgver/DOCS/man/man3/"* \
	            -t "$pkgdir/usr/share/man/man3/"

	install -Dm644 "$srcdir/$_pkgname-$pkgver/LICENSE" \
	               "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
