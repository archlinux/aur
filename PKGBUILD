# Maintainer: Mads Kjeldgaard <mail@madskjeldgaard.dk>
# Maintainer: Bruno Gola <me@bgo.la>
pkgname=supercollider-flucoma
pkgver=1.0.6
pkgrel=1
pkgdesc='Fluid Corpus Manipulation plugins for Supercollider'
arch=('any')
url='https://github.com/flucoma/flucoma-sc'
license=('GPL')
groups=('pro-audio' 'supercollider-plugins')
depends=('supercollider')
makedepends=('git' 'cmake' 'boost' 'supercollider-headers-git' 'python-schema' 'python-jinja' 'python-docutils')
conflicts=("supercollider-flucoma")
optdepends=()
source=("$pkgname-$pkgver-$pkgrel.zip::https://github.com/flucoma/flucoma-sc/archive/refs/tags/${pkgver}.tar.gz")
md5sums=('5c1763381e276579cef596c2319ee4f7')


build() {
		DEST="$pkgdir/usr/share/SuperCollider/Extensions"
		SC_SRC="/usr/share/supercollider-headers"

		cd "$srcdir/flucoma-sc-${pkgver}"
		mkdir build
		cd build

		# These will be removed if the build script detects arm architectures
		ARM_EXCLUDE=("FluidSines"  "FluidBufSines" "FluidAudioTransport" "FluidBufAudioTransport" "FluidNoveltySlice"  "FluidBufNoveltySlice" "FluidTransients"  "FluidBufTransients" "FluidTransientSlice"  "FluidBufTransientSlice" "FluidNMFMorph")

		if [ "$CARCH" == "x86_64" ]; then
			cmake -DSYSTEM_BOOST=On -DSC_PATH=$SC_SRC -DCMAKE_INSTALL_PREFIX=$DEST ..
		else
			# Remove incompatible plugins on non x86 architectures
			for PLUG in "${ARM_EXCLUDE[@]}"; do rm -rfv "../src/$PLUG"; done
			cmake -DSYSTEM_BOOST=On -E env CXXFLAGS="-D__arm64=1 -fPIC" cmake -DSC_PATH=$SC_SRC -DCMAKE_INSTALL_PREFIX=$DEST ..
		fi

		make

}

package() {
	cd "$srcdir/flucoma-sc-${pkgver}/build"
	cmake --build . --config Release --target install
}
