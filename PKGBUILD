# Contributor: M0Rf30
# Maintainer: Lari Tikkanen

pkgname=lightdm-webkit-greeter
pkgver=1.0
pkgrel=1
pkgdesc="A lightweight display manager"
arch=('i686' 'x86_64')
url="https://launchpad.net/lightdm-webkit-greeter"
license=('GPL3' 'LGPL3')
source=("http://launchpad.net/lightdm-webkit-greeter/trunk/$pkgver/+download/$pkgname-$pkgver.tar.gz")
depends=('lightdm' 'webkitgtk' 'webkitgtk2' 'gtk-engines')
options=(!libtool)
makedepends=('gnome-doc-utils' 'gobject-introspection' 'intltool')
md5sums=('1df5d78cd7d0ee268ca83a678d1544ca')

build() {
  cd $srcdir/$pkgname-$pkgver
     LIBS+="-ljavascriptcoregtk-3.0" ./configure --prefix=/usr \
     --sysconfdir=/etc --libexecdir=/usr/lib/lightdm
   make
   
  # What is Ambiance? This should be a GTK+ 2.x theme, so we use Clearlooks here.
  sed -i '/^theme-name=/s/Ambiance/Clearlooks/' data/lightdm-webkit-greeter.conf

  # Theme 'default' does not exist...
  sed -i '/^webkit-theme=/s/default/webkit/' data/lightdm-webkit-greeter.conf

  # this is Ubuntu branding... Replace it with something useful. ;)
  sed -i '/^background=/s|/usr/share/backgrounds/warty-final-ubuntu.png||' data/lightdm-webkit-greeter.conf
  # Replace Ubuntu font with Dejavusans
  sed -i '/^font-name=/s|Ubuntu 11|DejaVuSans 11|' data/lightdm-webkit-greeter.conf
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install 
}
