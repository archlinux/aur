# Maintainer: Mads Kjeldgaard <mail@madskjeldgaard.dk>
pkgname=supercollider-mi-ugens-git
pkgver=r91.b2607b9
pkgrel=2
pkgdesc="SuperCollider UGen versions of Mutable Instruments synthesizer modules"
arch=('any')
url="https://github.com/v7b1/mi-UGens"
license=('GPL')
groups=('pro-audio' 'supercollider-plugins' )
depends=()
makedepends=('git' 'cmake' 'gcc-libs' 'supercollider-headers-git')
optdepends=()
source=("$pkgname-$pkgver::git+$url.git")
md5sums=('SKIP')

_FOLDERS=(MiClouds MiGrids MiOmi MiRipples MiWarps MiElements MiMu MiPlaits MiRings MiVerb)

pkgver() {
	cd "$srcdir/$pkgname-$pkgver"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$pkgname-$pkgver"

	# Get dependencies
	git submodule update --init --recursive

	# Files to build
	SC_SRC="/usr/share/supercollider-headers"

	for FOLDER in "${_FOLDERS[@]}"
	do
		cd $FOLDER
		# Build folder
		mkdir build 
		cd build

		cmake -DSC_PATH=$SC_SRC -DCMAKE_BUILD_TYPE=RELEASE ..
		make

		# # Return
		cd ../..
	done
}

package() {
	# Files to install
	_FOLDERS=(MiClouds MiGrids MiOmi MiRipples MiWarps MiElements MiMu MiPlaits MiRings MiVerb)

	# Destination: System extension dir
	DEST="$pkgdir/usr/share/SuperCollider/Extensions/$pkgname/"
	mkdir -p $DEST/Classes $DEST/HelpSource/Classes

	cd "$pkgname-$pkgver"

	for FILE in "${_FOLDERS[@]}"
	do
		# Class
		install -Dm755 ./sc/Classes/$FILE.sc "$DEST/Classes/$FILE.sc"

		# Help files
		install -Dm755 ./sc/HelpSource/Classes/$FILE.schelp "$DEST/HelpSource/Classes/$FILE.schelp"

		# Compiled .so files
		install -Dm755 ./$FILE/build/$FILE.so "$DEST/$FILE.so"
	done
}
