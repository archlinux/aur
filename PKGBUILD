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
license=('GPL')
depends=('sdl2_mixer' 'sdl2' 'freetype2' 'qt5-base' 'fontconfig' 'libjpeg' 'libpng' 'zlib')
makedepends=('cmake' 'pkgconfig' 'desktop-file-utils')
optdepends=('speech-dispatcher: Text-to-Speech')
provides=('gargoyle')
conflicts=('gargoyle-mod')
replaces=('gargoyle-mod')
#groups=(inform)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/garglk/garglk/archive/${pkgver}.tar.gz" \
	"libspeechd-dlopen.patch"
	"gargoyle.install")
install=${pkgname}.install
sha512sums=('10b9ccc4bb6bed83780f8d7bf2d36650c8f7c4e14204fe5372e972f8d6900c69846d601670db55ec369e313a75c34ef88fd873f158729af0d4d9a6d8c5c6a1e1'
            'd1381db41a973ccd4ae7bfccb089a48ca851a3c6a4ba8c1e07e8e195e7429b1d96d3bacec6a651aa108e8ecc17d9bc3eb78d368309cf134f80af9b699c3c2d4d'
            '1fa602865745c1c9801178ee9b24be86215f2af4f9ee3f4f3b3c0606a87aba32a67c9c5343b481332c8fc97ff6c1a5e447f074d116c0cc5b255af35098096e6e')

prepare() {
	cd "${srcdir}/garglk-${pkgver}"
	patch -Np1 -i "${srcdir}/libspeechd-dlopen.patch"
}

build() {
	cd "${srcdir}/garglk-${pkgver}"
	mkdir -p build
	cd build
	cmake .. -DWITH_TTS=DYNAMIC -DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd "${srcdir}/garglk-${pkgver}/build"
	make DESTDIR="$pkgdir/" install

	cd -
	local gsrcdir="${srcdir}/garglk-${pkgver}"

	# Install default config
	install -dm755 "$pkgdir/etc"
	install -m755 "$gsrcdir/garglk/garglk.ini" "$pkgdir/etc"
}
