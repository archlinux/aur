# $Id: PKGBUILD 273590 2016-08-11 09:35:58Z eworm $
# Maintainer: Ronald van Haren <ronald.archlinux.org>
# Contributor: Judd Vinet <jvinet@zeroflux.org>
# Contributor: George Amanakis <g_amanakis@yahoo.com>

pkgbase=iproute2-cake
pkgname=(iproute2-cake iproute2-cake-doc)
pkgver=4.10.0
pkgrel=1
pkgdesc="IP Routing Utilities"
arch=('i686' 'x86_64')
license=('GPL2')
url="http://www.linuxfoundation.org/collaborate/workgroups/networking/iproute2"
#950 patch: https://raw.githubusercontent.com/lede-project/source/master/package/network/utils/iproute2/patches/950-add-cake-to-tc.patch
#modified according to github.com/dtaht/tc-adv repository
makedepends=('iptables' 'linux-atm' 'linuxdoc-tools' 'texlive-bin' 'texlive-core' 'texlive-latexextra')
options=('staticlibs' '!makeflags')
validpgpkeys=('9F6FC345B05BE7E766B83C8F80A77F6095CDE47E') # Stephen Hemminger
source=("https://www.kernel.org/pub/linux/utils/net/${pkgbase/-cake}/${pkgbase/-cake}-${pkgver}.tar."{xz,sign}
        '0001-make-iproute2-fhs-compliant.patch'
	'950b-add-cake-to-tc.patch'
	)
prepare() {
  cd "${srcdir}/${pkgbase/-cake}-${pkgver}"

  # set correct fhs structure
  patch -Np1 -i "${srcdir}/950b-add-cake-to-tc.patch"
  patch -Np1 -i "${srcdir}/0001-make-iproute2-fhs-compliant.patch"

  # do not treat warnings as errors
  sed -i 's/-Werror//' Makefile

}

build() {
  cd "${srcdir}/${pkgbase/-cake}-${pkgver}"

  ./configure
  make

  cd "${srcdir}/${pkgbase/-cake}-${pkgver}/doc/"

  make html pdf
}

package_iproute2-cake() {
  depends=('glibc' 'iptables')
  optdepends=('linux-atm: ATM support')
  groups=('base')
  provides=('iproute' 'iproute2' 'iproute2-doc')
  conflicts=('iproute' 'iproute2' 'iproute2-doc')
  replaces=('iproute')
  backup=('etc/iproute2/ematch_map' 'etc/iproute2/rt_dsfield' 'etc/iproute2/rt_protos' \
    'etc/iproute2/rt_realms' 'etc/iproute2/rt_scopes' 'etc/iproute2/rt_tables')

  cd "${srcdir}/${pkgbase/-cake}-${pkgver}"

  make DESTDIR="${pkgdir}" SBINDIR="/usr/bin" install

  # remove documentation
  rm -rf "${pkgdir}/usr/share/doc/"

  # libnetlink isn't installed, install it FS#19385
  install -Dm0644 include/libnetlink.h "${pkgdir}/usr/include/libnetlink.h"
  install -Dm0644 lib/libnetlink.a "${pkgdir}/usr/lib/libnetlink.a"
}

package_iproute2-cake-doc() {
  pkgdesc='IP Routing Utilities documentation'

  cd "${srcdir}/${pkgbase/-cake}-${pkgver}"

  make DESTDIR="${pkgdir}" install

  # documentation is included in default install target... So clean up here.
  find "${pkgdir}/" ! -type d ! -regex '.*examples.*' -delete
  find "${pkgdir}/" -empty -delete
  find "${pkgdir}/" -name '*.sgml' -delete
  find "${pkgdir}/" -name '*.tex' -delete

  install -m0644 doc/*.html doc/*.pdf "${pkgdir}/usr/share/doc/iproute2/"
}

sha1sums=('fc28f956a7a9695473312d0ed35dc24a7ef9d7f6'
          'SKIP'
          '1ed328854983b3f9df0a143aa7c77920916a13c1'
          '73c7e31c299fdb6d720fe0d0401b427f4cbd069c')
sha1sums=('9e578675f6938359a3036d7886b91d48c0403a40'
          'SKIP'
          '1ed328854983b3f9df0a143aa7c77920916a13c1'
          '35ac8bcaa03fa4d102e236adcfa519c8c992dbca')
