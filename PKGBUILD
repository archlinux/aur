# $Id$
# Maintainer: Ronald van Haren <ronald.archlinux.org>
# Contributor: Judd Vinet <jvinet@zeroflux.org>
# SELinux Maintainer: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)

pkgbase=iproute2-selinux
pkgname=(iproute2-selinux iproute2-selinux-doc)
pkgver=4.8.0
pkgrel=1
pkgdesc="IP Routing Utilities with SELinux support"
arch=('i686' 'x86_64')
license=('GPL2')
url='http://www.linuxfoundation.org/collaborate/workgroups/networking/iproute2'
makedepends=('linux-atm' 'linuxdoc-tools' 'texlive-bin' 'texlive-core' 'texlive-latexextra')
options=('staticlibs' '!makeflags')
validpgpkeys=('9F6FC345B05BE7E766B83C8F80A77F6095CDE47E') # Stephen Hemminger
source=("http://www.kernel.org/pub/linux/utils/net/${pkgbase/-selinux}/${pkgbase/-selinux}-${pkgver}.tar."{xz,sign}
        '0001-make-iproute2-fhs-compliant.patch')
sha1sums=('eba7c753918ddcf8b3890718391fb795f8dd023b'
          'SKIP'
          '1ed328854983b3f9df0a143aa7c77920916a13c1')

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
  groups=('base')
  provides=('iproute' "${pkgname/-selinux}=${pkgver}-${pkgrel}")
  conflicts=('iproute' "${pkgname/-selinux}")
  replaces=('iproute')
  backup=('etc/iproute2/ematch_map' 'etc/iproute2/rt_dsfield' 'etc/iproute2/rt_protos' \
    'etc/iproute2/rt_realms' 'etc/iproute2/rt_scopes' 'etc/iproute2/rt_tables')

  cd "${srcdir}/${pkgbase/-selinux}-${pkgver}"

  make DESTDIR="${pkgdir}" install

  # remove sgml and tex files... we have html and pdf in iproute2-doc
  rm "${pkgdir}/usr/share/doc/iproute2/"*.{sgml,tex}

  # libnetlink isn't installed, install it FS#19385
  install -Dm644 include/libnetlink.h "${pkgdir}/usr/include/libnetlink.h"
  install -Dm644 lib/libnetlink.a "${pkgdir}/usr/lib/libnetlink.a"

  # move binaries
  cd "${pkgdir}"
  mv sbin usr/bin
}

package_iproute2-selinux-doc() {
  pkgdesc='IP Routing Utilities documentation'

  cd "${srcdir}/${pkgbase/-selinux}-${pkgver}/doc"

  install -d "${pkgdir}/usr/share/doc/iproute2/"
  install *.html *.pdf "${pkgdir}/usr/share/doc/iproute2/"
}

