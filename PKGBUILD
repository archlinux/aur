# Maintainer: Claus Klingberg <cjk at pobox dot com>
# Contributor: vapourismo <ole at vprsm dot de>
_pkgname=knxd
pkgname='knxd-git'
pkgver=1909.r3fa3794
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

source=("git+https://github.com/knxd/${_pkgname}.git#branch=main" "https://patch-diff.githubusercontent.com/raw/knxd/knxd/pull/549.diff")
sha512sums=('SKIP')
url="https://github.com/knxd/knxd"

pkgver() {
  cd "$_pkgname"
  printf "%s.r%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_pkgname"
  # Apply patch to support recent fmt-library version >= 10.0.0
  patch --forward --strip=1 --input="../549.diff"
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

sha512sums=('SKIP'
            '7a72256943e805eb77bdfd8cf1582eca71e2448c84ec3ffb6a36b9d701f11f1279fb6d0a06a1992272edbe139ee342e0558dca297ba08595c0b74ca6bc969e35')
