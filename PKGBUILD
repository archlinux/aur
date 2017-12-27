# Contributor: chrisl echo archlinux@c2h0r1i2s4t5o6p7h8e9r-l3u4n1a.com|sed 's/[0-9]//g'

pkgname=cemu
pkgver=1.11.2
pkgrel=5
pkgdesc="Wii U emulator (via wine). Includes the Cemuhook plugin and graphic packs"
arch=(x86_64)
url="http://cemu.info/"
license=('custom')
depends=('wine')
_graphicpackver=550
_cemuhookver=1112_0554
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

md5sums=('01118cf3e1ef9e453b5c56d2d27f6967'
         '54d70005a8975812ab54fcfef53f7bde'
         '9ca016ad209689c61d7a9ff8df4dd371'
         'bc180c58791ed4294293478e08408f3d'
         '5ad039a6542cbbe89d2cb94901f64d46'
         '980414f384c9ab1b7594f19b5a51d59c')

options=(!strip)

build() {
  cd $srcdir/
  cd cemu$pkgver
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
  cd cemu$pkgver
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

