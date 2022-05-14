# Maintainer: Daniel Menelkir <dmenelkir at gmail dot com>
# Contributor: Tom < reztho at archlinux dot us >

pkgname=openmsx-catapult
pkgver=17.0
pkgrel=2
pkgdesc="Front-end for openMSX: the MSX emulator that aims for perfection."
arch=('i686' 'x86_64')
url="http://openmsx.org"
license=('GPL')
depends=('libxml2' 'wxgtk2' 'zlib' 'libjpeg' 'libpng' 'libtiff' "openmsx=${pkgver}")
makedepends=('python')
source=("https://github.com/openMSX/wxcatapult/archive/RELEASE_${pkgver//./_}.tar.gz")

build() {
  cd "wxcatapult-RELEASE_${pkgver//./_}"

  # Changing some default configurations...
  sed -i 's@SYMLINK_FOR_BINARY:=true@SYMLINK_FOR_BINARY:=false@' build/custom.mk
  sed -i 's@/opt/openMSX-Catapult@/usr/share/openmsx-catapult@' build/custom.mk
  sed -i 's@/opt/openMSX/bin/openmsx@/usr/bin/openmsx@' build/custom.mk
  sed -i 's@/opt/openMSX/share@/usr/share/openmsx@' build/custom.mk
  echo 'INSTALL_DOC_DIR:=/usr/share/doc/openmsx-catapult' >> build/custom.mk
  echo 'INSTALL_SHARE_DIR:=/usr/share/openmsx-catapult' >> build/custom.mk
  echo 'INSTALL_BINARY_DIR:=/usr/bin' >> build/custom.mk

  # Compiling
  make
}

package() {
  cd "wxcatapult-RELEASE_${pkgver//./_}"

  mkdir -p "${pkgdir}/usr/share/applications"
  make DESTDIR="${pkgdir}" install

  # Fixing the .desktop file
  sed -i 's@/usr/share/openmsx-catapult/bin/catapult@/usr/bin/catapult@' \
  "${pkgdir}/usr/share/applications/openMSX-Catapult.desktop"
  sed -i 's@/usr/share/openmsx-catapult/doc/@/usr/share/doc/openmsx-catapult/@' \
  "${pkgdir}/usr/share/applications/openMSX-Catapult.desktop"
}

md5sums=('8c2a09ec6bdc20684473540cfb4b1883')
