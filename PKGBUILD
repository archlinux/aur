# Maintainer: Thomas Holder <thomas at thomas-holder dot de>
# Contributor: detrito <detrito at inventati dot org>
# Contributor: Rodrigo Severo <rsev at protonmail dot com>

pkgname='therion'
pkgver='6.0.3'
pkgrel='1'
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
	'cmake'
	'perl'
)

source=(
	"http://github.com/therion/therion/archive/v${pkgver}.tar.gz"
	'therion_ini.patch'
)

sha256sums=(
	'467c0029ac899a340cf0f71afbc6c01a21319d2abc7d8ab036167fa87c208d96'
	'0639b0c4c9660af33675bf948ca4678d441167f77f7818cc015b7738a53fb8f3'
)

backup=(
	etc/therion.ini
	etc/xtherion.ini
)

_builddir="build"
_sourcedir="${pkgname}-${pkgver}"

prepare() {
  cd "${pkgname}-${pkgver}"

  # patch to get UTF8 and available fonts
  patch -p0 -i ${srcdir}/therion_ini.patch
}

build() {
  cmake \
    -B "${_builddir}" \
    -S "${_sourcedir}" \
    -DwxWidgets_CONFIG_EXECUTABLE=$(which "wx-config-gtk3") \
    -DwxWidgets_wxrc_EXECUTABLE=$(which "wxrc-3.0") \
    -DCMAKE_INSTALL_PREFIX='/usr'

  make -C "${_builddir}"
}
 
package() {
  make -C "${_builddir}" DESTDIR="${pkgdir}" install/strip

  mkdir -p "${pkgdir}/etc"

  cp \
    "${_sourcedir}/therion.ini" \
    "${_sourcedir}/xtherion/xtherion.ini" \
    "${pkgdir}/etc"
}


