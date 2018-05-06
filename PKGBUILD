# Contributor: chrisl echo archlinux@c2h0r1i2s4t5o6p7h8e9r-l3u4n1a.com|sed 's/[0-9]//g'

pkgname=cemu
pkgver=1.12.0
pkgrel=2
pkgdesc="Wii U emulator (via wine). Includes the Cemuhook plugin and graphic packs"
arch=(x86_64)
url="http://cemu.info/"
license=('custom')
depends=('wine' 'winetricks')
_graphicpackver=876
_cemuhookver=1116_0564
source=(
  cemu.sh
  cemu.xpm
  cemu.desktop
  http://cemu.info/releases/cemu_${pkgver}.zip
  https://files.sshnuke.net/cemuhook_${_cemuhookver}.zip
  https://github.com/slashiee/cemu_graphic_packs/releases/download/appveyor${_graphicpackver}/graphicPacks_2-${_graphicpackver}.zip
)
noextract=("cemuhook_${_cemuhookver}.zip"
           "graphicPacks_2-${_graphicpackver}.zip")
install=${pkgname}.install

# If the cemuhook md5 is wrong, is because the cemuhook team every once in a while
# updates the cemuhook zip file, but without giving it a new name. And that new file has, of course, a different md5.
# If you notice this, please mark this package as out-of-date in the aur website and I'll fix it.

md5sums=('bf4a05c4f1d6063ed6bb90b66b2eca7d'
         '54d70005a8975812ab54fcfef53f7bde'
         '805b6f74ed7183e72b2c8ddbcced168b'
         'f0f0b3e248811c4eadd751396e949048'
         '7f6a40cf882536e65be9afea741d55b4'
         '60ec574ad09956dec3c15d40696f0b18')

options=(!strip)

build() {
  cd $srcdir/
  cd cemu_$pkgver
  bsdtar -x -f ../../cemuhook_${_cemuhookver}.zip
  cd graphicPacks
  bsdtar -x -f ../../../graphicPacks_2-${_graphicpackver}.zip
}
package() {
  cd $srcdir
  install -d -m755 $pkgdir/usr/share/
  install -d -m755 $pkgdir/usr/share/$pkgname
  install -d -m755 $pkgdir/usr/bin
  install -m755 cemu.sh $pkgdir/usr/bin/$pkgname
  install -d -m755 $pkgdir/usr/share/applications
  install -d -m755 $pkgdir/usr/share/pixmaps
  install -m644 cemu.desktop $pkgdir/usr/share/applications
  install -m644 cemu.xpm $pkgdir/usr/share/pixmaps/cemu.xpm
  cd cemu_$pkgver
  install -m644 Cemu.exe $pkgdir/usr/share/$pkgname
  install -m644 dbghelp.dll $pkgdir/usr/share/$pkgname
  install -m644 keystone.dll $pkgdir/usr/share/$pkgname
  cp -R gameProfiles $pkgdir/usr/share/$pkgname
  cp -R graphicPacks $pkgdir/usr/share/$pkgname
  cp -R hfiomlc01 $pkgdir/usr/share/$pkgname
  cp -R mlc01 $pkgdir/usr/share/$pkgname
  cp -R shaderCache $pkgdir/usr/share/$pkgname
  find $pkgdir/usr/share/$pkgname -type f -exec chmod 644 {} \;
  find $pkgdir/usr/share/$pkgname -type d -exec chmod 755 {} \;
}

