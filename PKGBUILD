pkgname=startech-usb-crash-cart-adapter
pkgver=20150921
pkgrel=1
pkgdesc='StarTech usb crash cart adapter notecons software'
arch=('x86_64')
url='http://www.startech.com/Server-Management/KVM-Switches/USB-Crash-Cart-Adapter~NOTECONS02'
license=('unknown')
makedepends=('rpmextract')

source=('http://sgcdn.startech.com/005329/media/sets/NOTECONS02_Drivers/NOTECONS02%20Software%20Pack.zip')
md5sums=('2b7597b5cd6cbf83f57b647d90696cae')
noextract=('NOTECONS02%20Software%20Pack.zip')

prepare() {
  unzip ../'NOTECONS02%20Software%20Pack.zip'

  # rpmextract can't handle a filename with a space in it.
  mv "Linux RPM/Linux Install 64bit.rpm" LinuxInstall64bit.rpm
}

package() {
  cd $pkgdir
  rpmextract.sh "${srcdir}/LinuxInstall64bit.rpm"
  install /usr/lib/libz.so opt/usb-crash-cart-adapter/${pkgver}/guts/libz.so.1.2.3.3
  install /usr/lib/libz.so opt/usb-crash-cart-adapter/${pkgver}/guts/libz.so.1  
  install -D -t usr/lib/udev/rules.d opt/usb-crash-cart-adapter/${pkgver}/12-dcc*-install.rules
  install -D opt/usb-crash-cart-adapter/${pkgver}/main-18235253.net-icon.desktop usr/share/applications/usb-crash-cart-adapter.desktop
  install -D opt/usb-crash-cart-adapter/${pkgver}/wrapper usr/bin/usb-crash-cart-adapter
  rm .DS_Store
}

post_install() {
  udevadm trigger
}

post_upgrade() {
  udevadm trigger
}
