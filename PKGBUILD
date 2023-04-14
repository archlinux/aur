# Maintainer: Mantas Mikulėnas <grawity@gmail.com>
pkgname=parpd
_commit=6f26ca2ef205424252bd1313a112ca3f54a08606
pkgver=2.0
pkgrel=1
pkgdesc="Proxy-ARP daemon"
arch=(i686 x86_64)
url="https://roy.marples.name/projects/parpd"
license=(BSD)
makedepends=(git)
source=("git+https://github.com/NetworkConfiguration/parpd#commit=$_commit"
        "parpd.service")
sha256sums=('SKIP'
            'aad7280e84c669e90ae6cc97c9fa71b00d1851a6ae02b80f79488f8d1cc0d3bd')

pkgver() {
  cd "$pkgname"
  git describe | sed "s/^parpd-//; s/-/.r/; s/-/./"
}

build() {
  cd "$pkgname"
  ./configure \
    --prefix=/usr       \
    --sbindir=/usr/bin  \
    --rundir=/run       \
    ;
  # Missing in 2.0.0
  echo '#define __arraycount(a) (sizeof(a) / sizeof(a[0]))' >> config.h
  make
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir" install
  install -Dm644 ../parpd.service "$pkgdir"/usr/lib/systemd/system/parpd.service
}

# vim: ts=2:sw=2:et
