pkgname=wanpipe
pkgver=7.0.38
pkgrel=9
pkgdesc='Sangoma WANPIPE drivers and utilities for DAHDI'
arch=(x86_64)
url=https://ftp.sangoma.com/linux/current_wanpipe/
license=(GPL-2.0-or-later)
makedepends=(
  autoconf
  automake
  bison
  dahdi-linux
  flex
  libtool
  linux-headers
)
backup=(etc/wanpipe/wanrouter.rc)
source=(
  "https://ftp.sangoma.com/linux/current_wanpipe/${pkgname}-${pkgver}.tgz"
  arch-kernel-compat.patch
  wanpipe.service
)
sha256sums=(
  95266edd83bd8bb427f47f7a39365795936acc0d6e2e3a1e482bd015bba90fa2
  57390f6d7991614af7671297ecc4bd062889d4f51403e7c99353658d8cc61e0f
  59b6f271556eadc0a4f71454ab3ec015478cbf3b81cf0446d9bb9cba62d2e0d6
)

_kernelver() {
  pacman -Q linux-headers | cut -f2 -d ' ' | sed 's/\.arch/-arch/'
}

_linuxpkgver() {
  pacman -Q linux-headers | cut -f2 -d ' '
}

prepare() {
  cd "${pkgname}-${pkgver}"
  patch -Np5 -i "${srcdir}/arch-kernel-compat.patch"
}

build() {
  cd "${pkgname}-${pkgver}"
  local kernelver="$(_kernelver)"
  [[ -e /usr/include/dahdi/kernel.h ]]
  make dahdi DAHDI_DIR=/usr KVER="${kernelver}" KDIR="/usr/lib/modules/${kernelver}/build"
}

package() {
  depends=(
    dahdi-linux
    glibc
    "linux=$(_linuxpkgver)"
    ncurses
    net-tools
  )

  cd "${pkgname}-${pkgver}"
  local kernelver="$(_kernelver)"

  make DESTDIR="${pkgdir}" install_etc
  make DESTDIR="${pkgdir}" install_util
  make DESTDIR="${pkgdir}" install_inc
  make DESTDIR="${pkgdir}" install_lib
  rm -f "${pkgdir}"/etc/wanpipe/api/{libsangoma,libstelephony}/{config.log,config.status,Makefile}

  if [[ -d "${pkgdir}/usr/sbin" ]]; then
    install -d "${pkgdir}/usr/bin"
    mv "${pkgdir}"/usr/sbin/* "${pkgdir}/usr/bin/"
    rm -rf "${pkgdir}/usr/sbin"
  fi
  if [[ -d "${pkgdir}/usr/local/sbin" ]]; then
    install -d "${pkgdir}/usr/bin"
    mv "${pkgdir}"/usr/local/sbin/* "${pkgdir}/usr/bin/"
    rm -rf "${pkgdir}/usr/local"
  fi

  install -Dm0644 patches/kdrivers/src/net/sdladrv.ko \
    "${pkgdir}/usr/lib/modules/${kernelver}/kernel/drivers/net/wan/sdladrv.ko"
  install -Dm0644 patches/kdrivers/src/net/wanpipe.ko \
    "${pkgdir}/usr/lib/modules/${kernelver}/kernel/drivers/net/wan/wanpipe.ko"
  install -Dm0644 patches/kdrivers/src/net/wanrouter.ko \
    "${pkgdir}/usr/lib/modules/${kernelver}/kernel/net/wanrouter/wanrouter.ko"
  install -Dm0644 patches/kdrivers/src/net/wanec.ko \
    "${pkgdir}/usr/lib/modules/${kernelver}/kernel/net/wanrouter/wanec.ko"
  install -Dm0644 patches/kdrivers/src/net/wan_aften.ko \
    "${pkgdir}/usr/lib/modules/${kernelver}/kernel/net/wanrouter/wan_aften.ko"
  install -Dm0644 "${srcdir}/wanpipe.service" \
    "${pkgdir}/usr/lib/systemd/system/wanpipe.service"

  rm -f "${pkgdir}"/usr/lib/*.la
}
