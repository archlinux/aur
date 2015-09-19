# Maintainer: Baptiste Jonglez <baptiste--aur at jonglez dot org>
# Adapted for the net-tools package in [core].
pkgname=net-tools-mptcp
_srcname=net-tools
_mptcpv=0.90
pkgver=0.90.585.1830361
pkgrel=1
pkgdesc="Configuration tools for Linux networking, with Multipath TCP support"
arch=('i686' 'x86_64')
license=('GPL2')
url="http://multipath-tcp.org/pmwiki.php/Users/Tools"
depends=('glibc')
makedepends=('git')
provides=('net-tools')
# Old AUR package
conflicts=('mptcp-net-tools')
# Build fails with -jX for X > 1.  Force sequential build
options=(!makeflags)
source=("git://github.com/multipath-tcp/net-tools#branch=mptcp_v${_mptcpv}")
sha1sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_srcname}"
  echo ${_mptcpv}.$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
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
  #rm "${pkgdir}"/usr/bin/{nis,yp}domainname
  rm "${pkgdir}"/usr/share/man/man1/{nis,yp}domainname.1

  # hostname is provided by inetutils
  #rm "${pkgdir}"/usr/bin/{hostname,dnsdomainname,domainname}
  rm -rf "${pkgdir}"/usr/share/man/man1
}
