#!/bin/sh
# Maintainer: jorge_barroso <jorge.barroso.11 at gmail dot com>

pkgname=akari
_basever=1.0.31
_timestamp=20150112
pkgver=${_basever}.${_timestamp}
_kernver=$(uname -r)
_ccstoolsver=1.8.3.20140601
pkgrel=1
pkgdesc='TOMOYO Linux 1.8.x Module for the Linux kernel'
arch=('any')
url='http://akari.sourceforge.jp/'
license=('GPL')
depends=("linux")
makedepends=("linux-headers")
optdepends=("ccs-tools>=${_ccstoolsver}")
conflicts=("ccs-tools<${_ccstoolsver}")
install=akari.install
source=("http://sourceforge.jp/frs/redir.php?f=/akari/49272/akari-${_basever}-${_timestamp}.tar.gz")
sha512sums=('e1f87f70149ae77d3bfbfb9aa358da4a02ba66b3337674d191e1c9770e3c0bc0c802672f218a3ab41568565d7835ab05c2740a04b782f86ca43891aa10b4429d')
noextract=("akari-${_basever}-${_timestamp}.tar.gz")

build() {
  msg "Copying headers to source directory..."
  cp -a "/usr/src/linux-${_kernver}/" "${srcdir}"

  cd "${srcdir}/linux-${_kernver}/"

  msg "Extracting akari into kernel headers..."
  tar -xf "${srcdir}/akari-${_basever}-${_timestamp}.tar.gz"

  msg "Building akari module..."
  make SUBDIRS=akari SYSSRC=/lib/modules/${_kernver}/build modules
}

package() {
  install -D -m644 "${srcdir}/linux-${_kernver}/akari/akari.ko" \
    "${pkgdir}/lib/modules/${_kernver}/kernel/extra/akari.ko"

  sed -i -e "s/KERNEL_VERSION='.*'/KERNEL_VERSION='${_kernver}'/" "${startdir}/akari.install"
}
