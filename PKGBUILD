# Maintainer: Baptiste Jonglez <baptiste--aur at jonglez dot org>
# Adapted from the net-tools package in [core].
pkgname=net-tools-mptcp
_srcname=net-tools
pkgver=0.91.1
pkgrel=1
epoch=2
pkgdesc="Configuration tools for Linux networking, with Multipath TCP support"
arch=('i686' 'x86_64')
license=('GPL2')
url="http://multipath-tcp.org/pmwiki.php/Users/Tools"
depends=('glibc')
provides=('net-tools')
# mptcp-net-tools is the old name of the AUR package
conflicts=('mptcp-net-tools' 'net-tools')
# Build fails with -jX for X > 1.  Force sequential build
options=(!makeflags)
source=("${pkgname}-${pkgver}::https://github.com/multipath-tcp/${_srcname}/archive/v${pkgver}.tar.gz")
sha256sums=('a04a390a09b90d12e9648c2f4adeb4d0a29c5a3ca00a3d4d2679e95a2dd9cbc4')

prepare() {
  cd "${srcdir}/${_srcname}-${pkgver}"
  sed -i "s#/sbin#/bin#" Makefile
  sed -i "s#/usr##" man/Makefile
}

build() {
  cd "${srcdir}/${_srcname}-${pkgver}"
  yes "" | make
}

package() {
  cd "${srcdir}/${_srcname}-${pkgver}"
  make DESTDIR="${pkgdir}/usr" update

  # the following is provided by yp-tools
  rm "${pkgdir}"/usr/bin/{nis,yp}domainname
  rm "${pkgdir}"/usr/share/man/man1/{nis,yp}domainname.1

  # hostname is provided by inetutils
  rm "${pkgdir}"/usr/bin/{hostname,dnsdomainname,domainname}
  rm -rf "${pkgdir}"/usr/share/man/man1
}
