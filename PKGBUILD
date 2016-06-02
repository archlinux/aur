# Maintainer: Petar Petrov <petar.petrov.georgiev at gmail d0t com>
pkgname=psiral
pkgver=1.0.5
pkgrel=3
pkgdesc="Psiral is a turn based strategy board game with wizards."
arch=('i686' 'x86_64')
url="https://github.com/petarov/game-off-2013"
license=('custom')
groups=()
depends=()
makedepends=('nodejs' 'npm' 'nodejs-grunt-cli')
checkdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=psiral.install
changelog=
source=(https://github.com/petarov/game-off-2013/archive/$pkgver.tar.gz)
sha1sums=('a2f43d215148b9af351bf614a4bc6277c018232b')

dirname="game-off-2013"
if [ "${CARCH}" = 'x86_64' ] ; then
	builddir='linux64'
else
	builddir="linux32"
fi

prepare() {
	cd "$srcdir/$dirname-$pkgver"
	npm install
}

build() {
	cd "$srcdir/$dirname-$pkgver"

	# adjust target platform binaries
	sed -i 's/mac32\:\strue/mac32\:false/g' Gruntfile.js
	sed -i 's/mac64\:\strue/mac64\:false/g' Gruntfile.js
	sed -i 's/win32\:\strue/win32\:false/g' Gruntfile.js
	sed -i 's/win64\:\strue/win64\:false/g' Gruntfile.js
	if [ "${CARCH}" = 'x86_64' ]; then
		sed -i 's/linux64\:\sfalse/linux64\:true/g' Gruntfile.js
		sed -i 's/linux32\:\strue/linux32\:false/g' Gruntfile.js
	else
		sed -i 's/linux64\:\strue/linux64\:false/g' Gruntfile.js
		sed -i 's/linux32\:\sfalse/linux32\:true/g' Gruntfile.js
	fi

	grunt desktop

	sed -i 's/INSTALL_DATADIR/\/opt\/psiral/g' psiral.in
	sed -i "s/@@VERSION/$pkgver/g" psiral.desktop
}

check() {
	bindir="$srcdir/$dirname-$pkgver/webkitbuilds/Psiral/$builddir"
	if [ ! -d $bindir ]; then
		(>&2 echo "Error! Binaries not found in $bindir")
		exit 1
	fi
}

package() {
	cd "$srcdir/$dirname-$pkgver/webkitbuilds/Psiral/$builddir"
	tar czf psiral-bin.tar.gz *
	mkdir -p "$pkgdir"/opt/psiral
	cp psiral-bin.tar.gz "$pkgdir"/opt/psiral

	cd "$srcdir/$dirname-$pkgver"
	install -Dm755 psiral.in "$pkgdir"/usr/local/bin/psiral
	install -Dm644 icon_48.png "$pkgdir"/usr/share/pixmaps/psiral48.png
	install -Dm644 psiral.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
