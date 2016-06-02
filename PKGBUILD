# Maintainer: Petar Petrov <petar.petrov.georgiev at gmail d0t com>
pkgname=strider
pkgver=1.0.6
pkgrel=2
pkgdesc="Strider is a 2D sci-fi platformer game."
arch=('i686' 'x86_64')
url="https://github.com/petarov/game-off-2015"
license=('MIT')
groups=()
depends=()
makedepends=('nodejs' 'npm' 'nodejs-grunt-cli')
checkdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=strider.install
changelog=
source=(https://github.com/petarov/game-off-2015/archive/1.0.6.tar.gz)
sha1sums=('18b2dc5b16937dcd7d974564f2fbe107e9df8f36')

dirname="game-off-2015"
if [ "${CARCH}" = 'x86_64' ] ; then
	builddir='linux64'
else
	builddir="linux32"
fi

prepare() {
	cd $srcdir
	cd "$srcdir/$dirname-$pkgver"
	npm install
}

build() {
	cd "$srcdir/$dirname-$pkgver"

	# adjust target platform binaries
	sed -i "s/'osx64'[,]*//g" Gruntfile.js
	sed -i "s/'win64'[,]*//g" Gruntfile.js
	if [ "${CARCH}" = 'x86_64' ]; then
		sed -i "s/'linux32'/'linux64'/g" Gruntfile.js
	else
		sed -i "s/'linux64'/'linux32'/g" Gruntfile.js
	fi

	grunt desktop

	sed -i 's/INSTALL_DATADIR/\/opt\/strider/g' strider.in
	sed -i "s/@@VERSION/$pkgver/g" assets/desktop/strider.desktop
}

check() {
	bindir="$srcdir/$dirname-$pkgver/webkitbuilds/Strider/$builddir"
	if [ ! -d $bindir ]; then
		(>&2 echo "Error! Binaries not found in $bindir")
		exit 1
	fi
}

package() {
	cd "$srcdir/$dirname-$pkgver/webkitbuilds/Strider/$builddir"
	tar czf strider-bin.tar.gz *
	mkdir -p "$pkgdir"/opt/strider
	cp strider-bin.tar.gz "$pkgdir"/opt/strider

	cd "$srcdir/$dirname-$pkgver"
	install -Dm755 strider.in "$pkgdir"/usr/local/bin/strider
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
	install -Dm644 assets/crx/icon_48.png "$pkgdir"/usr/share/pixmaps/strider48.png
	install -Dm644 assets/desktop/strider.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
}
