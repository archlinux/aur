# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: Frederic Bezies < fredbezies at gmail dot com>
# Contributor: garion < garion @ mailoo.org >
# Contributor: Alessio Sergi <asergi at archlinux dot us>

pkgname=iscan
pkgver=2.30.4.2
pkgrel=3
pkgdesc="EPSON Image Scan! front-end for scanners and all-in-ones"
arch=('x86_64')
url="http://download.ebz.epson.net/dsc/search/01/search/?OSC=LX"
license=('GPL2' 'custom:AVASYSPL')
depends=('gtk2' 'sane' 'libstdc++5')
provides=('iscan')
conflicts=('iscan-for-epson-v500-photo' 'epson-perfection-v10-v100-scanner-driver-aio')
makedepends=('gettext' 'gimp')
optdepends=('iscan-data: Image Scan! data files required for some devices')
source=("http://support.epson.net/linux/src/scanner/iscan/${pkgname}_${pkgver%.*}-${pkgver/*.}.tar.gz"
        "libpng15.patch"
        "jpegstream.cc.patch"
        "epkowa.conf"
		"hain01commits2dip-obj.patch"
		"iscan-2.30.4.2-c99.patch"
		"iscan-2.30.3_fix-sscanf-modifier-in-cfg-obj.patch")
sha256sums=('597b9913de42d7a27f95bc82e533cbe778121ba13e3a03bc037f8d09a43447d5'
            '99122594e3028526c51e13ab83349429a371bfea08ce47a3345fddacbe5cee3c'
            '44990a5264e530a7a8ad1f95524e5d70e4f0f9009c53c8ea593cedf8d861a669'
            '8e9e90fa50f1bd476b13766b19f100470c41dd253dc0605fbb1d0ac346a0beff'
			'54ea1cbe2003c5ddd99fc2b548a1038beb2627edfed74f85e9f1c29f814a1ba5'
			'SKIP'
			'SKIP')
install="${pkgname}.install"
backup=("etc/sane.d/epkowa.conf")

prepare() {
  cd "${pkgname}-${pkgver%.*}"
  # patch for building iscan against libpng15 by giovanni
  patch -Np0 -i "../libpng15.patch"
  # patch for ambiguous div in jpegstream.cc
  patch -Np0 -i "../jpegstream.cc.patch"
  # patch for 16color by hain01 
  patch -Np0 -i "../hain01commits2dip-obj.patch"
  
  patch -Np0 -i "../iscan-2.30.4.2-c99.patch"
  patch -Np0 -i "../iscan-2.30.3_fix-sscanf-modifier-in-cfg-obj.patch"
  # add fix for CXX ABI different than 1002
  ln -s libesmod-x86_64.c2.so non-free/libesmod-x86_64.so
}

build() {
  cd "${pkgname}-${pkgver%.*}"
  export LDFLAGS="${LDFLAGS} -ldl -lpng16"
  ./configure --prefix=/usr \
              --sbindir=/usr/bin \
              --enable-dependency-reduction \
              --enable-frontend \
              --enable-jpeg \
              --enable-tiff \
              --enable-png \
              --enable-gimp
  make
}

package() {
  cd "${pkgname}-${pkgver%.*}"

  # install files
  make DESTDIR="${pkgdir}" install

  # install sane configuration files
  install -m 755 -d "${pkgdir}/etc/sane.d"
  install -m 644 -D "backend/epkowa.conf" "${pkgdir}/etc/sane.d/"
  install -m 755 -d "${pkgdir}/etc/sane.d/dll.d"
  install -m 644 "${srcdir}/epkowa.conf" "${pkgdir}/etc/sane.d/dll.d/"

  # install desktop file
  install -m 755 -d "${pkgdir}/usr/share/applications"
  install -m 644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/"

  # install license
  install -m 755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m 644 "non-free/COPYING.EPSON.en.txt" "${pkgdir}/usr/share/licenses/${pkgname}/AVASYSPL"

  # install plugin for GIMP
  install -m 755 -d "${pkgdir}/usr/lib/gimp/2.0/plug-ins"
  ln -s "/usr/bin/iscan" "${pkgdir}/usr/lib/gimp/2.0/plug-ins/"
}

