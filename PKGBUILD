# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Rose Kunkel <rose at rosekunkel dot me>

pkgname=guile3
pkgver=3.0.8
pkgrel=2
pkgdesc='Portable, embeddable Scheme implementation written in C'
arch=('x86_64' 'pentium4')
url='https://www.gnu.org/software/guile/'
license=('GPL3')
depends=('gmp' 'libltdl' 'ncurses' 'texinfo' 'libunistring' 'gc' 'libffi' 'readline')
provides=("guile=$pkgver")
source=(
	"$pkgname-$pkgver.tar.lz::https://ftp.gnu.org/pub/gnu/guile/guile-$pkgver.tar.lz"
	"$pkgname-$pkgver.tar.lz.sig::https://ftp.gnu.org/pub/gnu/guile/guile-$pkgver.tar.lz.sig"
	'skip-testing-oom-conditions.patch')
sha256sums=('96f5263f89dda2d757fe1129e489e672f5a0b7540ee6710ec7ef352120d8af52'
            'SKIP'
            '2b053f0dafc5c68cc7f186c6252348e92e4b1e0f691e1e6eca7a5101c9b9f78a')
validpgpkeys=('4FD4D288D445934E0A14F9A5A8803732E4436885') # Andy Wingo

# Running strip can potentially mangle Guile bytecode (.go) files.
# See https://aur.archlinux.org/packages/guile3/#comment-769796
options=('!strip')

# The official guile package already provides this file.
PURGE_TARGETS=('usr/share/aclocal/guile.m4')

prepare() {
  # Disable a test that's known to fail.
  # See https://lists.gnu.org/archive/html/bug-guile/2021-01/msg00001.html
	patch -p1 -d "guile-$pkgver" < skip-testing-oom-conditions.patch
}

build() {
	cd "guile-$pkgver"

	# Install guile as guile3 and info files to /usr/share/info/guile3 so we don't
	# conflict with the official guile package.
	export CFLAGS
	export LDFLAGS
	./configure \
		--prefix=/usr \
		--infodir="/usr/share/info/$pkgname" \
		--program-suffix=3 \
		--disable-static \
		--disable-error-on-warning
	make
}

check() {
	make -C "guile-$pkgver" -k check
}

package() {
	make -C "guile-$pkgver" DESTDIR="$pkgdir/" install
	rm "$pkgdir"/usr/lib/libguile-3.?.so.*-gdb.scm
}
