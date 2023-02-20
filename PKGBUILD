# Maintainer: autumnontape <autumn at cyfox dot net>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Beej <beej@beej.us>
# Contributor: Michael Smith <michael at diglumi dot com>
# Contributor: Marcin Skory <armitage at q84fh dot net>
# Contributor: Eric Forgeot < http://ifiction.free.fr >

pkgname=gargoyle
pkgver=2023.1
pkgrel=1
pkgdesc="Interactive Fiction multi-interpreter that supports all major IF formats."
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://ccxvii.net/gargoyle/"
license=('GPL2' 'GPL3' 'custom:BSD-2-Clause' 'custom:BSD-3-Clause' 'Artistic2.0' 'MIT' 'custom:OFL-1.1')
depends=('sdl2_mixer' 'sdl2' 'freetype2' 'qt5-base' 'fontconfig' 'libjpeg' 'libpng' 'zlib'
         'hicolor-icon-theme')
makedepends=('cmake' 'pkgconfig' 'desktop-file-utils')
optdepends=('speech-dispatcher: Text-to-Speech')
provides=('gargoyle')
conflicts=('gargoyle-mod')
replaces=('gargoyle-mod')
backup=('etc/garglk.ini')
#groups=(inform)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/garglk/garglk/archive/${pkgver}.tar.gz")
sha512sums=('d8624f8a8492f64adfdb638811419ebef5b77457708a5d07a3891faf97966237839170914af4d416f42aca7e6d9d0643384ef60be30a2ba22ed52fee4938683a')

build() {
	cd "${srcdir}/garglk-${pkgver}"

	# Extract the license for Git from the readme
	sed -n '/Copyright (c)/,/DEALINGS IN THE SOFTWARE\./p' \
		terps/git/README.txt > terps/git/LICENSE

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
	install -m644 "$gsrcdir/licenses/Go Mono.txt" \
		"$pkgdir/usr/share/licenses/${pkgname}/BSD-3-Clause-Go-Mono.txt"
	install -m644 "$gsrcdir/terps/advsys/LICENSE" \
		"$pkgdir/usr/share/licenses/${pkgname}/BSD-3-Clause-AdvSys.txt"
	install -m644 "$gsrcdir/terps/git/LICENSE" \
		"$pkgdir/usr/share/licenses/${pkgname}/MIT-Git.txt"
	install -m644 "$gsrcdir/terps/glulxe/LICENSE" \
		"$pkgdir/usr/share/licenses/${pkgname}/MIT-Glulxe.txt"
	install -m644 "$gsrcdir/licenses/Charis SIL.txt" \
		"$pkgdir/usr/share/licenses/${pkgname}/OFL-1.1.txt"
}
