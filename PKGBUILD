# Maintainer: Mantas Mikulėnas <grawity@gmail.com>

pkgname=libclassicclient
pkgver=7.0.0_b08
pkgrel=2
pkgdesc="Gemalto & LuxTrust PKCS#11 middleware"
url="https://www.luxtrust.lu/en/simple/225"
arch=(i686 x86_64)
depends=(
  gcc-libs
  gdk-pixbuf2
  gtk2
  libusb-compat
  openssl
  pcsclite
)
source_i686=("https://www.luxtrust.lu/downloads/middleware/LuxTrust_Middleware_1.0.1_Ubuntu_32bit.tar.gz")
source_x86_64=("https://www.luxtrust.lu/downloads/middleware/LuxTrust_Middleware_1.0.1_Ubuntu_64bit.tar.gz")
sha256sums_i686=('e00fb014dd9f67a936b9b79b9237b988e70c7ad20d6c5325aac01761e25ef6f6')
sha256sums_x86_64=('543683acb108ab38681a7ff54aab34c5a10da844e771e0dadca64e0e27789a8d')

prepare() {
  cd "$srcdir"

  for _deb in *.deb; do
    msg2 "Extracting $_deb with bsdtar"
    _dir=${_deb%.deb}
    rm -rf "$_dir" && mkdir "$_dir"
    (cd "$_dir" && bsdtar xf "../$_deb")
    (cd "$_dir" && bsdtar xf data.tar.*)
  done
}

package() {
  cd "$srcdir/Gemalto_Middleware_Ubuntu_64bit_7.0.0-b08"

  cp -a etc usr "$pkgdir/"

  cd "$pkgdir"

  chmod a-x etc/udev/rules.d/*
  chmod a+x usr/lib/**/*.so

  mkdir -p usr/lib/udev/rules.d
  mv etc/udev/rules.d/* usr/lib/udev/rules.d/

  mkdir -p usr/share/p11-kit/modules
  echo "module: libgclib.so" > usr/share/p11-kit/modules/$pkgname.module
}

# vim: ft=sh:ts=2:sw=2:et:nowrap
