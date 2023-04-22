# Maintainer: Mantas Mikulėnas <grawity@gmail.com>
pkgname=parpd
_commit=b0c8d28b5f2b49fce8a07c75ec031ed0f657a260
pkgver=2.1
pkgrel=1
pkgdesc="Proxy-ARP daemon"
arch=(i686 x86_64)
url="https://roy.marples.name/projects/parpd"
license=(BSD)
makedepends=(git)
source=("git+https://github.com/NetworkConfiguration/parpd#commit=$_commit"
        "parpd.service")
sha256sums=('SKIP'
            '5854839e487459500fb36ae6edce28ad99fa4799847688411ec12abf42c81be3')

pkgver() {
  cd "$pkgname"
  git describe | sed "s/^parpd-//; s/^v//; s/-/.r/; s/-/./"
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
