# Maintainer: Dominik Wetzel <dimonok@web.de>
# Contributors: Julian Eckhardt <julian@eckhardt.fi>, Paulo Marcos <contato-myghi63@protonmail.com>
pkgname=kyocera_universal
pkgver=9.0.0
pkgrel=1
pkgdesc="Kyocera Printing Package for many Kyocera printers (stripped of kdialog9)."
arch=('x86_64' 'i686')
url="https://www.kyocera.com/"
license=('other')
depends=('cups-filters' 'dbus' 'gcc-libs' 'glibc' 'krb5' 'libcups' 'libgcrypt' 'python-reportlab' 'python-setuptools' 'zlib')
makedepends=('unzip' 'wget')
DLAGENTS=("https::/usr/bin/wget")
toDwnld="KyoceraLinuxPackages_20210527_tar_gz.download.gz"
source=("https://www.kyoceradocumentsolutions.us/content/download-center-americas/us/drivers/drivers/${toDwnld}")
install=kyodialog-bin.install
md5sums=('5079cb91b5a62e51817740187d12cad4')

if [ "$arch" == "x86_64" ]; then
  _arch="amd64"
else
  _arch="i386"
fi

major=${pkgver%.*.*}

###########################
# CHOOSE YOUR REGION HERE #
###########################
# Region="EU"
Region="Global"

prepare() {
  cd $srcdir
  tar xzf ${toDwnld} -C .
  ar xv Debian/${Region}/kyodialog_${_arch}/kyodialog_${major}.0-0_${_arch}.deb
  tar xzf data.tar.gz -C .
}

package() {
  # Remove unnecessary stuff
  cd $srcdir
  rm -r usr/share/kyocera${major}/Python
  rm -r usr/share/applications
  rm usr/share/kyocera${major}/appicon_H.png
  rm usr/bin/kyodialog${major}
  install -D -m644 "usr/share/doc/kyodialog/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/COPYRIGHT"
  rm -r ${srcdir}/usr/share/doc
  cd $pkgdir
  cp -r $srcdir/usr .  
}
