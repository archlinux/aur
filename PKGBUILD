# Maintainer: graysky <graysky AT archlinux DOT us>

pkgname=rtl8192su-git
_pkgname=rtl8192su
pkgver=c00112c
pkgrel=1
pkgdesc="Kernel module for Realtek RTL8188SU/RTL8191SU/RTL8192SU devices"
arch=('x86_64' 'i686')
url="https://github.com/chunkeey/rtl8192su"
license=('GPL')
depends=('linux>=4.9' 'linux<4.10')
makedepends=('linux-headers>=4.9' 'git')
source=("git://github.com/chunkeey/$_pkgname.git")
sha256sums=('SKIP')
install=readme.install

_extramodules="extramodules-4.9-ARCH"
_kernver="$(cat /usr/lib/modules/${_extramodules}/version)"

pkgver() {
  cd "$_pkgname"
  git describe --always | sed 's|-|.|g'
}

build() {
  cd "$_pkgname"
  make INSTALL_PREFIX=/usr
  find . -type f -name '*.ko' -print0 | xargs -0 gzip -9
}

package() {
  _su="/usr/lib/modules/${_extramodules}/kernel/drivers/net/wireless/rtlwifi/rtl8192su"
  _se="/usr/lib/modules/${_extramodules}/kernel/drivers/net/wireless/rtlwifi/rtl8192se"
  _s="/usr/lib/modules/${_extramodules}/kernel/drivers/net/wireless/rtlwifi/rtl8192s"
  _base="/usr/lib/modules/${_extramodules}/kernel/drivers/net/wireless/rtlwifi"

  install -pd "$pkgdir/$_su"
  install -pd "$pkgdir/$_se"
  install -pd "$pkgdir/$_s"
  install -pm644 "$srcdir/$_pkgname/rtlwifi/rtlwifi.ko.gz" "$pkgdir/$_base/rtlwifi.ko.gz"
  install -pm644 "$srcdir/$_pkgname/rtlwifi/rtl_pci.ko.gz" "$pkgdir/$_base/rtl_pci.ko.gz"
  install -pm644 "$srcdir/$_pkgname/rtlwifi/rtl_usb.ko.gz" "$pkgdir/$_base/rtl_usb.ko.gz"
  install -pm644 "$srcdir/$_pkgname/rtlwifi/rtl8192su/rtl8192su.ko.gz" \
    "$pkgdir/$_su/rtl8192su.ko.gz"
  install -pm644 "$srcdir/$_pkgname/rtlwifi/rtl8192se/rtl8192se.ko.gz" \
    "$pkgdir/$_su/rtl8192se.ko.gz"
  install -pm644 "$srcdir/$_pkgname/rtlwifi/rtl8192s/rtl8192s-common.ko.gz" \
    "$pkgdir/$_su/rtl8192s-common.ko.gz"

  install -pd "$pkgdir/usr/lib/firmware/rtlwifi"
  for i in rtl8192sfw.bin rtl8192sufw-ap.bin rtl8192sufw-apple.bin \
    rtl8192sufw-windows.bin rtl8712u-linux-firmware-bad.bin \
    rtl8712u-most-recent-v2.6.6-bad.bin rtl8712u-most-recent-v2.6.6-bad.bin \
    rtl8712u-oldest-but-good.bin; do
    install -pm644 "$_pkgname/firmwares/$i" "$pkgdir/usr/lib/firmware/rtlwifi/$i"
  done
}

# vim:set ts=2 sw=2 et:
