# Maintainer: Mads Kjeldgaard<mail@madskjeldgaard.dk>
pkgname=supercollider-maths-git
pkgver=r14.36daf84
pkgrel=1
pkgdesc='SuperCollider emulation of the Maths eurorack module'
arch=('any')
url='https://github.com/spluta/Maths'
license=('GPL')
groups=('pro-audio')
depends=('supercollider')
makedepends=('git' 'cmake' 'faust' 'ruby-rexml')
optdepends=()
source=("$pkgname-$pkgver"::git+$url.git)
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname-$pkgver"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
		cd "$srcdir/$pkgname-$pkgver"

		faust2supercollider -noprefix -d FaustSource/*.dsp
}


package() {
	cd "$srcdir/$pkgname-$pkgver"
	DEST="$pkgdir/usr/share/SuperCollider/Extensions/$pkgname"

	# Prepare install directories
	mkdir -p $DEST/Classes 
	mkdir -p $DEST/HelpSource/Classes

	PLUGIN_FOLDER=FaustSource

	# Shared objects
	for FILE in *.so; do install -Dm755 $PLUGIN_FOLDER/*.so "$DEST"; done

	# Classes
	for FILE in "Classes/*.sc"; do install -Dm755 ./$FILE "$DEST/Classes"; done

	# Help Files
	for FILE in "HelpSource/*.schelp"; do install -Dm755 ./$FILE "$DEST/HelpSource/Classes"; done

}

