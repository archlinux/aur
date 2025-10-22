# Maintainer: Roland Plüss <roland@dragondreams.ch>
pkgname=('democap')
pkgbase=democap
pkgver=1.5
pkgrel=1
pkgdesc="Drag[en]gine motion capture using VR hardware"
arch=('any')
url="https://dragondreams.ch/index.php/democap"
license=('GPL-3.0-only')
depends=('dragengine'
         'hicolor-icon-theme'
         'xdg-utils')
makedepends=('git'
             'scons')
# nightly until arch package is properly set up
_commit='29eb6e6c77293cfb228da87e7a5282ff4aebf468'
_delgaVersion="nightly"
source=("${pkgname}-${pkgver}::git+https://github.com/LordOfDragons/democap.git?signed#commit=$_commit"
        "https://github.com/LordOfDragons/democap/releases/download/nightly/DEMoCap-$_delgaVersion.delga")
sha256sums=('c89f86518e0467f436e5ba992365b23422a03308e9d0cedf185bfeb1c1e32049'
            'b31398f0990e3f448d3d7b972ed2c7c908458267bdfdad09f02c6ae146490134')
# Roland Plüss (roland@dragondreams.ch)
# DragonDreams Build Bot (buildbot@dragondreams.ch)
validpgpkeys=('E0ECD22F5F70777588450034446C9C667CFC1DF3'
              'A58A91BCA5C3B2C34CD57ACB8040F88D27F1D0AA')
noextract=("DEMoCap-$_delgaVersion.delga")

build() {
	cd "democap-$pkgver"
	
	# copy pre-build DELGA file. we could also use the IGDE to build the DELGA
	# file but this pops up a UI (bad for build bots) or requires using the CI
	# version of the IGDE (good for build bots), which best uses the deigde-ci
	# docker image (https://hub.docker.com/r/lordofdragons/deigde-ci). but
	# getting this working is more complicate than simply downloading the DELGA
	# file and copying it to the build directory
	mkdir -p unix/src/build
	cp "$srcdir"/DEMoCap-$_delgaVersion.delga unix/src/build/DEMoCap.delga
}

package() {
	cd "democap-$pkgver"/unix
	scons version="$pkgver" --install-sandbox="$(realpath "$pkgdir")"
}
