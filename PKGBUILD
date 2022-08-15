# Maintainer: Dominik Wetzel <dimonok@web.de>
# Contributors: Julian Eckhardt <julian@eckhardt.fi>, Paulo Marcos <contato-myghi63@protonmail.com>
pkgname=kyocera_universal
pkgver=9.1.20220203
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
DLAGENTS=("https::/usr/bin/wget")
toDwnld="KyoceraLinuxPackages_${date}_tar_gz.download.gz"
source=("https://www.kyoceradocumentsolutions.us/content/download-center-americas/us/drivers/drivers/${toDwnld}")
install=kyodialog-bin.install
md5sums=('6bc001940c9d4cb8e287bf23f708008c')

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
  # Remove unnecessary stuff
  cd $srcdir
  rm -r usr/share/kyocera${major}.${minor}/Python || rm -r usr/share/kyocera${major}/Python
  rm -r usr/share/applications
  rm -r usr/share/kyocera${major}.${minor}/appicon_H.png || rm usr/share/kyocera${major}/appicon_H.png
  rm usr/bin/kyodialog${major}.${minor} || rm usr/bin/kyodialog${major}
  install -D -m644 "usr/share/doc/kyodialog/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/COPYRIGHT"
  rm -r ${srcdir}/usr/share/doc
  cd $pkgdir
  cp -r $srcdir/usr .  
}
