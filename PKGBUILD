# Maintainer: Muflone <muflone@vbsimple.net>

pkgname=iseriesaccess5
pkgver=5.4.0.1.6
pkgrel=1
_filever='5.4.0-1.6'
pkgdesc="IBM iSeries Access provides a 5250 emulator and others tools for IBM iSeries (formerly known as AS400). This package provides the version 5, compatible with older servers."
arch=(i686 x86_64)
url="http://www-03.ibm.com/systems/power/software/i/access/linux.html"
license=('custom')
makedepends=(zenity)
depends=(unixodbc xorg-fonts-75dpi xorg-fonts-100dpi desktop-file-utils libstdc++5)
optdepends=('rpm: diagnostic package information for cwbmedic')
provides=(iseriesaccess)
conflicts=(iseriesaccess)
install=package.install
source=(
        "file://iSeriesAccess-${_filever}.i386.rpm"
        "iseriesaccess_i686.conf"
        "iseriesaccess_x86_64.conf"
        "iseriesaccess.conf"
        "ibm5250"
        "ibm5250.png"
        "ibm5250.desktop"
        "setup5250"
        "setup5250.png"
        "setup5250.desktop"
       )
md5sums=(
         '68db7762f3c833127049c82b56d87227'
         '346745e55dca69c03bda3a5e9a6931e1'
         'e5bddef5fef091cc01c222cfafa49a8b'
         '588ba7d61aa2eedeb7c88641b87760f8'
         'a749197995b5e9ad488567dbea826be2'
         '58703c74e4908fbc4df41bc32e35ab51'
         '85bf8a1c091f59ef5357429161db1514'
         '06861ad18da3fefc73097a59054cf80a'
         '8b9a1d6ab9513699a95ababab85ba3c2'
         'f14cbb1cd9d72a29808978a64e1852e0'
        )
DLAGENTS=(
          "${DLAGENTS[@]}"
          'local::/bin/true'
          'file::/bin/ln -s "$(zenity --file-selection --title="Select resource for %u" --file-filter $(basename %u))" %o'
         )
_bindir='bin'

if [ "${CARCH}" = 'x86_64' ]
then
  source+=("file://iSeriesAccess-${_filever}.x86_64.rpm")
  md5sums+=('4e312bfbbdeb430d523317ca868d00d1')
  depends+=(lib32-libstdc++5 lib32-libxpm lib32-libxmu lib32-libxp lib32-openmotif lib32-unixodbc)
  _bindir='bin64'
else
  depends+=(openmotif)
fi

package() {
  msg2 "Installing files for the package..."
  cp -r opt "${pkgdir}"
  install -d "${pkgdir}/etc/ld.so.conf.d"
  install -m 644 -t "${pkgdir}/etc/ld.so.conf.d/" iseriesaccess_${CARCH}.conf

  msg2 "Creating configuration files..."
  install -d "${pkgdir}/etc/conf.d"
  install -m 644 -t "${pkgdir}/etc/conf.d" iseriesaccess.conf

  msg2 "Creating symlinks for executable..."
  install -d "${pkgdir}/usr/bin"
  for file in cwbcopwr cwbping cwbrunsql cwbtrc rmtcmd rmtodbc
  do
    ln -s /opt/ibm/iSeriesAccess/${_bindir}/${file} "${pkgdir}/usr/bin/"
  done
  install -m 755 -t "${pkgdir}/usr/bin" setup5250
  install -m 755 -t "${pkgdir}/usr/bin" ibm5250

  msg2 "Installing license file..."
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s /opt/ibm/iSeriesAccess/doc/license.txt "${pkgdir}/usr/share/licenses/${pkgname}/"

  msg2 "Installing icons..."
  install -d "$pkgdir/usr/share/pixmaps"
  install -m 644 -t "$pkgdir/usr/share/pixmaps" ibm5250.png
  install -m 644 -t "$pkgdir/usr/share/pixmaps" setup5250.png

  msg2 "Installing desktop files..."
  install -d "$pkgdir/usr/share/applications"
  install -m 644 -t "$pkgdir/usr/share/applications" ibm5250.desktop
  install -m 644 -t "$pkgdir/usr/share/applications" setup5250.desktop
}

