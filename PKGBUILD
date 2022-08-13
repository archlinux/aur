# Maintainer: Daniel Menelkir <dmenelkir at gmail dot com>
# Contributor: Tom < reztho at archlinux dot us >

pkgname=openmsx-catapult
pkgver=18.0
pkgrel=4
pkgdesc="Front-end for openMSX: the MSX emulator that aims for perfection."
arch=('i686' 'x86_64')
url="http://openmsx.org"
license=('GPL')
depends=('libxml2' 'wxwidgets-gtk2' 'zlib' 'libjpeg' 'libpng' 'libtiff' "openmsx=${pkgver}")
makedepends=('python')
provides=("openmsx-catapult")
conflicts=("openmsx-catapult-git")
source=("https://github.com/openMSX/wxcatapult/archive/RELEASE_${pkgver//./_}.tar.gz"
        "wx3-fix.diff")
md5sums=('72c626bb16d46b5e6e77bbb0b0fe8be5'
         '66a3eb8a659fe49ec1da94dc171124f6')

build() {
  cd "wxcatapult-RELEASE_${pkgver//./_}"

  # Catapult uses wxwidgets-gtk2
  sed -i 's@wx-config@wx-config-gtk2@' build/probe.mk
  sed -i 's@wx-config@wx-config-gtk2@' build/main.mk

  # Changing some default configurations
  sed -i 's@SYMLINK_FOR_BINARY:=true@SYMLINK_FOR_BINARY:=false@' build/custom.mk
  sed -i 's@/opt/openMSX-Catapult@/usr/share/openmsx-catapult@' build/custom.mk
  sed -i 's@/opt/openMSX/bin/openmsx@/usr/bin/openmsx@' build/custom.mk
  sed -i 's@/opt/openMSX/share@/usr/share/openmsx@' build/custom.mk
  echo 'INSTALL_DOC_DIR:=/usr/share/doc/openmsx-catapult' >> build/custom.mk
  echo 'INSTALL_SHARE_DIR:=/usr/share/openmsx-catapult' >> build/custom.mk
  echo 'INSTALL_BINARY_DIR:=/usr/bin' >> build/custom.mk

  # Fixes WX Issues. Thanks @pjag
  patch --forward --strip=1 --input="${srcdir}/wx3-fix.diff"

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

