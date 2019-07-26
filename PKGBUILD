# -*- mode: shell-script -*-
pkgname=libmcli
_svnver=189
pkgver=r${_svnver}
pkgrel=1
pkgdesc='Library and tools to access the REEL NetCeiver'
url='https://www.baycom.de/hardware/netceiver/'
arch=('x86_64')
license=('GPL2')
depends=('libxml2')
makedepends=('subversion')
source=("svn+https://svn.baycom.de/repos/vdr-mcli-plugin/#revision=${_svnver}")
sha256sums=('SKIP')

prepare() {
  cd "${srcdir}/vdr-mcli-plugin/"
  find . -name '*.so*' -delete
}

build() {
	cd "${srcdir}/vdr-mcli-plugin/mcast/client"
  make

  cd "${srcdir}/vdr-mcli-plugin/mcast/tool"
  make
}

package() {
  cd "${srcdir}/vdr-mcli-plugin/mcast/"

  mkdir -p "${pkgdir}/usr/bin"
  cp "tool/"{netcvdiag,netcvlogview,netcvupdate} "${pkgdir}/usr/bin"

  mkdir -p "${pkgdir}/usr/lib"
  cp "client/libmcli.so" "${pkgdir}/usr/lib"

  _include="${pkgdir}/usr/include/libmcli/mcast"
  mkdir -p "$_include"
  mkdir "$_include/client"
  mkdir "$_include/common"
  cp client/*.h "$_include/client"
  cp common/*.h "$_include/common"
  chmod -x "${pkgdir}/usr/include/libmcli/mcast/common/crc32.h"
}
