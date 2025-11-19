# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=vtf-thumbnailer
pkgver=1.1.0
pkgrel=1
pkgdesc="Adds previews for VTF files in your file explorer of choice on Windows and Linux."
arch=('x86_64')
url="https://github.com/craftablescience/vtf-thumbnailer"
license=('MIT')
depends=('glibc' 'gcc-libs')
makedepends=('git' 'cmake' 'ninja')
source=("git+$url.git#tag=v${pkgver}"
	"git+${url::-16}/cmake-helpers.git"
	"git+https://github.com/p-ranav/argparse.git"
	"git+${url::-16}/sourcepp.git")
noextract=()
sha256sums=('434c6212043b6cc2062a81a2d7dbe671ef527f0cf390bc7c247b7f81b187c020'
            'SKIP'
            'SKIP'
            'SKIP')
validpgpkeys=()

prepare() {
	cd "$srcdir/$pkgname"
	for _submodule in argparse sourcepp
	do
		git config submodule.ext/$_submodule.url "$srcdir/$_submodule"
	done
	git config submodule.cmake/helpers.url "$srcdir/cmake-helpers"
	git -c protocol.file.allow=always submodule update
}

build() {
	cd "$srcdir"
	cmake -B build -S $pkgname \
	-GNinja \
	-DCMAKE_BUILD_TYPE=None \
	-DCMAKE_C_FLAGS="$CFLAGS -DNDEBUG" \
	-DCMAKE_CXX_FLAGS="$CXXFLAGS -DNDEBUG" \
	-DCMAKE_INSTALL_PREFIX=/usr \
	-DCPACK_GENERATOR=RPM \
	-DZLIBNG_ENABLE_TESTS=OFF

	cmake --build build
}

package() {
	cd "$srcdir"
	DESTDIR="$pkgdir" cmake --install build
	sed -i 's/\/opt/\/usr\/lib/g' "$pkgdir/usr/share/thumbnailers/vtf-thumbnailer.thumbnailer"
	install -dm755 "$pkgdir/usr/lib/$pkgname"
	mv "$pkgdir/usr/$pkgname" "$pkgdir/usr/lib/$pkgname/$pkgname"
}
