# Maintainer: Gustau Castells <karasu@antergos.com>

pkgname=lightdm-webkit2-greeter
pkgver=0.1.2
pkgrel=9
pkgdesc="A webkit2 greeter for LightDM"
arch=('i686' 'x86_64')
url="https://github.com/antergos/lightdm-webkit2-greeter"
license=('GPL3' 'LGPL3')
source=("$pkgname-$pkgver.tar.gz::https://github.com/antergos/lightdm-webkit2-greeter/archive/${pkgver}.tar.gz")
depends=('lightdm' 'webkit2gtk' 'gtk-engines' 'gtk3' 'dbus-glib')
provides=('lightdm-webkit2-greeter' 'lightdm-webkit-greeter')
conflicts=('lightdm-webkit-greeter')
replaces=('lightdm-webkit-greeter')
options=(!libtool)
install=greeter.install
backup=("etc/lightdm/${pkgname}.conf")
makedepends=('gnome-doc-utils' 'gobject-introspection' 'intltool' 'gnome-common')
sha256sums=('fe29a768817be38ea55bd3c4b74e3153129248bdcb52490e7fb91809e5ce0557')

build() {
  cd $srcdir/$pkgname-$pkgver
     LIBS+="-ljavascriptcoregtk-4.0" ./autogen.sh --prefix=/usr \
     --sysconfdir=/etc --libexecdir=/usr/lib/lightdm
   make
   
  # What is Ambiance? This should be a GTK+ 2.x theme, so we use Clearlooks here.
  sed -i '/^theme-name=/s/Ambiance/Adwaita/' data/lightdm-webkit2-greeter.conf

  # Theme 'default' does not exist...
  sed -i '/^webkit-theme=/s/default/antergos/' data/lightdm-webkit2-greeter.conf

  # this is Ubuntu branding... Replace it with something useful. ;)
  #sed -i '/^background=/s|/usr/share/backgrounds/warty-final-ubuntu.png||' data/lightdm-webkit2-greeter.conf
  # Replace Ubuntu font with Dejavusans
  sed -i '/^font-name=/s|Ubuntu 11|DejaVuSans 11|' data/lightdm-webkit2-greeter.conf

}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install 
}
