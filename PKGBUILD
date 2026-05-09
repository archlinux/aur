# Maintainer: Matias <matiase@archlinux.org>

pkgname=wanpipe
pkgver=7.0.38
pkgrel=1
pkgdesc='Sangoma WANPIPE drivers and utilities for DAHDI'
arch=(x86_64)
url=https://ftp.sangoma.com/linux/current_wanpipe/
license=(GPL-2.0-or-later)
depends=(
  dahdi-linux
  glibc
  linux
  ncurses
)
makedepends=(
  autoconf
  automake
  bison
  flex
  libtool
  linux-headers
)
backup=(etc/wanpipe/wanrouter.rc)
source=(
  "https://ftp.sangoma.com/linux/current_wanpipe/${pkgname}-${pkgver}.tgz"
  arch-kernel-compat.patch
)
sha256sums=(
  95266edd83bd8bb427f47f7a39365795936acc0d6e2e3a1e482bd015bba90fa2
  57390f6d7991614af7671297ecc4bd062889d4f51403e7c99353658d8cc61e0f
)

_kernelver=$(pacman -Q linux | cut -f2 -d ' ' | sed 's/\.arch/-arch/')

prepare() {
  cd "${pkgname}-${pkgver}"
  patch -Np5 -i "${srcdir}/arch-kernel-compat.patch"
}

build() {
  cd "${pkgname}-${pkgver}"
  make dahdi DAHDI_DIR=/usr KVER="${_kernelver}" KDIR="/usr/lib/modules/${_kernelver}/build"
}

package() {
  cd "${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install_etc install_util install_inc install_lib
  rm -f "${pkgdir}"/etc/wanpipe/api/{libsangoma,libstelephony}/{config.log,config.status,Makefile}

  local module
  for module in patches/kdrivers/src/net/{sdladrv,wanrouter,wanpipe,wanec,wan_aften}.ko; do
    gzip -fn "$module"
    install -Dm0644 "${module}.gz" "${pkgdir}/usr/lib/modules/${_kernelver}/extramodules/${module##*/}.gz"
  done

  rm -f "${pkgdir}"/usr/lib/*.la
}
