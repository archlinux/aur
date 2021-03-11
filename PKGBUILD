# Maintainer: Bryan Richardson <bryan at activeshadow dot com>
pkgname=minimega
pkgver=2.7.1
pkgrel=1
pkgdesc="a distributed VM management tool"
arch=('x86_64')
url="https://minimega.org"
license=('GPL3')
source=("https://github.com/activeshadow/minimega/archive/2.7.1.tar.gz")
sha256sums=('9efa0d9d0b1e80ea5d4ec11ad292aacc88d8489277a667991407d9ca5e5fe3de')
provides=("minimega")
depends=(qemu openvswitch ntfs-3g libpcap dosfstools)
optdepends=(dnsmasq)
install=minimega.install

prepare() {
  wget -O go.tgz https://golang.org/dl/go1.12.17.linux-amd64.tar.gz \
    && tar -xzf go.tgz && rm go.tgz

  export PATH=$srcdir/go/bin:$PATH
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./build.bash
}

package() {
  mkdir -p "$pkgdir/opt/$pkgname"
  mkdir -p "$pkgdir/opt/$pkgname"

  cp -a "$pkgname-$pkgver/bin" "$pkgdir/opt/$pkgname"
  cp -a "$pkgname-$pkgver/misc" "$pkgdir/opt/$pkgname"

  install -Dm644 "$startdir/minimega.service" "$pkgdir/usr/lib/systemd/system/minimega.service"
  install -Dm644 "$startdir/miniweb.service" "$pkgdir/usr/lib/systemd/system/miniweb.service"

  install -Dm644 "$pkgname-$pkgver/README" "$pkgdir/usr/share/doc/$pkgname/README"
  install -Dm644 "$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/doc/$pkgname/LICENSE"
  install -Dm644 "$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -Dm755 "$startdir/kvm" "$pkgdir/usr/bin/kvm"
  install -Dm755 "$startdir/mm" "$pkgdir/usr/bin/mm"
}

# vim:set ts=2 sw=2 et:
