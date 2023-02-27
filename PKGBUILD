# Maintainer: Asger Hautop Drewsen <asgerdrewsen@gmail.com>

pkgname=ippsample-git
pkgver=r1172.52ca490
pkgrel=1
pkgdesc="Sample, non-production-ready implementations of IPP Clients, Printers, Proxies, and System"
arch=(any)
url="https://istopwg.github.io/ippsample/"
license=('Apache 2')
makedepends=('git')
source=(git+https://github.com/istopwg/ippsample)

sha512sums=('SKIP')

pkgver() {
  cd ippsample
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    cd ippsample
    git submodule update --init
    ./configure --prefix=/usr
    make
}

check() {
    cd ippsample

    # Disabled as the "cupsGetDests" test hangs for me
    # make test
}

package() {
    cd ippsample
    make DESTDIR="$pkgdir/" install

    # Conflicts with cups
    rm "$pkgdir/usr/bin/ippeveprinter"
    rm "$pkgdir/usr/bin/ippfind"
    rm "$pkgdir/usr/bin/ipptool"

    mv "$pkgdir/usr/sbin"/* "$pkgdir/usr/bin/"
    rmdir "$pkgdir/usr/sbin"
}
