# Maintainer: Mantas Mikulėnas <grawity@gmail.com>
pkgname=libclassicclient
_luxver=1.9.4
pkgver=7.5.0_b02.00
pkgrel=3
pkgdesc="Gemalto PKCS#11 driver"
url="https://www.luxtrust.com/en/middleware"
arch=(x86_64)
# https://nullroute.lt/tmp/2025/pkg/Gemalto_Middleware_Ubuntu_64bit_7.5.0-b02.00.deb
source_x86_64=("https://gitlab.com/LuxTrustPublic/middleware/-/raw/main/LuxTrust_Middleware_${_luxver}_Ubuntu_64bit.tar.gz")
sha256sums_x86_64=('a690f7454cff49f2219dd84d15e81683404b9054309e0c2416e215f7246921d3')

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
