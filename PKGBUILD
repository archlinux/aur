# Maintainer: Dominik Wetzel <dimonok@web.de>
pkgname=kyocera_universal
pkgver=4.0.0
pkgrel=2
pkgdesc="Kyocera Printing Package for many Kyocera printers (stripped of kdialog4)."
arch=('x86_64' 'i386')
url="https://www.kyocera.com/"
license=('other')
depends=('bash-completion' 'cups-filters' 'gcc-libs' 'krb5' 'libcups' 'libgcrypt' 'python2-reportlab' 'zlib' 'python2-pypdf2' 'python2' 'lib32-zlib' 'lib32-libcups')
arch=('i686' 'x86_64')
makedepends=('unzip' 'wget')
DLAGENTS=("https::/usr/bin/wget")
toDwnld="KyoceraLinux_Ph..._2017.06.15.zip" 
source=("https://cdn.kyostatics.net/dlc/de/driver/all/kyoceralinuxpackages-20160420-upd-v3.-downloadcenteritem-Single-File.downloadcenteritem.tmp/${toDwnld}" 
python2.patch)
install=kyodialog-bin.install
md5sums=('b9f33db54d39d7d49b64564aae4ae559'
	 '531ee26ed3aed74140c99ca800f5c886')

if [ "$arch" == "x86_64" ]; then
  _arch="amd64"
else
  _arch="i386"
fi

# possible also "Global"
Region="EU" 

prepare() {
  cd $srcdir
  tar xzf Linux_Phase4_2017.06.15/KyoceraLinuxPackages-20170615.tar.gz -C .
  ar xv Debian/${Region}/kyodialog_${_arch}/kyodialog_4.0-0_${_arch}.deb
  tar xzf data.tar.gz -C .
  patch -Np0 -i python2.patch
}

package() {
  # Remove unnecessary stuff
  cd $srcdir
  rm -r usr/share/kyocera/Python
  rm -r usr/share/applications
  rm usr/share/kyocera/appicon_E.png
  rm usr/bin/kyodialog4
  install -D -m644 "usr/share/doc/kyodialog/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/COPYRIGHT"
  rm -r ${srcdir}/usr/share/doc
  cd $pkgdir
  cp -r $srcdir/usr .  
}
