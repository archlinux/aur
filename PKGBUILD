# Maintainer: Baptiste Jonglez <baptiste--aur at jonglez dot org>
# Adapted from the net-tools package in [core].
pkgname=net-tools-mptcp
_srcname=net-tools
_mptcpv=0.91
pkgver=0.91.1.r0.g888d808
pkgrel=1
epoch=1
pkgdesc="Configuration tools for Linux networking, with Multipath TCP support"
arch=('i686' 'x86_64')
license=('GPL2')
url="http://multipath-tcp.org/pmwiki.php/Users/Tools"
depends=('glibc')
makedepends=('git')
provides=('net-tools')
# mptcp-net-tools is the old name of the AUR package
conflicts=('mptcp-net-tools' 'net-tools')
# Build fails with -jX for X > 1.  Force sequential build
options=(!makeflags)
source=("git://github.com/multipath-tcp/net-tools#branch=mptcp_v${_mptcpv}")
sha1sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_srcname}"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${_srcname}"
  sed -i "s#/sbin#/bin#" Makefile
  sed -i "s#/usr##" man/Makefile
}

build() {
  cd "${srcdir}/${_srcname}"
  yes "" | make
}

package() {
  cd "${srcdir}/${_srcname}"
  make DESTDIR=${pkgdir}/usr update

  # the following is provided by yp-tools
  rm "${pkgdir}"/usr/bin/{nis,yp}domainname
  rm "${pkgdir}"/usr/share/man/man1/{nis,yp}domainname.1

  # hostname is provided by inetutils
  rm "${pkgdir}"/usr/bin/{hostname,dnsdomainname,domainname}
  rm -rf "${pkgdir}"/usr/share/man/man1
}
