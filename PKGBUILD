# Maintainer: Mantas Mikulėnas <grawity@gmail.com>
pkgname=libclassicclient
_luxver=1.1.0
pkgver=7.2.0_b04
pkgrel=2
pkgdesc="Gemalto PKCS#11 driver"
url="https://www.luxtrust.lu/en/simple/225"
arch=(i686 x86_64)
depends=(
  gcc-libs
  gdk-pixbuf2
  gtk2 # for CCChangePinTool
  libusb-compat
  openssl-1.0'>=1.0.2.k-4'
  pcsclite
  qt5-base # for SecureFooDialog
)
optdepends=(
  "luxtrust-middleware: LuxTrust software for web authentication"
)
source=("https://www.luxtrust.lu/downloads/middleware/eula.pdf")
source_i686=("https://www.luxtrust.lu/downloads/middleware/LuxTrust_Middleware_${_luxver}_Ubuntu_32bit.tar.gz")
source_x86_64=("https://www.luxtrust.lu/downloads/middleware/LuxTrust_Middleware_${_luxver}_Ubuntu_64bit.tar.gz")
sha256sums=('4c9b71b596900700cdbf8f1515df44d9383fd5f336114e38cebfffc30d74f564')
sha256sums_i686=('771195d2cd48a56ee70b2826fa1c008fed8925ad29dddd46fff155e6d474e775')
sha256sums_x86_64=('e1f77f5c1eaa479395a62106db0ec4b3aa0df45d428ebe790982159ec6f55283')

prepare() {
  case $CARCH in
    i686)
      bsdtar -xf Gemalto_Middleware_Ubuntu_32bit_${pkgver/_/-}.deb;;
    x86_64)
      bsdtar -xf Gemalto_Middleware_Ubuntu_64bit_${pkgver/_/-}.deb;;
  esac

  bsdtar -xf data.tar.xz
}

package() {
  case $CARCH in
    i686)
      cd Gemalto_Middleware_Ubuntu_32bit_${pkgver/_/-};;
    x86_64)
      cd Gemalto_Middleware_Ubuntu_64bit_${pkgver/_/-};;
  esac

  cp -a etc usr "$pkgdir"/

  # now clean up the mess

  cd "$pkgdir"

  chmod a-x etc/udev/rules.d/*
  chmod a+x usr/lib/**/*.so

  mkdir -p usr/lib/udev/rules.d
  mv etc/udev/rules.d/* usr/lib/udev/rules.d/

  mkdir -p usr/share/p11-kit/modules
  # XXX: remove after arojas fixes the openssl 1.0 mess
  { echo "module: libgclib.so";
    echo "remote: |env LD_LIBRARY_PATH=/usr/lib/openssl-1.0-compat /usr/lib/pkcs11/libgclib.so"
  } > usr/share/p11-kit/modules/$pkgname.module
}

# vim: ft=sh:ts=2:sw=2:et:nowrap
