# Maintainer: Rodrigo Severo <rsev at protonmail dot com>
# Contributor: detrito <detrito at inventati dot org>
# Contributor: Thomas Holder <thomas at thomas-holder dot de>

pkgname='therion'
pkgver='5.4.4'
pkgrel='5'
pkgdesc="Cave surveying: processes survey data and generates maps or 3D models of caves"
arch=('x86_64' 'i686')
url="http://therion.speleo.sk"
license=('GPL2')
changelog='CHANGELOG'

# avoid parallel-execution errors
MAKEFLAGS="-j1"

depends=(
	'bwidget' 
	'freetype2'
	'glu' 
	'imagemagick' 
	'libjpeg-turbo' 
	'libpng' 
	'python'
	'texlive-core' 
	'tk'
	'tkimg'
	'vtk' 
	'webkitgtk2' 
	'wxgtk' 
	'zlib'
)

makedepends=(
	'perl'
)

source=(
	"http://github.com/therion/therion/archive/v${pkgver}.tar.gz"
	'loch_vtk7.patch'
	'make_install.patch'
	'therion_ini.patch'
)

sha256sums=(
	'5d3d79157a23e8758e9259425d706b9d7861993971ba630525e1665574024d85'
	'81cd6c75a74897831edd4116bb97c71090023abbb14725b96d2a219f67cb5613'
	'4dbff0ae39877078e295c90b0e7b7fce4b39a910546ed09e79eaf64c903bf1b4'
	'0639b0c4c9660af33675bf948ca4678d441167f77f7818cc015b7738a53fb8f3'
)

prepare() {
  cd "${pkgname}-${pkgver}"

  # patch to compile loch with VTK 7.1
  patch -p0 -i ${srcdir}/loch_vtk7.patch

  # patch to install in $pkgdir
  patch -p0 -i ${srcdir}/make_install.patch

  # patch to get UTF8 and available fonts
  patch -p0 -i ${srcdir}/therion_ini.patch
  
  # path to fix loch compilation
  sed -i.bak 's/-DLXLINUX//' loch/Makefile
  sed -i.bak 's/^POBJECTS =.*/POBJECTS =/' loch/Makefile
  sed -i.bak 's/freetype-config --cflags/pkg-config --cflags freetype2/' loch/Makefile
}

build() {
  cd "${pkgname}-${pkgver}"
 
  make PREFIX=/usr
}
 
package() {
  cd "${pkgname}-${pkgver}"
  make PREFIX="${pkgdir}" install
}


