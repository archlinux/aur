#!/bin/bash
# shellcheck disable=SC2034,SC2154,SC2164

# Maintainer: silvanshade <darinmorrison@gmail.com>

_pkgname=tt-kmd
pkgname=${_pkgname}-dkms
pkgver=2.1.0
pkgrel=1
pkgdesc="Tenstorrent Kernel Module"
arch=('x86_64')
url="https://github.com/tenstorrent/tt-kmd"
license=('GPL-2.0-only')
makedepends=('git' 'make' 'gcc' 'base-devel')
depends=('dkms')

source=("${_pkgname}-ttkmd-${pkgver}.tar.gz::https://github.com/tenstorrent/tt-kmd/archive/refs/tags/ttkmd-${pkgver}.tar.gz"
        'dkms.conf')
sha256sums=('11756bc3858fb755f74228b4c11de910e7401b3be54972214315e00afe2cd6bd'
            '9b43b301e6795449ac710c7c337389383253988c8eaa7a213135356bccd1e9c1')

build() {
  cd "${_pkgname}-ttkmd-${pkgver}"
  make
}

package() {
  _kernelmodule=tenstorrent

  mkdir -p "${pkgdir}/usr/src"

  cp -a "${_pkgname}-ttkmd-${pkgver}" "${pkgdir}/usr/src/${_pkgname}-${pkgver}"

  install -Dm644 dkms.conf "${pkgdir}/usr/src/${_pkgname}-${pkgver}/dkms.conf"
  sed -e "s/@_PKGNAME@/${_pkgname}/" \
      -e "s/@PKGVER@/${pkgver}/" \
      -e "s/@_KERNELMODULE@/${_kernelmodule}/" \
      -i "${pkgdir}/usr/src/${_pkgname}-${pkgver}/dkms.conf"
}
