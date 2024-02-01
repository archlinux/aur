# Maintainer: Fermín Olaiz <ferminolaiz@gmail.com>

pkgname=ploop
pkgver=9.0.21
pkgrel=1
pkgdesc="Disk loopback block device with many features like dynamic resize, snapshots, etc."
url="https://openvz.org/Ploop"
license=('GPL2' 'LGPL2.1')
arch=("x86_64")
source=(
  "git+https://src.openvz.org/scm/ovz/ploop.git#tag=v${pkgver}"
  "fix-static-syscalls.patch"
)
install=ploop.install
depends=('libxml2' 'python' 'libutil-linux' 'bash')
makedepends=('git')
sha256sums=(
  "SKIP"
  "5889a0b448ddc5a93a846cb651e5081ae5e7962b04deaf5c713e1c78de3662c3"
)

build() {
  cd "${srcdir}/${pkgname}"

  git apply  ../fix-static-syscalls.patch

  make
}

package() {
  cd "${srcdir}/${pkgname}"

  make DESTDIR="$pkgdir/" LIBDIR="/usr/lib" SBINDIR="/usr/bin" USRSBINDIR="/usr/bin" \
	  install
  mkdir -p $pkgdir/usr/lib/tmpfiles.d
  echo "d /var/lock/ploop 0755 root root -" >$pkgdir/usr/lib/tmpfiles.d/ploop.conf
  rm -rf $pkgdir/var
}
