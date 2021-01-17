# Maintainer: Thomas Holder <thomas at thomas-holder dot de>
# Contributor: detrito <detrito at inventati dot org>
# Contributor: Rodrigo Severo <rsev at protonmail dot com>

pkgname='therion'
pkgver='5.5.6'
pkgrel='2'
pkgdesc="Cave surveying: processes survey data and generates maps or 3D models of caves"
arch=('x86_64' 'i686')
url="http://therion.speleo.sk"
license=('GPL2')
changelog='CHANGELOG'

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
	'wxgtk3'
	'zlib'
)

makedepends=(
	'perl'
)

source=(
	"http://github.com/therion/therion/archive/v${pkgver}.tar.gz"
	'therion_ini.patch'
)

sha256sums=(
	'2b15241877d49d60825e446004f5c7c49bf0f1ba3ef33483d457d4b4d18c9f98'
	'0639b0c4c9660af33675bf948ca4678d441167f77f7818cc015b7738a53fb8f3'
)

backup=(
	etc/therion.ini
	etc/xtherion.ini
)

prepare() {
  cd "${pkgname}-${pkgver}"

  # patch to get UTF8 and available fonts
  patch -p0 -i ${srcdir}/therion_ini.patch
}

build() {
  cd "${pkgname}-${pkgver}"
 
  export WX_CONFIG="wx-config-gtk3"

  # avoid parallel-execution errors
  make version thchencdata.h thmpost.h
  make therion
  make PREFIX=/usr
}
 
package() {
  cd "${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" PREFIX=/usr SYSCONFDIR=/etc install

  rm -f "${pkgdir}/etc/"*.new
}


