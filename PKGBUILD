# Maintainer: graysky <graysky AT archlinux DOT us>

pkgname=rtl8192du-git
_pkgname=rtl8192du
pkgver=54c95aa
pkgrel=1
pkgdesc="Kernel module for Realtek RTL8192DU USB wireless devices."
arch=('x86_64')
url="https://github.com/lwfinger/rtl8192du"
license=('GPL')
_extramodules="extramodules-ARCH"
depends=('linux>=5.2' 'linux<5.3')
makedepends=('linux-headers>=5.2' 'git')
source=("git://github.com/lwfinger/$_pkgname.git")

sha256sums=('SKIP')

_kernver="$(cat /usr/lib/modules/${_extramodules}/version)"
# manually define if building in chroot
#_kernver=5.0.12-arch1-1-ARCH

pkgver() {
  cd "$_pkgname"
  git describe --always | sed 's|-|.|g'
}

prepare() {
  cd "$_pkgname"

  # 1) reference the static kernel ver not the running one
  # 2) remove the depmod command since 60-linux.hook does this for us
  sed -i -e "/^KSRC/ s,\$(KVER),$_kernver," \
    -i -e '/depmod/d' Makefile
}

build() {
  cd "$_pkgname"
  make INSTALL_PREFIX=/usr
  gzip -9 8192du.ko
}

package() {
  # module
  install -d "$pkgdir/usr/lib/modules/${_extramodules}/kernel/drivers/net/wireless"
  install -m644 "$srcdir/$_pkgname/8192du.ko.gz" \
    "$pkgdir/usr/lib/modules/${_extramodules}/kernel/drivers/net/wireless/8192du.ko.gz"

  # firmware
  install -d "$pkgdir/usr/lib/firmware/rtlwifi"
  install -m644 "$srcdir/$_pkgname/rtl8192dufw.bin" \
    "$pkgdir/usr/lib/firmware/rtlwifi/rtl8192dufw.bin"
  install -m644 "$srcdir/$_pkgname/rtl8192dufw_wol.bin" \
    "$pkgdir/usr/lib/firmware/rtlwifi/rtl8192dufw_wol.bin"
}

# vim:set ts=2 sw=2 et:
