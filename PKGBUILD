# $Id$
# Maintainer: Christian Hesse <mail@eworm.de>
# Maintainer: Ronald van Haren <ronald.archlinux.org>
# Contributor: Judd Vinet <jvinet@zeroflux.org>
# SELinux Maintainer: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)

pkgbase=iproute2-selinux
pkgname=(iproute2-selinux iproute2-selinux-doc)
pkgver=4.10.0
pkgrel=1
pkgdesc='IP Routing Utilities with SELinux support'
arch=('i686' 'x86_64')
license=('GPL2')
groups=('selinux')
url='http://www.linuxfoundation.org/collaborate/workgroups/networking/iproute2'
makedepends=('iptables' 'linux-atm' 'linuxdoc-tools' 'texlive-bin' 'texlive-core' 'texlive-latexextra')
options=('staticlibs' '!makeflags')
validpgpkeys=('9F6FC345B05BE7E766B83C8F80A77F6095CDE47E') # Stephen Hemminger
source=("https://www.kernel.org/pub/linux/utils/net/${pkgbase/-selinux}/${pkgbase/-selinux}-${pkgver}.tar."{xz,sign}
        '0001-make-iproute2-fhs-compliant.patch')
sha256sums=('22b1e1c1fc704ad35837e5a66103739727b8b48ac90b48c13f79b7367ff0a9a8'
            'SKIP'
            'f60fefe4c17d3b768824bb50ae6416292bcebba06d73452e23f4147b46b827d3')

prepare() {
  cd "${srcdir}/${pkgbase/-selinux}-${pkgver}"

  # set correct fhs structure
  patch -Np1 -i "${srcdir}/0001-make-iproute2-fhs-compliant.patch"

  # do not treat warnings as errors
  sed -i 's/-Werror//' Makefile

}

build() {
  cd "${srcdir}/${pkgbase/-selinux}-${pkgver}"

  ./configure --with-selinux
  make

  cd "${srcdir}/${pkgbase/-selinux}-${pkgver}/doc/"

  make html pdf
}

package_iproute2-selinux() {
  depends=('glibc' 'iptables' 'libselinux')
  optdepends=('linux-atm: ATM support')
  provides=('iproute' "${pkgname/-selinux}=${pkgver}-${pkgrel}")
  conflicts=('iproute' "${pkgname/-selinux}")
  replaces=('iproute')
  backup=('etc/iproute2/ematch_map' 'etc/iproute2/rt_dsfield' 'etc/iproute2/rt_protos' \
    'etc/iproute2/rt_realms' 'etc/iproute2/rt_scopes' 'etc/iproute2/rt_tables')

  cd "${srcdir}/${pkgbase/-selinux}-${pkgver}"

  make DESTDIR="${pkgdir}" SBINDIR="/usr/bin" install

  # remove documentation
  rm -rf "${pkgdir}/usr/share/doc/"

  # libnetlink isn't installed, install it FS#19385
  install -Dm0644 include/libnetlink.h "${pkgdir}/usr/include/libnetlink.h"
  install -Dm0644 lib/libnetlink.a "${pkgdir}/usr/lib/libnetlink.a"
}

package_iproute2-selinux-doc() {
  pkgdesc='IP Routing Utilities documentation'

  cd "${srcdir}/${pkgbase/-selinux}-${pkgver}"

  make DESTDIR="${pkgdir}" install

  # documentation is included in default install target... So clean up here.
  find "${pkgdir}/" ! -type d ! -regex '.*examples.*' -delete
  find "${pkgdir}/" -empty -delete
  find "${pkgdir}/" -name '*.sgml' -delete
  find "${pkgdir}/" -name '*.tex' -delete

  install -m0644 doc/*.html doc/*.pdf "${pkgdir}/usr/share/doc/iproute2/"
}

