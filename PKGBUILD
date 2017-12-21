# Maintainer: graysky <graysky AT archlinux DOT us>

pkgname=rtl8192du-git
_pkgname=rtl8192du
pkgver=84d1edb
pkgrel=1
pkgdesc="Kernel module for Realtek RTL8192DU USB wireless devices."
arch=('x86_64')
url="https://github.com/lwfinger/rtl8192du"
license=('GPL')
_extramodules="extramodules-4.14-ARCH"
depends=('linux>=4.14' 'linux<4.15')
makedepends=('linux-headers>=4.14' 'git')
source=("git://github.com/lwfinger/$_pkgname.git"
"00-fix_pointer_cast_warning_treated_as_error.patch::https://github.com/lwfinger/rtl8192du/pull/52/commits/006105afba2ff8580b3405bb5b333145d7f51d24.patch")
sha256sums=('SKIP'
            'af016808942e708299a5dedf4a7832e88a9eb5620594f23c8800f4f12b106f4c')

_kernver="$(cat /usr/lib/modules/${_extramodules}/version)"

pkgver() {
  cd "$_pkgname"
  git describe --always | sed 's|-|.|g'
}

prepare() {

  cd "$_pkgname"

  # fixup for Arch
  #
  # 1) reference the static kernel ver not the running one
  # 2) remove the depmod command which we do in the postinstall
  sed -i -e "/^KSRC/ s,\$(KVER),$_kernver," \
    -i -e '/depmod/d' Makefile

  # fix build error
  patch -Np1 -i ../00-fix_pointer_cast_warning_treated_as_error.patch
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
