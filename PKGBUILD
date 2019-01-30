# Maintainer: Vaporeon <vaporeon@vaporeon.io>
# Contributor: Lukas Sabota <lukas@lwsabota.com>
pkgname=blastem-hg
pkgver=r1693.ba3fb7a3be6b
pkgrel=1
pkgdesc="Fast and accurate Sega Genesis/Mega Drive emulator"
arch=('x86_64')
url="http://rhope.retrodev.com/files/blastem.html"
license=('GPLv3')
depends=('sdl2' 'glew')
makedepends=('mercurial' 'python2-pillow')
provides=('blastem')
conflicts=('blastem')
source=(blastem::hg+http://rhope.retrodev.com/repos/blastem
        'menu.patch')
sha256sums=('SKIP'
            '4b8e76103e1d607f2e4117c1a23e1d97b2bdca5f01ac2b5d3b433478a3b211d6')
_hgrepo="blastem"

pkgver() {
  cd $srcdir/$_hgrepo
  printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)" | sed s/+//g
}

prepare() {
	cd "$srcdir/${pkgname%-hg}"
	patch -Np1 -i "${srcdir}/menu.patch"
	chmod a+x menumake.sh install.sh
}

build() {
	cd "$srcdir/${pkgname%-hg}"
	make blastem
	./menumake.sh
}

package() {
	cd "$srcdir/${pkgname%-hg}"
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
