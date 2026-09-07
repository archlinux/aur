# Copyright (C) 2025 Vadim Yanitskiy <fixeria@osmocom.org>
# Copyright (C) 2020 Denis 'GNUtoo' Carikli <GNUtoo@cyberdimension.org>
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
pkgname=simtrace2
pkgver=0.9.1
pkgrel=1
pkgdesc="Traces the communication between phones and SIM cards with second generation simtrace hardware."
arch=('armv7h' 'i686' 'x86_64')
url="https://osmocom.org/projects/simtrace2"
license=('GPL-2.0-only') # GPLv2-only according to the source files headers
conflicts=("${pkgname}-git")
provides=('libosmo-simtrace2.so=1-64')
depends=('libosmocore' 'libusb' 'talloc')
source=("https://downloads.osmocom.org/releases/${pkgname}/${pkgname}-host-${pkgver}.tar.bz2"
        'version.h.tpl')
sha256sums=('829ec475828f120bfae894519a6ca9a48acc8ddf2b049942590bf03298dc2ac8'
            'ed8973c80cc85d48895f6cdd93d2401e321a61eac1d80536e9219d4540b6ff2f')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  # XXX: version.h.tpl is missing in the release tarball
  # see https://gerrit.osmocom.org/c/simtrace2/+/43529
  cp -p "${srcdir}/version.h.tpl" include/osmocom/simtrace2/
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR=$pkgdir install
  # install udev rules
  install -Dm 644 contrib/99-simtrace2.rules \
                  "${pkgdir}/usr/lib/udev/rules.d/99-simtrace2.rules"
}

# vim:set ts=2 sw=2 et:
