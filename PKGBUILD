# Maintainer: ArcanusNEO <admin@transcliff.eu.org>
# Contributor: Daniel Urdiales <daniurdi46@gmail.com>
# Copyright (C) 2019 Denis 'GNUtoo' Carikli <GNUtoo@cyberdimension.org>
# This program is free software: you can redistribute it and/or modify
# it under the terms of the CC0 1.0 License.

pkgname=qdl-git
_pkgname=qdl
pkgver=r403.6792629
pkgrel=1
pkgdesc="Tool to communicate with Qualcomm System On a Chip bootroms to install or execute code"
arch=('i686' 'x86_64' 'armv6h' 'armv7l' 'aarch64')
url='https://github.com/linux-msm/qdl'
license=('BSD3')
makedepends=('git' 'meson' 'help2man' 'cmocka' 'zip')
depends=('libxml2' 'libusb' 'libzip' 'systemd-libs')
provides=("qdl")
conflicts=("qdl")
source=("git+${url}.git")
b2sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

build() {
  arch-meson $_pkgname build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"

  cd "$srcdir/$_pkgname"

  # Package license
  install -d "$pkgdir/usr/share/licenses/$_pkgname"
  install LICENSE "$pkgdir/usr/share/licenses/$_pkgname"

  # Package documentation
  install -d "$pkgdir/usr/share/doc/$_pkgname"
  install README.md "$pkgdir/usr/share/doc/$_pkgname"
}
