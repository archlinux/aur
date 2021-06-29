# Maintainer: SpaghettiCat <d_the_m101 at yahoo dot co dot uk>
# Based on "gargoyle" package maintained by:
#     Beej <beej@beej.us>
#     Michael Smith <michael at diglumi dot com>
#     Marcin Skory <armitage at q84fh dot net>
#     with Contribution of Eric Forgeot < http://ifiction.free.fr >
pkgname=gargoyle-git
pkgver=2019.1.r212.g240bcee
pkgrel=1
pkgdesc="Interactive Fiction multi-interpreter that supports all major IF formats (development version)"
arch=('i686' 'x86_64' 'armv6h')
url="https://github.com/garglk/garglk"
license=('GPL')
depends=('gtk3' 'sdl2_mixer' 'sdl2' 'libvorbis' 'freetype2')
makedepends=('cmake' 'pkgconfig' 'desktop-file-utils' 'git')
provides=('gargoyle-git')
conflicts=('gargoyle-mod' 'gargoyle')
replaces=('gargoyle-mod' 'gargoyle')
groups=(inform)
source=("$pkgname::git+https://github.com/garglk/garglk.git" \
	"gargoyle-git.install" \
	"gargoyle.xml")
install=${pkgname}.install
sha512sums=('SKIP'
            '1fa602865745c1c9801178ee9b24be86215f2af4f9ee3f4f3b3c0606a87aba32a67c9c5343b481332c8fc97ff6c1a5e447f074d116c0cc5b255af35098096e6e'
            'c9924abc48b6dc5025fb83c040a3bdd2a324302d67683645a4fd1d1f3bcfe92c58a9db71c1e41a26afe8a3144e1cdafbc060df2261d93ddac29a9144ae22db71')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$pkgname"
	mkdir -p build
	cd build
	# Don't build with Text-to-Speech support.
	# TODO: Make this an optional package.
	cmake .. -DWITH_TTS=false -DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd "$pkgname/build"
	make DESTDIR="$pkgdir/" install

	cd -
	local gsrcdir="$pkgname"

	# Install default config
	install -dm755 "$pkgdir/etc"
	install -m755 "$gsrcdir/garglk/garglk.ini" "$pkgdir/etc"

	# Install desktop icons
	install -dm755 "$pkgdir/usr/share/pixmaps"
	install -m644 "$gsrcdir/garglk/gargoyle-house.png" "$pkgdir/usr/share/pixmaps/${pkgname}.png"

	# Install gargoyle xdg desktop entry
	## before that, patch the icon path since we renamed it earlier
	sed -i 's|Icon=gargoyle-house.png|Icon=gargoyle.png|' "$gsrcdir/garglk/gargoyle.desktop"
	## link it with x-interactive-fiction mimetype
	echo "MimeType=application/x-interactive-fiction" >> "$gsrcdir/garglk/gargoyle.desktop"
	## and then install it.
	install -dm755 "$pkgdir/usr/share/applications"
	install -m644 "$gsrcdir/garglk/gargoyle.desktop" "$pkgdir/usr/share/applications/gargoyle.desktop"

	# Install mimetype
	install -dm755 "$pkgdir/usr/share/mime/packages"
	install -m644 "gargoyle.xml" "$pkgdir/usr/share/mime/packages/"
}

