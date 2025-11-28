#!/bin/bash
# shellcheck disable=SC2034,SC2154,SC2164

# Maintainer: silvanshade <darinmorrison@gmail.com>

_pkgname=tt-kmd
pkgname=${_pkgname}-dkms
pkgver=2.5.0
pkgrel=1
pkgdesc="Tenstorrent Kernel Module"
arch=(x86_64)
url="https://github.com/tenstorrent/tt-kmd"
license=(GPL-2.0-only)
makedepends=(
  base-devel
  gcc
  git
  make
)
depends=(
  dkms
)

source=(
  "${_pkgname}-ttkmd-${pkgver}.tar.gz::https://github.com/tenstorrent/tt-kmd/archive/refs/tags/ttkmd-${pkgver}.tar.gz"
  dkms.conf
)
sha256sums=('bd4e517e157c8a80e0990ed18f322cf99d6be5728e2e0c26adc388f12d626aee'
            'dadc209ce454e1da932f0c627955d706878983398dbcac4e586e0ecd71c470f2')

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
