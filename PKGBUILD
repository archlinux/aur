# Maintainer: Étienne Deparis <etienne@depar.is>

pkgname=ecofax
pkgver=1.1.2
pkgrel=3
pkgdesc="OVH software to Receive Fax and send them by printing on a virtual printer"
url="http://www.ovhtelecom.fr/fax/logiciel-ecofax.xml"
license=('custom')
arch=('i686' 'x86_64')
_arch='i386'
if [ "$CARCH" = "x86_64" ]; then
  _arch='x86_64'
  md5sums=('31a34459932cc8abf3b9b85702756fca')
  depends=('lib32-fontconfig' 'lib32-libsm' 'lib32-libxext' 'lib32-gcc-libs')
else
  md5sums=('b85d9372b61c772f48bb1d7fb340d0d1')
fi
depends+=('cups' 'xdg-utils' 'qt4')
source=("http://mir7.ovh.net/ovh-applications/EcoFax/${pkgver}/EcoFax-${pkgver}.${_arch}.deb"
	'ecofax.install')
md5sums+=('b2e614d4b7902c82e1b6985d84f73a4a')

build() {

  msg2 'Extract files from deb archive'
  cd $srcdir
  tar xzf data.tar.gz

  msg2 'Patching EcoFax script'
  sed -i "s|LD_LIBRARY_PATH=/usr/lib/ecofax/|LD_LIBRARY_PATH='/usr/lib/ecofax:/usr/lib'|" usr/bin/EcoFax
  sed -i "s|/\.\$appname-bin|/\$appname-bin|" usr/bin/EcoFax

  msg2 'Patching EcoFax desktop file'
  sed -i "s|Version=1.1.0|Version=${pkgver}|" usr/share/applications/ecofax.desktop
  sed -i "s|Exec=/usr/bin/EcoFax|Exec=${pkgname}|" usr/share/applications/ecofax.desktop
  sed -i "s|Icon=/usr/share/icons/EcoFax.png|Icon=/usr/share/pixmaps/EcoFax.png|" usr/share/applications/ecofax.desktop

  msg2 'Extract license file'
  gzip -d usr/share/doc/ecofax/license-en.txt.gz
}

package() {
  install -dm 755 $pkgdir/usr/{bin,lib/ecofax,lib/cups/backend}
  install -dm 755 $pkgdir/usr/share/{pixmaps,applications,licenses/ecofax}

  install -Dm 755 $srcdir/usr/bin/EcoFax                        $pkgdir/usr/bin/ecofax
  install -Dm 755 $srcdir/usr/bin/.EcoFax-bin                   $pkgdir/usr/bin/ecofax-bin

  mv              $srcdir/usr/lib/ecofax/*                      $pkgdir/usr/lib/ecofax/
  install -Dm 500 $srcdir/usr/lib/cups/backend/ecofaxcb         $pkgdir/usr/lib/cups/backend/

  install -Dm 644 $srcdir/usr/share/icons/EcoFax.png            $pkgdir/usr/share/pixmaps/
  install -Dm 644 $srcdir/usr/share/applications/ecofax.desktop $pkgdir/usr/share/applications/
  install -Dm 644 $srcdir/usr/share/doc/ecofax/license-en.txt   $pkgdir/usr/share/licenses/ecofax/LICENSE
}
