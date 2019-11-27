# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Previous Maintainer: Beej <beej@beej.us>
# Previous Maintainer: Michael Smith <michael at diglumi dot com>
# Previous Maintainer: Marcin Skory <armitage at q84fh dot net>
# Contributor: Eric Forgeot < http://ifiction.free.fr >

pkgname=gargoyle
pkgver=2019.1.1
pkgrel=1
pkgdesc="Interactive Fiction multi-interpreter that supports all major IF formats."
arch=('i686' 'x86_64' 'armv6h')
url="http://ccxvii.net/gargoyle/"
#alternative url="http://ccxvii.net/gargoyle/"
license=('GPL')
depends=('gtk2' 'sdl2_mixer' 'sdl2' 'libvorbis' 'freetype2')
#sdl_image ?
makedepends=('ftjam' 'pkgconfig' 'desktop-file-utils')
provides=('gargoyle')
conflicts=('gargoyle-mod')
replaces=('gargoyle-mod')
#backup=()
#groups=(inform)
source=("https://github.com/garglk/garglk/archive/${pkgver}.tar.gz" \
	"gargoyle.sh" \
	"gargoyle.install" \
	"gargoyle.xml")
install=${pkgname}.install
sha512sums=('0d1f2724bd6227142eb67c146557a992a6d62af172398c9961511ce5c080e517d1e12ca9bc6be27c1893e404026256257bf3a04cb05923723c0886f111adc4e3'
            'fbfd04e6d62e469b62263f1fb92b314e825784982be3be9f0e506fe6ff7d367704db907c88ec60fc492f35eaa3548fc3a65fd67d8c4c2be7e35ed87a6c9c3489'
            '1fa602865745c1c9801178ee9b24be86215f2af4f9ee3f4f3b3c0606a87aba32a67c9c5343b481332c8fc97ff6c1a5e447f074d116c0cc5b255af35098096e6e'
            'c9924abc48b6dc5025fb83c040a3bdd2a324302d67683645a4fd1d1f3bcfe92c58a9db71c1e41a26afe8a3144e1cdafbc060df2261d93ddac29a9144ae22db71')

prepare() {
	cd "${srcdir}/garglk-${pkgver}"
	# Remove hardcoded optimisation and replace it with our CFLAGS	
	sed -i 's|OPTIM = -O2 $(CFLAGS) ;|OPTIM = ${CFLAGS} -std=c++11 ;|' Jamrules
	# Required to build with gcc 5
	sed -i "s|SubDirCcFlags -DSMART_TOKENISER |SubDirCcFlags -fgnu89-inline -DSMART_TOKENISER |" terps/Jamfile
}

build() {
	cd "${srcdir}/garglk-${pkgver}"
	jam
	jam install
}

package() {
	local gsrcdir="${srcdir}/garglk-${pkgver}"
	cd "$gsrcdir"

	# Install proper IF-reading binaries
	install -dm755 "$pkgdir/usr/bin/gargoyle-bins"
	install -m755 "$gsrcdir"/build/dist/* "$pkgdir/usr/bin/gargoyle-bins/"
	## hurr, durr, I'm dumb and dirty, gotta clean myself
	rm "$pkgdir/usr/bin/gargoyle-bins/libgarglk.so"

	# Install libgarglk library
	install -dm755 "$pkgdir/usr/lib"
	install -m755 "$gsrcdir/build/dist/libgarglk.so" "$pkgdir/usr/lib"

	# Install a launching shell script
	install -m755 "$srcdir/gargoyle.sh" "$pkgdir/usr/bin/gargoyle"

	# Install default config
	install -dm755 "$pkgdir/etc"
	install -m755 "$gsrcdir/garglk/garglk.ini" "$pkgdir/etc"

	# Install desktop icons
	install -dm755 "$pkgdir/usr/share/pixmaps"
	install -m644 "$gsrcdir/garglk/gargoyle-house.png" "$pkgdir/usr/share/pixmaps/${pkgname}.png"

	# Install gargoyle xdg desktop entry
	## before that, patch the icon path since we renamed it earlier
	sed -i 's|Icon=gargoyle-house.png|Icon=gargoyle.png|' "$gsrcdir/garglk/${pkgname}.desktop"
	## link it with x-interactive-fiction mimetype
	echo "MimeType=application/x-interactive-fiction" >> "$gsrcdir/garglk/${pkgname}.desktop"
	## and then install it. Yay~ :3
	install -dm755 "$pkgdir/usr/share/applications"
	install -m644 "$gsrcdir/garglk/${pkgname}.desktop" "$pkgdir/usr/share/applications/${pkgname}.desktop"

	# Install mimetype
	install -dm755 "$pkgdir/usr/share/mime/packages"
	install -m644 "$srcdir/gargoyle.xml" "$pkgdir/usr/share/mime/packages/"
}

