# Maintainer: Mantas Mikulėnas <grawity@gmail.com>
pkgname=libclassicclient
_luxver=1.1.0
pkgver=7.2.0_b04
pkgrel=4
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
source_i686=("https://www.luxtrust.lu/downloads/middleware/LuxTrust_Middleware_${_luxver}_Ubuntu_32bit.tar.gz")
source_x86_64=("https://www.luxtrust.lu/downloads/middleware/LuxTrust_Middleware_${_luxver}_Ubuntu_64bit.tar.gz")
sha256sums_i686=('a79c5809743a49d278583f4d4b501c602d4d12191890cdf32dc068975dc7702e')
sha256sums_x86_64=('e83565ec6fdb4195f0eabe1cf2fc7d61ea000e1044f3dca5864ace0155058f43')

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

  chmod a-x etc/udev/rules.d/*
  chmod a+x usr/lib/**/*.so

  mkdir -p usr/lib/udev/rules.d
  mv etc/udev/rules.d/* usr/lib/udev/rules.d/

  mkdir -p usr/share/p11-kit/modules
  echo "module: libgclib.so" > usr/share/p11-kit/modules/$pkgname.module
}

# vim: ft=sh:ts=2:sw=2:et:nowrap
