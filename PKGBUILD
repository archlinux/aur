# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=speedata-publisher
pkgver=4.19.5
pkgrel=1
pkgdesc='a database publishing software that creates high-quality layouted PDFs fully automatically'
arch=(x86_64)
url='https://github.com/speedata/publisher'
license=(AGPL-3.0-only)
depends=(crimson-pro-font
         glibc
         tex-gyre-fonts
         tex-gyre-fonts
         ttf-camingocode)
makedepends=(go
             lua
             ruby-rake)
provides=(libsplib.so
          luaglue.so)
_archive="${pkgname#*-}-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('603b12b18eab4e543c72d449e5ada486f5baff9a2baeae79dbf3b88f8f434002')

prepare() {
	cd "$_archive"
	# sed -i \
	#         -e '/^installdir/s!__FILE__!"/usr/bin"!' \
	#         -e '/^srcdir/as!"src"!"share/speedata"!' \
	#         Rakefile
}

build() {
	cd "$_archive"
	rake build
	rake buildlib
}

package() {
	cd "$_archive"
	# Upstream project has no installation targets
	# https://github.com/speedata/publisher/issues/551
	# rake install
	install -Dm0755 -t "$pkgdir/usr/bin/" bin/sp
	install -Dm0755 -t "$pkgdir/usr/lib/" build/dylib/{luaglue,libsplib}.so
	install -Dm0644 -t "$pkgdir/usr/include/" build/dylib/libsplib.h
}
