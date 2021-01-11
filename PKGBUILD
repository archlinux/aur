# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>

pkgname=libtirpc-minimal-git
pkgver=1.3.1
pkgrel=1
pkgdesc="Transport Independent RPC library (SunRPC replacement)"
arch=('x86_64')
url="http://git.linux-nfs.org/?p=steved/libtirpc.git;a=summary"
license=('BSD')
depends=('krb5')
backup=('etc/netconfig')
provides=(libtirpc)
conflicts=(libtirpc)
# git tree: git://linux-nfs.org/~steved/libtirpc
source=("git://git.linux-nfs.org/projects/steved/libtirpc.git")
sha1sums=('SKIP')

pkgver() {
  cd libtirpc
  git describe --tags | sed 's/-/+/g'
}

build() {
  cd libtirpc

  ./bootstrap
  ./configure --prefix=/usr --sysconf=/etc --disable-ipv6
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd libtirpc
  make DESTDIR="${pkgdir}" install
  install -D -m644 COPYING "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
