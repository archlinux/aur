# Maintainer: Dominik Wetzel <dimonok [at] web [dot] de>
# Contributors: Julian Eckhardt <julian [at] eckhardt [dot] fi>, Paulo Marcos <contato-myghi63 [at] protonmail [dot] com>
pkgname=kyocera_universal
pkgver=9.4.20240521
pkgrel=1
major=$(cut -d '.' -f 1 <<< $pkgver)
minor=$(cut -d '.' -f 2 <<< $pkgver)
date=$(cut -d '.' -f 3 <<< $pkgver)
pkgdesc="Kyocera Printing Package for many Kyocera printers (stripped of kdialog${major})."
arch=('x86_64' 'i686')
url="https://www.kyocera.com/"
license=('other')
depends=('cups-filters' 'dbus' 'gcc-libs' 'glibc' 'krb5' 'libcups' 'libgcrypt' 'python-reportlab' 'python-setuptools' 'python-pypdf3' 'zlib')
makedepends=('unzip' 'wget')
provides=('kyocera-cups')
conflicts=('kyocera-cups')
DLAGENTS=("https::/usr/bin/wget")
toDwnld="KyoceraLinuxPackages_${date}_tar_gz.download.gz"
source=("https://www.kyoceradocumentsolutions.us/content/download-center-americas/us/drivers/drivers/${toDwnld}")
install=kyodialog-bin.install
sha256sums=('7f9f1ca91cef018a6e56f2210d86f16afa00d0bf06b33ac32c875e49dc5439ef')

if [ "$arch" == "x86_64" ]; then
  _arch="amd64"
else
  _arch="i386"
fi

###########################
# CHOOSE YOUR REGION HERE #
###########################
# Region="EU"
Region="Global"

prepare() {
  cd $srcdir
  tar xzf ${toDwnld} -C .
  ar xv Debian/${Region}/kyodialog_${_arch}/kyodialog_${major}.${minor}-0_${_arch}.deb
  tar xzf data.tar.gz -C .
}

package() {
  # Remove unnecessary stuff and move ppd files to appropriate folders
  cd $srcdir
  
  version=${major}
  KYOCERA_DIR=usr/share/kyocera${version}
  if [ ! -d $KYOCERA_DIR ]; then 
    version=${major}.${minor}
    KYOCERA_DIR=usr/share/kyocera${version}
  fi
  rm -r usr/share/applications
  
  ALTERNATE_PPD_DIRECTORY=usr/share/cups/model
  PRIMARY_PPD_DIRECTORY=usr/share/ppd/kyocera
  
  TEMP_PPD_DIRECTORY=${KYOCERA_DIR}/ppd${version}

  mkdir -p $PRIMARY_PPD_DIRECTORY
  mkdir -p $ALTERNATE_PPD_DIRECTORY
  mv $TEMP_PPD_DIRECTORY/* $PRIMARY_PPD_DIRECTORY

  chmod 755 usr/bin/kyoPPDWrite_H

  if [ ! -h $ALTERNATE_PPD_DIRECTORY/kyocera ]; then
      ln -s /$PRIMARY_PPD_DIRECTORY $ALTERNATE_PPD_DIRECTORY/kyocera
  fi
  
  rm -r ${KYOCERA_DIR}
  
  rm usr/bin/kyodialog${version}
  install -D -m644 "usr/share/doc/kyodialog/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/COPYRIGHT"
  rm -r ${srcdir}/usr/share/doc
  cd $pkgdir
  cp -r $srcdir/usr .  
}
