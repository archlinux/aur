# Maintainer: Dominik Wetzel <dimonok@web.de>
# Contributor: Julian Eckhardt <julian@eckhardt.fi>
pkgname=kyocera_universal
pkgver=5.0.0
pkgrel=1
pkgdesc="Kyocera Printing Package for many Kyocera printers (stripped of kdialog5)."
arch=('x86_64' 'i386')
url="https://www.kyocera.com/"
license=('other')
depends=('bash-completion' 'cups-filters' 'gcc-libs' 'krb5' 'libcups' 'libgcrypt' 'python2-reportlab' 'zlib' 'python2-pypdf2' 'python2' 'lib32-zlib' 'lib32-libcups' 'lib32-libdbus')
arch=('i686' 'x86_64')
makedepends=('unzip' 'wget')
DLAGENTS=("https::/usr/bin/wget")
toDwnld="KyoceraLinux_Phase5-2018.08.29" 
source=("https://cdn.kyostatics.net/dlc/de/driver/all/kyoceralinuxpackages-20160420-upd-v3.-downloadcenteritem-Single-File.downloadcenteritem.tmp/${toDwnld}" 
python2.patch)
install=kyodialog-bin.install
md5sums=('0fbc4ddc4ed392dd92f42a119d01072f'
	 '9a439ff46454c2b0f7c4d2411ba2237e')

if [ "$arch" == "x86_64" ]; then
  _arch="amd64"
else
  _arch="i386"
fi

###########################
# CHOOSE YOUR REGION HERE #
###########################
Region="EU"
# Region="Global"

prepare() {
  cd $srcdir
  tar xzf KyoceraLinux-Phase5-2018.08.29.tar.gz -C .
  ar xv Debian/${Region}/kyodialog_${_arch}/kyodialog_5.0-0_${_arch}.deb
  tar xzf data.tar.gz -C .
  patch -Np0 -i python2.patch
}

package() {
  # Remove unnecessary stuff
  cd $srcdir
  rm -r usr/share/kyocera5/Python
  rm -r usr/share/applications
  rm usr/share/kyocera5/appicon_F.png
  rm usr/bin/kyodialog5
  install -D -m644 "usr/share/doc/kyodialog/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/COPYRIGHT"
  rm -r ${srcdir}/usr/share/doc
  cd $pkgdir
  cp -r $srcdir/usr .  
}
