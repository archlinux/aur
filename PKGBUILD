# Maintainer: Stephanie Wilde-Hobbs <steph@rx14.co.uk>
# Maintainer: Radostin Stoyanov  <rstoyanov1@gmail.com>
pkgname=libvirt-sandbox
pkgver=0.8.0
pkgrel=2
pkgdesc="An application sandbox toolkit"
arch=('i686' 'x86_64')
url="http://sandbox.libvirt.org/"
license=('LGPL')
depends=('libvirt-glib' 'libselinux' 'cpio')
makedepends=('gobject-introspection' 'intltool' 'rpcsvc-proto' 'xz-static')
optdepends=('dhclient: for sandbox network configuration using DHCP')
source=(
    http://libvirt.org/sources/sandbox/$pkgname-$pkgver.tar.gz{,.asc}
    '0001-builder-Use-prefix-to-identify-lib-path.patch'
    '0002-Use-boot-vmlinuz-linux-as-default-kernel-path.patch'
)

md5sums=('c8b4393ec3ea78cd77af826e478f34f9'
         'd714f9f47f4322d5e702694f0b9f2c19'
         'f1b8ba0a173499b6fbe5ea24d542047b'
         'd854d27d11b2d6cf8184667cae920839'
)

validpgpkeys=('DAF3A6FDB26B62912D0E8E3FBE86EBB415104FDF')
# Daniel P. Berrange <dan@berrange.com>

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -Np1 -i "${srcdir}/0001-builder-Use-prefix-to-identify-lib-path.patch"
  patch -Np1 -i "${srcdir}/0002-Use-boot-vmlinuz-linux-as-default-kernel-path.patch"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # Work around linker error caused by missing static library liblzma.a
  # by disabling LZMA support for now.
  ./configure \
      --prefix=/usr \
      --libexecdir=/usr/lib/$pkgname \
      --sysconfdir=/etc \
      --enable-introspection
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver"

  make -k check
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
