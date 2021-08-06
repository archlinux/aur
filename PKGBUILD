# Maintainer: Mads Kjeldgaard <mail@madskjeldgaard.dk>
pkgname=supercollider-mi-ugens-git
pkgver=r91.b2607b9
pkgrel=3
pkgdesc="SuperCollider UGen versions of Mutable Instruments synthesizer modules"
arch=('any')
url="https://github.com/v7b1/mi-UGens"
license=('GPL')
groups=('pro-audio' 'supercollider-plugins' )
depends=()
makedepends=('git' 'cmake' 'gcc-libs' 'supercollider-headers-git')
optdepends=()
source=("$pkgname::git+$url.git")
md5sums=('SKIP')

# These should work on all architectures (MiRipples does not build on arm)
_folders_limited=("MiClouds" "MiGrids" "MiOmi" "MiWarps" "MiElements" "MiMu" "MiPlaits" "MiRings" "MiVerb")

# x86 exclusive 
_folders_full=("MiRipples")
_folders_full+=("${_folders_limited[@]}")

pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$pkgname"

	# Get dependencies
	git submodule update --init --recursive
	# Files to build
	SC_SRC="/usr/share/supercollider-headers"

	folders=()
	if [ "$CARCH" == "x86_64" ]; then
		folders=("${_folders_full[@]}")
	else
		folders=("${_folders_limited[@]}")
	fi

	for FOLDER in "${folders[@]}"
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
	folders=()
	if [ "$CARCH" == "x86_64" ]; then
		folders=("${_folders_full[@]}")
	else
		folders=("${_folders_limited[@]}")
	fi

	# Destination: System extension dir
	DEST="$pkgdir/usr/share/SuperCollider/Extensions/$pkgname/"
	mkdir -p $DEST/Classes $DEST/HelpSource/Classes

	cd "$pkgname"

	for FILE in "${folders[@]}"
	do
		# Class
		install -Dm755 ./sc/Classes/$FILE.sc "$DEST/Classes/$FILE.sc"

		# Help files
		install -Dm755 ./sc/HelpSource/Classes/$FILE.schelp "$DEST/HelpSource/Classes/$FILE.schelp"

		# Compiled .so files
		install -Dm755 ./$FILE/build/$FILE.so "$DEST/$FILE.so"
	done
}
