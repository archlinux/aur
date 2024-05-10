# Maintainer: ArcanusNEO <admin@transcliff.eu.org>
# Contributor: Daniel Urdiales <daniurdi46@gmail.com>
# Copyright (C) 2019 Denis 'GNUtoo' Carikli <GNUtoo@cyberdimension.org>
# This program is free software: you can redistribute it and/or modify
# it under the terms of the CC0 1.0 License.

pkgname=qdl-git
_pkgname=qdl
pkgver=r98.b18bca7
pkgrel=1
pkgdesc="Tool to communicate with Qualcomm System On a Chip bootroms to install or execute code"
arch=('armv7h' 'i686' 'x86_64')
url='https://github.com/linux-msm/qdl'
license=('BSD3')
makedepends=('git')
depends=('libxml2' 'libusb' 'systemd-libs')
provides=("qdl")
conflicts=("qdl")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}/"
  printf "r%s.%s" $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

build(){
  cd "${srcdir}/${_pkgname}/"
  make CFLAGS:="${CFLAGS} `pkg-config --cflags libxml-2.0 libusb-1.0`" LDFLAGS:="${LDFLAGS} `pkg-config --libs libxml-2.0 libusb-1.0`"
}

package(){
  cd "${srcdir}/${_pkgname}/"
  make prefix:="/usr" DESTDIR:="${pkgdir}" install

  # Package license
  install -d "${pkgdir}/usr/share/licenses/${_pkgname}/"
  install LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/"

  # Package documentation
  install -d "${pkgdir}/usr/share/doc/${_pkgname}/"
  install README "${pkgdir}/usr/share/doc/${_pkgname}/"
}
