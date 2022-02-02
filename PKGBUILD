# Maintainer: autumnontape <autumn at cyfox dot net>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Beej <beej@beej.us>
# Contributor: Michael Smith <michael at diglumi dot com>
# Contributor: Marcin Skory <armitage at q84fh dot net>
# Contributor: Eric Forgeot < http://ifiction.free.fr >

pkgname=gargoyle
pkgver=2022.1
pkgrel=1
pkgdesc="Interactive Fiction multi-interpreter that supports all major IF formats."
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="http://ccxvii.net/gargoyle/"
license=('GPL2' 'custom:BSD-2-Clause' 'custom:BSD-3-Clause' 'Artistic2.0' 'MIT' 'custom:OFL-1.1')
depends=('sdl2_mixer' 'sdl2' 'freetype2' 'qt5-base' 'fontconfig' 'libjpeg' 'libpng' 'zlib' 'hicolor-icon-theme')
makedepends=('cmake' 'pkgconfig' 'desktop-file-utils')
optdepends=('speech-dispatcher: Text-to-Speech')
provides=('gargoyle')
conflicts=('gargoyle-mod')
replaces=('gargoyle-mod')
#groups=(inform)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/garglk/garglk/archive/${pkgver}.tar.gz" \
	"libspeechd-dlopen.patch")
sha512sums=('10b9ccc4bb6bed83780f8d7bf2d36650c8f7c4e14204fe5372e972f8d6900c69846d601670db55ec369e313a75c34ef88fd873f158729af0d4d9a6d8c5c6a1e1'
            'd1381db41a973ccd4ae7bfccb089a48ca851a3c6a4ba8c1e07e8e195e7429b1d96d3bacec6a651aa108e8ecc17d9bc3eb78d368309cf134f80af9b699c3c2d4d')

prepare() {
	cd "${srcdir}/garglk-${pkgver}"
	patch -Np1 -i "${srcdir}/libspeechd-dlopen.patch"
}

build() {
	cd "${srcdir}/garglk-${pkgver}"
	mkdir -p build
	cd build
	# the Arch package guidelines say to use
	# /usr/lib instead of /usr/libexec.
	cmake .. -DWITH_TTS=DYNAMIC -DCMAKE_INSTALL_LIBEXECDIR=lib -DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd "${srcdir}/garglk-${pkgver}/build"
	make DESTDIR="$pkgdir/" install

	cd -
	local gsrcdir="${srcdir}/garglk-${pkgver}"

	# Install default config
	install -dm755 "$pkgdir/etc"
	install -m644 "$gsrcdir/garglk/garglk.ini" "$pkgdir/etc"

	# Install licenses
	install -dm755 "$pkgdir/usr/share/licenses/${pkgname}"
	install -m644 "$gsrcdir/License.txt" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
	install -m644 "$gsrcdir/licenses/BSD-2-Clause.txt" "$pkgdir/usr/share/licenses/${pkgname}"
	install -m644 "$gsrcdir/terps/advsys/LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/BSD-3-Clause.txt"
	install -m644 "$gsrcdir/licenses/Charis SIL.txt" "$pkgdir/usr/share/licenses/${pkgname}/OFL-1.1.txt"
}
