# Maintainer: Mantas Mikulėnas <grawity@gmail.com>
pkgname=libclassicclient
_luxver=1.4.1
pkgver=7.3.0_b06.01
pkgrel=2
pkgdesc="Gemalto PKCS#11 driver"
url="https://www.luxtrust.lu/en/simple/225"
arch=(x86_64)
depends=()
optdepends=(
  "luxtrust-middleware: LuxTrust software for web authentication"
)
source_x86_64=("https://www.luxtrust.com/sites/default/files/downloads/middleware/LuxTrust_Middleware_${_luxver}_Ubuntu_64bit.tar.gz")
sha256sums_x86_64=('2b27b873f223f254b37fcc6ae9b21e5bb48ac081b0845be0f3bee10d8a377eff')

prepare() {
  # the main tarball sometimes gets updated without changing its version;
  # but all we want is the Gemalto .deb
  case $CARCH in
    x86_64)
      _hash='302306990a732c9717399cc8f6010fd08a9058a99d91d4445c82ee01154a0553'
      _file="Gemalto_Middleware_Ubuntu_64bit_${pkgver/_/-}.deb";;
    *)
      false;;
  esac
  echo "$_hash $_file" | sha256sum -c
  bsdtar -xf "$_file"
  bsdtar -xf data.tar.xz
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

  # now clean up the mess

  cd "$pkgdir"

  chmod -v a-x etc/udev/rules.d/*
  chmod -v a-x usr/lib/ClassicClient/keys.conf
  chmod -v a-x usr/lib/ClassicClient/Resources/*
  #chmod -v a+x usr/lib/**/*.so

  mkdir -p usr/lib/udev/rules.d
  mv etc/udev/rules.d/* usr/lib/udev/rules.d/

  # Useless and annoying, keeps waking up pcscd every second.
  rm -vf etc/xdg/autostart/ccchangepinservice.desktop

  mkdir -p usr/share/p11-kit/modules
  echo "module: libgclib.so" > usr/share/p11-kit/modules/$pkgname.module
}

# vim: ft=sh:ts=2:sw=2:et:nowrap
