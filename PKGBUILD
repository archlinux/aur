# maintainer: x2416 <x2416x at gmail dot com>

# Most of this sourced from PKGBUILD found here -- https://gist.github.com/georgyo/d5c82709ec944a785976/revisions

# This is based heavily on work found posted four years ago 
# on github by georgyo (George Shammas) but updated to use current version found 
# on startechs website. Enjoy!

# This works on notecons02 and notecons01.

# ---------------------------------------------------
# Defines
# ---------------------------------------------------
pkgname=startech-usb-crash-cart-adapter
pkgver=20150921
pkgrel=1
pkgdesc='StarTech usb crash cart adapter notecons software'
arch=('x86_64')
url='http://www.startech.com/Server-Management/KVM-Switches/USB-Crash-Cart-Adapter~NOTECONS02'
license=('unknown')

# makedepends -- this package requires rpmextract to create files necessary from the RPM included in download file
makedepends=('rpmextract')

# Source file, md5sum
source=('http://sgcdn.startech.com/005329/media/sets/NOTECONS02_Drivers/NOTECONS02%20Software%20Pack.zip')
md5sums=('2b7597b5cd6cbf83f57b647d90696cae')
noextract=('NOTECONS02%20Software%20Pack.zip')

prepare() {
  # unzip the file we just downloaded
  unzip ../'NOTECONS02%20Software%20Pack.zip'

  # rpmextract can't handle spaces so we move the file to something without spaces.
  mv "Linux RPM/Linux Install 64bit.rpm" LinuxInstall64bit.rpm
}

package() {
  # Change directory into pkg where we'll do our business
  cd $pkgdir

  # Extract the files inside the rpm we moved into place during the prepare phase
  rpmextract.sh "${srcdir}/LinuxInstall64bit.rpm"

  # Copy /usr/lib/libz.so to opt/usb-crash-cart-adapter/${pkgver}/guts/libz.so.1.2.3.3
  install /usr/lib/libz.so opt/usb-crash-cart-adapter/${pkgver}/guts/libz.so.1.2.3.3

  # Copy /usr/lib/libz.so to opt/usb-crash-cart-adapter/${pkgver}/guts/libz.so.1
  install /usr/lib/libz.so opt/usb-crash-cart-adapter/${pkgver}/guts/libz.so.1  

  # Install files that match the following pattern into usr/lib/udev/rules.d
  install -D -t usr/lib/udev/rules.d opt/usb-crash-cart-adapter/${pkgver}/12-dcc*-install.rules

  # Make sure the destination path exists up until the last DEST, and then copy SRC to DEST
  # This puts the icon in place on certain window managers
  install -D opt/usb-crash-cart-adapter/${pkgver}/main-18235253.net-icon.desktop usr/share/applications/usb-crash-cart-adapter.desktop

  # This copies the wrapper program to be extracted to usr/bin/usb-crash-cart-adapter
  install -D opt/usb-crash-cart-adapter/${pkgver}/wrapper usr/bin/usb-crash-cart-adapter

  # Remove .DS_Store file that some numb-numb put inside the RPM @ startech.com
  rm .DS_Store
}

post_install() {
  # after install, call udevadm trigger to read for updates
  udevadm trigger
}

post_upgrade() {
  # after upgrade, call udevadm trigger to read for updates
  udevadm trigger
}
