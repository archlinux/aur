# $Id$
# Maintainer: George Amanakis <g_amanakis at yahoo dot com>

pkgbase=iproute2
pkgname=(iproute2-cake iproute2-cake-doc)
pkgver=4.13.0
pkgrel=1
pkgdesc="IP Routing Utilities with tc-support for the CAKE scheduler"
arch=('i686' 'x86_64')
license=('GPL2')
url="http://www.linuxfoundation.org/collaborate/workgroups/networking/iproute2"
makedepends=('iptables' 'linux-atm' 'linuxdoc-tools' 'texlive-bin' 'texlive-core' 'texlive-latexextra')
#950 patch: https://raw.githubusercontent.com/lede-project/source/master/package/network/utils/iproute2/patches/950-add-cake-to-tc.patch
#tc-cake.8 man page: https://github.com/dtaht/tc-adv/blob/master/man/man8/tc-cake.8
options=('staticlibs' '!makeflags')
validpgpkeys=('9F6FC345B05BE7E766B83C8F80A77F6095CDE47E') # Stephen Hemminger
source=("http://www.kernel.org/pub/linux/utils/net/${pkgbase}/${pkgbase}-${pkgver}.tar."{xz,sign}
        '0001-make-iproute2-fhs-compliant.patch'
	'950-add-cake-to-tc.patch'
	'tc-cake.8.gz')

prepare() {
  cd "${srcdir}/${pkgbase}-${pkgver}"

  # set correct fhs structure
  patch -Np1 -i "${srcdir}/950-add-cake-to-tc.patch"
  patch -Np1 -i "${srcdir}/0001-make-iproute2-fhs-compliant.patch"

  # do not treat warnings as errors
  sed -i 's/-Werror//' Makefile

}

build() {
  cd "${srcdir}/${pkgbase}-${pkgver}"

  ./configure
  make

  cd "${srcdir}/${pkgbase}-${pkgver}/doc/"

  make html pdf
}

package_iproute2-cake() {
  depends=('glibc' 'iptables' 'libelf' 'sch_cake')
  optdepends=('linux-atm: ATM support')
  groups=('base')
  provides=('iproute' 'iproute2' 'iproute2-doc')
  conflicts=('iproute' 'iproute2' 'iproute2-doc')
  replaces=('iproute')
  backup=('etc/iproute2/ematch_map' 'etc/iproute2/rt_dsfield' 'etc/iproute2/rt_protos' \
    'etc/iproute2/rt_realms' 'etc/iproute2/rt_scopes' 'etc/iproute2/rt_tables')

  cd "${srcdir}/${pkgbase}-${pkgver}"

  make DESTDIR="${pkgdir}" SBINDIR="/usr/bin" install

  # remove documentation
  rm -rf "${pkgdir}/usr/share/doc/"

  # libnetlink isn't installed, install it FS#19385
  install -Dm0644 include/libnetlink.h "${pkgdir}/usr/include/libnetlink.h"
  install -Dm0644 lib/libnetlink.a "${pkgdir}/usr/lib/libnetlink.a"

  cd "${srcdir}"
  cp tc-cake.8.gz "${pkgdir}/usr/share/man/man8"
}

package_iproute2-cake-doc() {
  pkgdesc='IP Routing Utilities documentation'

  cd "${srcdir}/${pkgbase}-${pkgver}"

  make DESTDIR="${pkgdir}" install

  # documentation is included in default install target... So clean up here.
  find "${pkgdir}/" ! -type d ! -regex '.*examples.*' -delete
  find "${pkgdir}/" -empty -delete
  find "${pkgdir}/" -name '*.sgml' -delete
  find "${pkgdir}/" -name '*.tex' -delete

  install -m0644 doc/*.html doc/*.pdf "${pkgdir}/usr/share/doc/iproute2/"
}

sha1sums=('956873cdb42c002c967a2d0f9ca5f77fadd375c3'
          'SKIP'
          '1ed328854983b3f9df0a143aa7c77920916a13c1'
          '6f3216405d322b5a12e7fb8330cf09c9ef1d6455'
          '63650febde48558d3bfe98e13a1e77ede8267bb0')
