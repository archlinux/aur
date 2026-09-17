# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=speedata-publisher
pkgver=5.9.5
pkgrel=1
pkgdesc='a database publishing software that creates high-quality layouted PDFs fully automatically'
arch=(x86_64)
url='https://github.com/speedata/publisher'
license=(AGPL-3.0-only)
depends=(glibc
         java-runtime-headless
         texlive-bin)
makedepends=(go
             lua53)
_archive="${pkgname#*-}-$pkgver"
source=("$url/archive/refs/tags/v$pkgver/$_archive.tar.gz")
sha256sums=('4e54bfe0ca111d2ca54f9917e156ab26b080a7f8e7db05818432a4e9c5460c1b')

build() {
	cd "$_archive"
	pushd src/go
	export GOFLAGS="-trimpath -buildmode=pie -mod=readonly -modcacherw"
	go build -o sphelper-bin speedatapublisher/sphelper/sphelper
	export SP_BUILDDIR_BIN="$srcdir/build/bin"
	export SP_BUILDDIR_SHARE="$srcdir/build/share"
	export SP_BUILDDIR_SW="$srcdir/build/sw"
	export SP_DESTDIR_BIN=/usr/bin
	export SP_DESTDIR_SHARE=/usr/share/speedata
	export SP_DESTDIR_SW=/usr/share/speedata/sw
	export CGO_CPPFLAGS="$CPPFLAGS"
	export CGO_CFLAGS="-I/usr/include/lua5.3 $CFLAGS"
	export CGO_CXXFLAGS="$CXXFLAGS"
	export CGO_LDFLAGS="$LDFLAGS"
	export CC_amd64_linux="${CC:-gcc}"
	popd
	./src/go/sphelper-bin --basedir "./build" distcustom linux/amd64
}

package() {
	cd "$_archive"
	local basedir="$srcdir/build"
	install -Dm0755 -t "$pkgdir/usr/bin/" "$basedir/bin/sp"
	install -Dm0755 -t "$pkgdir/usr/share/speedata/lib/" \
		"$basedir/share/lib/libsplib.so" \
		"$basedir/share/lib/luaglue.so"
	install -Dm0644 -t "$pkgdir/usr/share/speedata/lib/" \
		"$basedir/share/lib/jing.jar" \
		"$basedir/share/lib/saxon-he-12.9.jar"
	install -Dm0644 -t "$pkgdir/usr/share/speedata/lib/lib/" \
		"$basedir/share/lib/lib/"*.jar
	cp -aT "$basedir/share/schema" "$pkgdir/usr/share/speedata/schema"
	cp -aT "$basedir/sw" "$pkgdir/usr/share/speedata/sw"
	install -Dm0644 "$srcdir/$_archive/build/dylib/libsplib.h" "$pkgdir/usr/include/libsplib.h"
}
