# Maintainer: Daniel Menelkir <dmenelkir at gmail dot com>
# Contributor: Tom < reztho at archlinux dot us >

pkgname=openmsx
pkgver=19.1
pkgrel=1
pkgdesc="The MSX emulator that aims for perfection."
arch=('i686' 'x86_64')
url="http://openmsx.org/"
license=('custom')
depends=('libxml2' 'sdl' 'sdl_image' 'sdl2_ttf' 'tcl' 'libpng' 'zlib' 'glew' 'libgl')
optdepends=('python' 'jack-audio-connection-kit')
install=${pkgname}.install
provides=("openmsx")
conflicts=("openmsx-git")
source=("https://github.com/openMSX/openMSX/releases/download/RELEASE_${pkgver//./_}/${pkgname}-${pkgver}.tar.gz")
md5sums=('20d7eae3544f5c3d1cc1034712df0b4b')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Changing some default configurations...
  sed -i 's@SYMLINK_FOR_BINARY:=true@SYMLINK_FOR_BINARY:=false@' build/custom.mk
  sed -i 's@INSTALL_BASE:=/opt/openMSX@INSTALL_BASE:=/usr/share/openmsx@' build/custom.mk
  echo 'INSTALL_DOC_DIR:=/usr/share/doc/openmsx' >> build/custom.mk
  echo 'INSTALL_SHARE_DIR:=/usr/share/openmsx' >> build/custom.mk
  echo 'INSTALL_BINARY_DIR:=/usr/bin' >> build/custom.mk

  # Compiling
  ./configure
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  # Licenses
  mkdir -p "${pkgdir}/usr/share/licenses/openmsx"
  ln -s /usr/share/licenses/common/GPL2/license.txt "${pkgdir}/usr/share/licenses/openmsx/openmsx.txt"
  install -m 644 "${pkgdir}/usr/share/doc/openmsx/cbios.txt" "${pkgdir}/usr/share/licenses/openmsx/"
}

