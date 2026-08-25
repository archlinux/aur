#!/bin/bash
# shellcheck disable=SC2034,SC2154,SC2164

# Maintainer: silvanshade <darinmorrison@gmail.com>

_pkgname=tt-kmd
pkgname=${_pkgname}-dkms
pkgver=2.11.0
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
sha256sums=('379f16f2011afbdc759a07f5a9396b917282a50d4af7e2b96ecdff7ed1b2b945'
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
