# Maintainer: Claus Klingberg <cjk at pobox dot com>
# Contributor: vapourismo <ole at vprsm dot de>
_pkgname=knxd
pkgname='knxd-git'
pkgver=1899.r10b76ff
pkgrel=1
pkgdesc='A server-daemon which provides an interface to a KNX/EIB installation'
license=('GPL')

arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
conflicts=('knxd' 'eibd')
provides=('knxd')
replaces=('eibd')
depends=('fmt' 'gcc-libs' 'libev' 'libusb')
optdepends=('libsystemd')
makedepends=('git' 'libtool' 'autoconf' 'automake' 'pkgconfig')

source=("git+https://github.com/knxd/${_pkgname}.git#branch=main")
sha512sums=('SKIP')
url="https://github.com/knxd/knxd"

pkgver() {
  cd "$_pkgname"
  printf "%s.r%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"
  sh ./bootstrap.sh
  ./configure \
    --prefix="/usr" \
    --sysconfdir=/etc \
    --libdir=/usr/lib \
    --libexecdir=/usr/lib \
    --enable-usb
  make
}

package() {
  backup=(etc/knxd.conf)

  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir/" install
}
