# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com
# Contributor : xav <xav at ethertricks dot net>

set -u
pkgname='tcpslice'
pkgver='1.2a3'
pkgrel='1'
pkgdesc="A tool for extracting portions of packet-trace files generated using tcpdump's -w flag."
arch=('i686' 'x86_64')
url='http://www.tcpdump.org/'
license=('BSD')
depends=('libpcap')
source=("ftp://ftp.ee.lbl.gov/${pkgname}-${pkgver}.tar.gz"
        'tcpslice-CVS.20010207-bpf.patch'
        'tcpslice-1.2a3-time.patch'
        'LICENSE')
sha256sums=('4096e8debc898cfaa16b5306f1c42f8d18b19e30e60da8d4deb781c8f684c840'
            '51f10963a0e84bdaddce76cdcf52a833a348eaea1073c614c6a6c478967e058e'
            '8a4b60b0833e297958a166c28911259ad314ca5b0a2e0e3d8cb7d96a69914923'
            '6f4b64754b831217eee983f787d3b278ae7e73e4563c52bfe69cf7b07566f588')

prepare() {
  set -u
  cd "${srcdir}/${pkgname}-${pkgver}"
  chmod 644 *.c *.h

  patch < "${srcdir}/tcpslice-CVS.20010207-bpf.patch"
  patch < "${srcdir}/tcpslice-1.2a3-time.patch"
  sed -i -e 's/f301-\*)/f301-\* \| x86_64-\*)/' 'config.sub'

  ./configure --sbindir='/usr/bin'
  sed -i -e 's:^#include <stdio.h>$:&\n#include <stdlib.h>:g' 'util.c'
  set +u
}

build() {
  set -u
  cd "${srcdir}/${pkgname}-${pkgver}"
  make -s # -j $(nproc) # too small to need this
  set +u
}

package() {
  set -u
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dpm755 'tcpslice' "${pkgdir}/usr/bin/tcpslice"
  install -Dpm544 'tcpslice.1' "${pkgdir}/usr/share/man/man1/tcpslice.1"

  install -Dpm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Ensure there are no forbidden paths (git-aurcheck)
  ! grep -alqr "/sbin" "${pkgdir}" || echo "${}"
  ! grep -alqr "/usr/tmp" "${pkgdir}" || echo "${}"
  ! test -d "${pkgdir}/usr/sbin" || echo "${}"
  set +u
}

set +u
