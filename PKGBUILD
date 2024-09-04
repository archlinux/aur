# Maintainer: lvrodrigues <lvrodriguesline@gmail.com>

pkgname="mingw-w64-x86_64-xz"
pkgver=5.6.2
pkgrel=3
pkgdesc="Library and command line tools for XZ and LZMA compressed files for amd64 platform (mingw-w64)"
arch=('x86_64')
url="https://tukaani.org/xz/"
license=('0BSD' 'GPL-2.0-only' 'GPL-3.0-only' 'LGPL-2.1-only')
depends=()
makedepends=('mingw-w64-gcc' 'po4a')
provides=("mingw-w64-$arch-xz=$pkgver")
conflicts=('mingw-w64-xz')
options=('!strip' 'staticlibs' '!buildflags')
validpgpkeys=('3690C240CE51B4670D30AD1C38EE757D69184620') # Lasse Collin <lasse.collin@tukaani.org>
source=("xz-$pkgver.tar.xz::https://github.com/tukaani-project/xz/releases/download/v5.6.2/xz-$pkgver.tar.xz")
sha256sums=('a9db3bb3d64e248a0fae963f8fb6ba851a26ba1822e504dc0efd18a80c626caf')

_basename=xz
_platform=x86_64-w64-mingw32

prepare() {
	cd "$srcdir/$_basename-$pkgver"
	./autogen.sh
}

build() {
	cd "$srcdir/$_basename-$pkgver"
	./configure --host=$_platform --prefix=/usr/$_platform
	make
}

package() {
	cd    "$srcdir/$_basename-$pkgver"
	make  DESTDIR="$pkgdir/" install
	find  "$pkgdir/usr/$_platform" -name '*.exe' | xargs -rtL1 rm
	find  "$pkgdir/usr/$_platform" -name '*.dll' | xargs -rtL1 $_platform-strip -x
	find  "$pkgdir/usr/$_platform" -name '*.a' -o -name '*.dll' | xargs -rtL1 $_platform-strip -g
	find  "$pkgdir/usr/$_platform" -name '*.a' -o -name '*.dll' | xargs -rtL1 chmod 644
	rm    "$pkgdir/usr/$_platform/bin/"{lz{cmp,diff,egrep,fgrep,grep,less,more},xz{cmp,diff,egrep,fgrep,grep,less,more}}
	rm -r "$pkgdir/usr/$_platform/share" 

	install -d "$pkgdir/usr/share/licenses/$pkgname"
	find  "$srcdir/$_basename-$pkgver" -name 'COPYING*' | xargs -rtL1 install -m644 -t "$pkgdir/usr/share/licenses/$pkgname" 
}
