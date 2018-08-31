# Maintainer: Mantas Mikulėnas <grawity@gmail.com>
pkgname=libclassicclient
_luxver=1.2.1
pkgver=7.2.0_b04
pkgrel=5
pkgdesc="Gemalto PKCS#11 driver"
url="https://www.luxtrust.lu/en/simple/225"
arch=(i686 x86_64)
depends=(
  gcc-libs
  gdk-pixbuf2
  gtk2 # for CCChangePinTool
  libusb-compat
  openmp
  openssl-1.0'>=1.0.2.k-4'
  pcsclite
  qt5-base # for SecureFooDialog
)
optdepends=(
  "luxtrust-middleware: LuxTrust software for web authentication"
)
source_i686=("https://www.luxtrust.lu/downloads/middleware/LuxTrust_Middleware_${_luxver}_Ubuntu_32bit.tar.gz")
source_x86_64=("https://www.luxtrust.lu/downloads/middleware/LuxTrust_Middleware_${_luxver}_Ubuntu_64bit.tar.gz")
sha256sums_i686=('79ee2940496ffeed457eefb6b16013a1b5baa4b65f78bfa43411a3675445b579')
sha256sums_x86_64=('487c5f60a8dbb6212e24c41f9b80bf7d845bb13b29f129c96a7c3d070006cb80')

prepare() {
  # the main tarball sometimes gets updated without changing its version;
  # but all we want is the Gemalto .deb
  case $CARCH in
    i686)
      _hash=0620b7038153daaa62235adfee921fe9c57d6bd60a8260a705661843e1fd4e32
      _file=Gemalto_Middleware_Ubuntu_32bit_${pkgver/_/-}.deb;;
    x86_64)
      _hash=36e51990062c48e4ead8a25aff2b72b040dab7063e0c59190548ba05501ca159
      _file=Gemalto_Middleware_Ubuntu_64bit_${pkgver/_/-}.deb;;
    *)
      false;;
  esac
  echo "$_hash $_file" | sha256sum -c
  bsdtar -xf "$_file"
  bsdtar -xf data.tar.xz
}

package() {
  cp -a etc usr "$pkgdir"/

  # now clean up the mess

  cd "$pkgdir"

  rm usr/lib/libiomp5.so

  chmod a-x etc/udev/rules.d/*
  chmod a+x usr/lib/**/*.so

  mkdir -p usr/lib/udev/rules.d
  mv etc/udev/rules.d/* usr/lib/udev/rules.d/

  mkdir -p usr/share/p11-kit/modules
  echo "module: libgclib.so" > usr/share/p11-kit/modules/$pkgname.module
}

# vim: ft=sh:ts=2:sw=2:et:nowrap
