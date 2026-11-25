# Copyright (C) 2025 Vadim Yanitskiy <fixeria@osmocom.org>
# Copyright (C) 2020 Denis 'GNUtoo' Carikli <GNUtoo@cyberdimension.org>
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
pkgname=simtrace2-git
pkgver=0.9.1.r25.936009ed
pkgrel=2
pkgdesc="Traces the communication between phones and SIM cards with second generation simtrace hardware."
arch=('armv7h' 'i686' 'x86_64')
url="https://osmocom.org/projects/simtrace2"
license=('GPL-2.0-only') # GPLv2-only according to the source files headers
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}=${pkgver}"
          'libosmo-simtrace2.so=1-64')
depends=('libosmocore-git' 'libusb' 'talloc')
source=("git+https://gitea.osmocom.org/sim-card/simtrace2.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
  cd "$srcdir/${pkgname%-git}/host"
  autoreconf -i
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/${pkgname%-git}/host"
  make DESTDIR=$pkgdir install
  # install udev rules
  install -Dm 644 contrib/99-simtrace2.rules \
                  "${pkgdir}/usr/lib/udev/rules.d/99-simtrace2.rules"
}

# vim:set ts=2 sw=2 et:
