# Maintainer: meow <sosdjolfkhgsldjkfh@gmail.com>
# based off of https://aur.archlinux.org/packages/maretf-git
pkgname=vtf-thumbnailer-git
pkgver=0.1.3.r0.g646cdd4d
pkgrel=1
pkgdesc="adds previews for VTF files in your file explorer of choice. git version."
arch=('x86_64')
url="https://github.com/craftablescience/vtf-thumbnailer"
license=('MIT')
depends=('glibc' 'gcc-libs')
makedepends=('ninja' 'cmake' 'git')
_base_name="${pkgname::-4}"
provides=("$_base_name")
conflicts=("$_base_name")
source=("git+$url.git"
		"$_base_name.thumbnailer"
		"$_base_name.xml")
sha256sums=('SKIP'
            '227ede69546d0d4a4055edafaefba1f3267a605e83dc7c4dac293648bea8870f'
            '15d2b5c908ef4ad6b350e8c201984a44bd33d2ce0e856e10253d347c1afd42d6')

pkgver() {
	cd "$srcdir/$_base_name"
	git describe --tags --long --abbrev=8 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$srcdir/$_base_name"
	git submodule init
	git submodule update
	cd "$srcdir/$_base_name/ext/sourcepp"
	git submodule init
	git submodule update
}

build() {
	cd "$srcdir/$_base_name"
	cmake -B build \
		-GNinja \
		-DCMAKE_BUILD_TYPE=None \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DZLIBNG_ENABLE_TESTS=OFF \
		-DCMAKE_C_FLAGS="$CFLAGS -DNDEBUG" \
		-DCMAKE_CXX_FLAGS="$CXXFLAGS -DNDEBUG"

	cmake --build build
}

package() {
	cd "$srcdir"
	install -Dm755 "$srcdir/$_base_name/build/$_base_name" "$pkgdir/usr/bin/$_base_name"
	install -Dm644 "$srcdir/$_base_name.thumbnailer" "$pkgdir/usr/share/thumbnailers/$_base_name.thumbnailer"
	install -Dm644 "$srcdir/$_base_name.xml" "$pkgdir/usr/share/mime/application/$_base_name.xml"
	install -Dm644 "$srcdir/$_base_name/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
