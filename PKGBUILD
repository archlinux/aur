# Maintainer: Mads Kjeldgaard<mail@madskjeldgaard.dk>
pkgname=supercollider-xplaybuf-git
pkgver=r10.f0af995
pkgrel=1
pkgdesc="A buffer player for SuperCollider that loops, fades and doesnt glitch"
arch=('any')
url="https://github.com/elgiano/xplaybuf"
license=('GPL')
groups=('pro-audio' 'supercollider-plugins')
depends=('supercollider')
makedepends=("git" "cmake")
optdepends=()
source=("$pkgname-$pkgver"::git+$url.git
        "supercollider-source::git+https://github.com/supercollider/supercollider.git")
md5sums=('SKIP'
         'SKIP')

pkgver() {
	cd "$srcdir/$pkgname-$pkgver"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
		SC_SRC="$srcdir/supercollider-source"

		cd $SC_SRC 
		git submodule update --init --recursive
		cd "$srcdir/$pkgname-$pkgver"

		mkdir build 
		cd build

		cmake -DSC_PATH=$SC_SRC -DCMAKE_BUILD_TYPE=RELEASE ..
		make

}


package() {
	cd "$srcdir/$pkgname-$pkgver"
	DEST="$pkgdir/usr/share/SuperCollider/Extensions/$pkgname"

	# Prepare install directories
	mkdir -p $DEST/Classes 
	mkdir -p $DEST/HelpSource/Classes

	# Classes
	PLUGIN_FOLDER=plugins/XPlayBuf
	for FILE in "${PLUGIN_FOLDER}/*.sc"; do install -Dm755 ./$FILE "$DEST/Classes"; done

	# Shared objects
	for FILE in *.so; do install -Dm755 ./build/*.so "$DEST"; done

	# Help Files
	for FILE in "${PLUGIN_FOLDER}/*.schelp"; do install -Dm755 ./$FILE "$DEST/HelpSource/Classes"; done

}
