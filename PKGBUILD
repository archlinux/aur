# Maintainer: Mads Kjeldgaard<mail@madskjeldgaard.dk>
pkgname=supercollider-vstplugin-git
pkgver=r1714.13447dd
pkgrel=1
pkgdesc='The IEM vstplugin plugin for SuperCollider'
arch=('any')
url='https://git.iem.at/pd/vstplugin'
license=('GPL')
groups=('pro-audio' 'supercollider-plugins' 'supercollider-headers-git')
depends=('supercollider')
makedepends=('git' 'cmake')
optdepends=()
conflicts=("supercollider-vstplugin")
source=("$pkgname-$pkgver"::git+$url.git
        'supercollider-source::git+https://github.com/supercollider/supercollider.git')
md5sums=('SKIP'
         'SKIP')

pkgver() {
	cd "$srcdir/$pkgname-$pkgver"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
		SC_SRC="/usr/share/supercollider-headers"

		cd "$srcdir/$pkgname-$pkgver"
		git submodule update --init --recursive

		# Get VST2
		.git-ci/get_vst2.sh

		# Get VST3
		.git-ci/get_vst3.sh

		mkdir build; cd build
		DEST="$pkgdir/usr/share/SuperCollider/Extensions"

		cmake \
			-DSC=ON \ # Build SuperCollider extensions
			-DPD=OFF \ # Build Pure Data
			-DVST2=ON \ # Build VST2
			-DVST3=ON \ # Build VST3
			-DBUILD_HOST=ON \ # Build HOST
			-DBUILD_HOST32=OFF \ # 32 Bit host
			-DBRIDGE=ON \ # Bit bridge
			-DWINE=ON \
			-DSUPERNOVA=ON \
			-DSC_INCLUDEDIR=$SC_SRC \ 
			-DCMAKE_BUILD_TYPE=RELEASE \
			-DSC_INSTALLDIR=$DEST \ 
			..

		cmake --build . -j -v
		# make
}


package() {
	cd "$srcdir/$pkgname-$pkgver/build"
	cmake --build . -v -t install
	# cmake --build . --config Release --target install
}

