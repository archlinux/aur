# Maintainer: Roland Plüss <roland@dragondreams.ch>
pkgname=('democap')
pkgbase=democap
pkgver=1.9
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
_tag='v1.8'
_delgaVersion='1.8'
source=("${pkgname}-${pkgver}::git+https://github.com/LordOfDragons/democap.git#tag=$_tag"
        "https://github.com/LordOfDragons/democap/releases/download/v$_delgaVersion/DEMoCap-$_delgaVersion.delga")
sha256sums=('2ca9ed75757fabc29c238c1615c4d55cc5b2b1df8a373b0cfce73de60583ef93'
            '444457b4f1b2d059cd8795e0d55f74479569c401e2ed410822d561f352dde239')
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
