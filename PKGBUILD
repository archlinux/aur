# Maintainer: Vaporeon <vaporeon@vaporeon.io>
# Contributor: Salvador Pardiñas <darkfm@vera.com.uy>
pkgname=blastem
pkgver=0.6.1
pkgrel=2
pkgdesc="Fast and accurate Sega Genesis/Mega Drive emulator"
arch=('x86_64' 'i686')
url="https://www.retrodev.com/blastem/changes.html"
license=('GPL3')
depends=('sdl2' 'glew')
makedepends=('python2-pillow')
optdepends=('vasm: game selection menu (must rebuild)'
	    'xcftools: game selection menu (must rebuild)')
provides=("${pkgname}")
conflicts=("${pkgname}-hg")
source=(
	'https://www.retrodev.com/repos/blastem/archive/357b4951d9b2.tar.gz'
	'menu.patch'
	)
noextract=()

prepare() {
	mv "$srcdir/blastem-357b4951d9b2" "$srcdir/blastem"
	cd "$srcdir/${pkgname}"
	patch -Np1 -i "${srcdir}/menu.patch"
	chmod a+x menumake.sh install.sh
}

build() {
	cd "$srcdir/${pkgname}"
	make blastem
	./menumake.sh
}

package() {
	cd "$srcdir/${pkgname}"
	./install.sh
	mkdir -p "$pkgdir/opt/blastem"
	install -d -g games "$pkgdir/opt/blastem"
	install -m 755 -g games -D to_install/* "$pkgdir/opt/blastem"
	install -m 666 -g games -D default.cfg "$pkgdir/opt/blastem"
	install -m 666 -g games rom.db gamecontrollerdb.txt "$pkgdir/opt/blastem"
	install -m 644 -g games -d "$pkgdir/opt/blastem/shaders"
	install -m 644 -g games -D shaders/* "$pkgdir/opt/blastem/shaders"
	chmod 755 "$pkgdir/opt/blastem/blastem"
	chown root:games "$pkgdir/opt/blastem"
	chown root:games "$pkgdir/opt/blastem/shaders"
	chmod 755 "$pkgdir/opt/blastem/shaders"
	mkdir -p "$pkgdir/usr/bin"
	ln -s "/opt/blastem/blastem" "$pkgdir/usr/bin/blastem"
}
md5sums=('e783af5621c5da196d28c35c07a58e91'
         'b01d07f2630bb2c31ffda48dddc85785')
