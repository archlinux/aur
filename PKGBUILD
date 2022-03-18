# Maintainer: Mads Kjeldgaard<mail@madskjeldgaard.dk>
pkgname=supercollider-flucoma-git
pkgver=r1375.f171d57
pkgrel=2
pkgdesc='Fluid Corpus Manipulation plugins for Supercollider'
arch=('any')
url='https://github.com/flucoma/flucoma-sc'
license=('GPL')
groups=('pro-audio' 'supercollider-plugins')
depends=('supercollider')
makedepends=('git' 'cmake' 'supercollider-headers-git')
conflicts=("supercollider-flucoma")
optdepends=()
source=(
	"$pkgname"::git+$url.git
	"flucoma-core"::git+https://github.com/flucoma/flucoma-core.git
	)
md5sums=('SKIP'
         'SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {

		DEST="$pkgdir/usr/share/SuperCollider/Extensions"
		SC_SRC="/usr/share/supercollider-headers"
		FLUCOMA_CORE=$srcdir/flucoma-core

		cd "$srcdir/$pkgname"
		mkdir build; cd build

		git submodule update --init --recursive

		# These will be removed if the build script detects arm architectures
		ARM_EXCLUDE=("FluidSines"  "FluidBufSines" "FluidAudioTransport" "FluidBufAudioTransport" "FluidNoveltySlice"  "FluidBufNoveltySlice" "FluidTransients"  "FluidBufTransients" "FluidTransientSlice"  "FluidBufTransientSlice" "FluidNMFMorph")

		if [ "$CARCH" == "x86_64" ]; then
			cmake -DSYSTEM_BOOST=On -DFLUID_PATH=$FLUCOMA_CORE -DSC_PATH=$SC_SRC -DCMAKE_INSTALL_PREFIX=$DEST ..
		else
			# Remove incompatible plugins on non x86 architectures
			for PLUG in "${ARM_EXCLUDE[@]}"; do rm -rfv "../src/$PLUG"; done
			cmake -DSYSTEM_BOOST=On -E env CXXFLAGS="-D__arm64=1 -fPIC" cmake -DFLUID_PATH=$FLUCOMA_CORE -DSC_PATH=$SC_SRC -DCMAKE_INSTALL_PREFIX=$DEST ..
		fi

		make

}

package() {
	cd "$srcdir/$pkgname/build"
	cmake --build . --config Release --target install
}
