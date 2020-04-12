# -*- mode: shell-script -*-
pkgname=libmcli
_svnver=189
pkgver=r${_svnver}
pkgrel=4
pkgdesc='Library and tools to access the REEL NetCeiver'
url='https://www.baycom.de/hardware/netceiver/'
arch=('x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
license=('GPL2')
depends=('libxml2')
#makedepends=('subversion')
makedepends=('git')
optdepends=('tnftp6: Required for netcvupdate')
# Changed source to GIT mirror as SVN causes heavy problems with qemu
# https://bugs.launchpad.net/qemu/+bug/1869782
#source=("svn+https://svn.baycom.de/repos/vdr-mcli-plugin/#revision=${_svnver}"
source=("git+https://github.com/VDR4Arch/vdr-mcli-plugin.git#commit=89e6d75b49fd1de665a4370e5ccf61b29af8e83d"
        'libmcli-fhs-socket-dir.patch'
        'libmcli-ftp-command.patch')
sha256sums=('SKIP'
            '9f02fa30c24d66f3a375f505f54e31518e1c9b862fcf8f37d0df3cff11d44ddf'
            '13cb00c5fe836ea378c43f1d355fccafa2172e3a0a37c23bbb245df427f24d54')

prepare() {
  cd "${srcdir}/vdr-mcli-plugin/"

  # Some files are pre-compiled. Get rid of them.
  find . -name '*.so*' -delete
  # We don't want any files to be executable.
  find . -type f -exec chmod 0644 {} \;

  # Fix the socket path to be LFS/systemd compliant
  patch -p1 -i "${srcdir}/libmcli-fhs-socket-dir.patch"
  # Fix the FTP command name
  patch -p1 -i "${srcdir}/libmcli-ftp-command.patch"
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
