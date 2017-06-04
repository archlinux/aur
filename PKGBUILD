# Maintainer: Salvador Pardiñas <darkfm@vera.com.uy>
pkgname=blastem
pkgver=0.5.0
pkgrel=1
pkgdesc="Fast and accurate Sega Genesis/Mega Drive emulator"
arch=('x86_64' 'i686')
url="https://www.retrodev.com/blastem/changes.html"
license=('GPL3')
groups=()
depends=('sdl2' 'glew')
makedepends=('python2-pillow')
optdepends=('vasm: game selection menu (must rebuild)')
provides=("${pkgname}")
conflicts=("${pkgname}-hg")
replaces=()
backup=()
options=()
install=
source=(
	'https://www.retrodev.com/repos/blastem/archive/99d153d9e9ca.tar.gz'
	'menu.patch'
	)
noextract=()

prepare() {
	mv "$srcdir/blastem-99d153d9e9ca" "$srcdir/blastem"
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
	install -d "$pkgdir/opt/blastem"
	install -m 755 -D to_install/* "$pkgdir/opt/blastem"
	install -m 666 -D default.cfg "$pkgdir/opt/blastem"
	cp -R shaders rom.db gamecontrollerdb.txt "$pkgdir/opt/blastem"
	chmod 666 "$pkgdir/opt/blastem/shaders"
	chmod 666 "$pkgdir/opt/blastem/rom.db"
	chmod 666 "$pkgdir/opt/blastem/gamecontrollerdb.txt"
	chmod 755 "$pkgdir/opt/blastem/blastem"
	mkdir -p "$pkgdir/usr/bin"
	ln -s "/opt/blastem/blastem" "$pkgdir/usr/bin/blastem"
}
md5sums=('8d2fbac987082700912d84d00cbbe67d'
         'cea255d6ac07a7ac8eab47cef08c5e93')
