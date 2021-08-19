# Maintainer: Mads Kjeldgaard<mail@madskjeldgaard.dk>
pkgname=supercollider-ibufwr-git
pkgver=r30.96f9a23
pkgrel=3
pkgdesc='An Interpolating Buffer Writer UGen for SuperCollider'
arch=('any')
url='https://github.com/tremblap/IBufWr'
license=('BSD')
groups=('pro-audio' 'supercollider-plugins')
depends=('supercollider')
makedepends=('git' 'cmake' 'supercollider-headers-git' )
optdepends=()
source=("$pkgname"::git+$url.git)
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
		SC_SRC="/usr/share/supercollider-headers"

		cd "$srcdir/$pkgname"
		mkdir build 
		cd build

		cmake -DSC_PATH=$SC_SRC -DCMAKE_BUILD_TYPE=RELEASE ..
		# cmake -DCMAKE_BUILD_TYPE=RELEASE ..

		make
}


package() {
	cd "$srcdir/$pkgname"
	DEST="$pkgdir/usr/share/SuperCollider/Extensions/$pkgname"

	# Prepare install directories
	mkdir -p $DEST/Classes 
	mkdir -p $DEST/HelpSource/Classes
	mkdir -p $DEST/HelpSource/Guides

	# Classes
	PLUGIN_NAME=IBufWr
	PLUGIN_FOLDER=release-packaging/$PLUGIN_NAME

	# Help Files
	for FILE in "${PLUGIN_FOLDER}/HelpSource/Classes/*.schelp"; do install -Dm755 ./$FILE "$DEST/HelpSource/Classes"; done
	for FILE in "${PLUGIN_FOLDER}/HelpSource/Guides/*.schelp"; do install -Dm755 ./$FILE "$DEST/HelpSource/Guides"; done


	for FILE in "*.sc"; do install -Dm755 ./$FILE "$DEST/Classes"; done

	# Shared objects
	for FILE in *.so; do install -Dm755 ./build/*.so "$DEST"; done
}

