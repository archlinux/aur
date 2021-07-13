# Maintainer: autumnontape <autumnontape at tutanota dot com>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Beej <beej@beej.us>
# Contributor: Michael Smith <michael at diglumi dot com>
# Contributor: Marcin Skory <armitage at q84fh dot net>
# Contributor: Eric Forgeot < http://ifiction.free.fr >

pkgname=gargoyle
pkgver=2019.1.1
pkgrel=3
pkgdesc="Interactive Fiction multi-interpreter that supports all major IF formats."
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="http://ccxvii.net/gargoyle/"
#alternative url="http://ccxvii.net/gargoyle/"
license=('GPL')
depends=('gtk2' 'sdl_mixer' 'sdl_sound')
makedepends=('ftjam' 'pkgconfig' 'desktop-file-utils')
provides=('gargoyle')
conflicts=('gargoyle-mod')
replaces=('gargoyle-mod')
#backup=()
#groups=(inform)
source=("https://github.com/garglk/garglk/archive/${pkgver}.tar.gz" \
	"0001-Increase-internal-linkage-in-garglk.patch" \
	"0002-Fix-incorrect-global-declarations.patch" \
	"gargoyle.sh" \
	"gargoyle.xml")
#install=${pkgname}.install
sha512sums=('0d1f2724bd6227142eb67c146557a992a6d62af172398c9961511ce5c080e517d1e12ca9bc6be27c1893e404026256257bf3a04cb05923723c0886f111adc4e3'
            '4261cd890e8ecfbd673169de63c291461fdce8324e813f4a3da4b8516406ed1078894e908b9069e9f748bc1845a7170fa052ef440b77a744c72365983cd6e464'
            '9562c971a5a40edf313fe9b45d8c979e9807b54069aac66818c6f1bf5cd7a29d183798171a92b63c2983c8f8d3019550d07f6d6f8404d0fc5cbd9e8deddfcce1'
            'fbfd04e6d62e469b62263f1fb92b314e825784982be3be9f0e506fe6ff7d367704db907c88ec60fc492f35eaa3548fc3a65fd67d8c4c2be7e35ed87a6c9c3489'
            'c9924abc48b6dc5025fb83c040a3bdd2a324302d67683645a4fd1d1f3bcfe92c58a9db71c1e41a26afe8a3144e1cdafbc060df2261d93ddac29a9144ae22db71')

prepare() {
	cd "${srcdir}/garglk-${pkgver}"
	patch -Np1 -i "${srcdir}/0001-Increase-internal-linkage-in-garglk.patch"
	patch -Np1 -i "${srcdir}/0002-Fix-incorrect-global-declarations.patch"
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

