# Maintainer: yjun <jerrysteve1101 at gmail dot com>
# Contributor: Yuval Adam <yuv dot adm at gmail dot com> PGP-Key: CC2115C12D99D2F0

pkgname=micronucleus-git
_gitname=micronucleus
pkgver=2.5.r0.gc2c7fa0
pkgrel=1
pkgdesc="ATTiny usb bootloader with a strong emphasis on bootloader compactness"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/micronucleus/micronucleus"
license=('GPL')
depends=('libusb-compat')
makedepends=('git')
provides=('micronucleus')
conflicts=('micronucleus')
source=("git+$url")
options=('!makeflags')
sha1sums=('SKIP')

pkgver() {
  cd $_gitname
  _major=$(grep -o ' [0-9].[0-9] ' commandline/library/micronucleus_lib.h | sed s/[[:space:]]//g)
  _sub=$(git describe --long | sed 's/^master.LATEST.//;s/\([^-]*-g\)/r\1/;s/-/./g')
  echo ${_major}.${_sub}
}

prepare() {
  # Upstream set static compilation in Makefile, libusb.a is required for it.
  # [Static binaries for MacOS and linux @stonehippo](https://github.com/micronucleus/micronucleus/commit/44a7664bd4c86b86596fe13bcdae7428fe1c4907)
  # but Arch Linux libusb-compat package doesn't provide static library, so revert to origion
  # https://github.com/archlinux/svntogit-packages/blob/packages/libusb-compat//trunk/PKGBUILD#L19
  sed -i 's# -static##g' ${srcdir}/${_gitname}/commandline/Makefile
}

build() {
  cd "$_gitname/commandline"

  make
}

package() {
  cd "${srcdir}/${_gitname}/commandline"

  install -Dm755 micronucleus -t "${pkgdir}/usr/bin/"
  install -Dm644 49-micronucleus.rules -t "${pkgdir}/usr/lib/udev/rules.d/"
}

# vim:set ts=2 sw=2 et:
