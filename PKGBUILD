# net-tools-debian-ifconfig PKGBUILD by Vittorio Gambaletta <archlinux@vittgam.net>
#
# Original PKGBUILD maintainer: Ronald van Haren <ronald.archlinux.org>
# Original PKGBUILD contributor: judd <jvinet@zeroflux.org>

origpkgname=net-tools
pkgname=${origpkgname}-debian-ifconfig
pkgver=1.60.20161209git
_commit=90da8a01
pkgrel=2
pkgdesc="Configuration tools for Linux networking, with Debian-style ifconfig output"
arch=('i686' 'x86_64' 'aarch64')
license=('GPL2')
url="http://net-tools.sourceforge.net/"
depends=('glibc')
makedepends=('git')
conflicts=('net-tools')
provides=('net-tools')
# use git snapshot currently prefered over release
source=("net-tools::git://git.code.sf.net/p/net-tools/code#commit=${_commit}"
        debian-ifconfig.patch)
options=(!makeflags)
sha512sums=('SKIP'
          '3d074c65a1001ebb4ee67d0391c2df960c4c4c077ac8e272ae7e0ae6655d428776375837c0761bb21ebac9e6b0964ea8d2c13153fa10973e30fddcc92148f622')

prepare() {
  sed -i "s#/sbin#/bin#" ${srcdir}/${origpkgname}/Makefile
  sed -i "s#/usr##" ${srcdir}/${origpkgname}/man/Makefile
}

build() {
  cd ${srcdir}/${origpkgname}
  patch -Np1 -i ${srcdir}/debian-ifconfig.patch
  yes "" | make
}

package() {
  cd ${srcdir}/${origpkgname}
  make DESTDIR=${pkgdir}/usr update

  # the following is provided by yp-tools
  rm "${pkgdir}"/usr/bin/{nis,yp}domainname
  rm "${pkgdir}"/usr/share/man/man1/{nis,yp}domainname.1

  # hostname is provided by inetutils
  rm "${pkgdir}"/usr/bin/{hostname,dnsdomainname,domainname}
  rm -rf "${pkgdir}"/usr/share/man/man1
}
