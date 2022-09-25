# Maintainer: Mantas Mikulėnas <grawity@gmail.com>
pkgname=libclassicclient
_luxver=1.8.0
pkgver=7.5.0_b02.00
pkgrel=3
pkgdesc="Gemalto PKCS#11 driver"
url="https://www.luxtrust.com/en/middleware"
arch=(x86_64)
depends=()
optdepends=(
  "luxtrust-middleware: LuxTrust software for web authentication"
)
source_x86_64=("https://www.luxtrust.com/sites/default/files/downloads/middleware/LuxTrust_Middleware_${_luxver}_Ubuntu_64bit.tar.gz")
sha256sums_x86_64=('003f23e06ad4960b4406b64d26ab72aa92877c56c8b4a9dfe16e14a17975740f')

prepare() {
  # the main tarball sometimes gets updated without changing its version;
  # but all we want is the Gemalto .deb
  case $CARCH in
    x86_64)
      _hash='651153432ac27e4121ae30abcee1d850d71e10085c3bc264de9719341c866aad'
      _file="Gemalto_Middleware_Ubuntu_64bit_${pkgver/_/-}.deb";;
    *)
      false;;
  esac
  echo "$_hash $_file" | sha256sum -c
  bsdtar -xf "$_file"
  bsdtar -xf data.tar.gz
}

package() {
  depends=(
    gcc-libs
    gdk-pixbuf2   # for CCChangePinTool
    gtk2          # for CCChangePinTool
    libusb-compat # for libidkit.so
    openmp
    openssl
    pcsclite
    qt5-base      # for Secure{Bio,Pin}Dialog
  )

  cp -a etc usr "$pkgdir"/

  cd "$pkgdir"

  # Useless and annoying, keeps waking up pcscd every second.
  rm -vf etc/xdg/autostart/ccchangepinservice.desktop

  mkdir -p usr/share/p11-kit/modules
  echo "module: libgclib.so" > usr/share/p11-kit/modules/$pkgname.module
}

# vim: ft=sh:ts=2:sw=2:et:nowrap
