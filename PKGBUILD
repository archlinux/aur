#!/bin/bash
# shellcheck disable=SC2034,SC2154,SC2164

# Maintainer: silvanshade <darinmorrison@gmail.com>

_pkgname=tt-kmd
pkgname=${_pkgname}-dkms
pkgver=2.2.0
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
sha256sums=('3996a4f53c8d1cc9559e84ba0a78966926d250697a651ffebc3e69266fad28fa'
            '410ec93b8ea47bcf03b08924356c39b299ae5b1f13cf3f56335dbb1cd4fb7b4d')

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
