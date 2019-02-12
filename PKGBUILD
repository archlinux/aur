# Contributor: chrisl echo archlinux@c2h0r1i2s4t5o6p7h8e9r-l3u4n1a.com|sed 's/[0-9]//g'

pkgname=cemu
pkgver=1.15.2
pkgrel=3
pkgdesc="Wii U emulator (via wine). Includes the Cemuhook plugin and graphic packs"
arch=(x86_64)
url="http://cemu.info/"
license=('custom')
depends=('wine' 'winetricks')
_graphicpackver=251
_cemuhookver=1140_0570
source=(
  cemu.sh
  cemu.xpm
  cemu.desktop
  http://cemu.info/releases/cemu_${pkgver}.zip
  https://files.sshnuke.net/cemuhook_${_cemuhookver}.zip
  https://github.com/slashiee/cemu_graphic_packs/releases/download/Travis${_graphicpackver}/graphicPacks${_graphicpackver}.zip
)
noextract=("cemuhook_${_cemuhookver}.zip"
           "graphicPacks${_graphicpackver}.zip")
install=${pkgname}.install

# If the cemuhook md5 is wrong, is because the cemuhook team every once in a while
# updates the cemuhook zip file, but without giving it a new name. And that new file has, of course, a different md5.
# If you notice this, please mark this package as out-of-date in the aur website and I'll fix it.
md5sums=('bf4a05c4f1d6063ed6bb90b66b2eca7d'
         '54d70005a8975812ab54fcfef53f7bde'
         '4906f28ba332aab4a3f70f9c7e4e1c87'
         'e74c1b00771f7f0417bc72459e3d072a'
         '4493f98caac981512517916e67a24f9f'
         'f827a4fed5249ef4a35a70bd665c6956')

options=(!strip)

build() {
  cd $srcdir/
  cd cemu_$pkgver
  bsdtar -x -f $srcdir/cemuhook_${_cemuhookver}.zip
  cd graphicPacks
  bsdtar -x -f $srcdir/graphicPacks${_graphicpackver}.zip
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

