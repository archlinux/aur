# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=iperf-git
pkgver=abb57d0
pkgrel=1
epoch=1
pkgdesc="A tool to measure maximum TCP bandwidth"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/iperf2/"
license=('custom')
depends=('glibc')
makedepends=('git')
provides=('iperf')
conflicts=('iperf')
source=("git+https://git.code.sf.net/p/iperf2/code"
        "iperf-tcp.service::https://git.archlinux.org/svntogit/community.git/plain/trunk/iperf-tcp.service?h=packages/iperf"
        "iperf-udp.service::https://git.archlinux.org/svntogit/community.git/plain/trunk/iperf-udp.service?h=packages/iperf")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')


pkgver() {
  cd "code"

  git describe --long --tags --always
}

build() {
  cd "code"

  autoreconf -fi
  ./configure --prefix="/usr"
  make
}

package() {
  cd "code"

  make DESTDIR="$pkgdir" install
  install -Dm644 "COPYING" "$pkgdir/usr/share/licenses/iperf/COPYING"

  install -Dm644 "$srcdir/iperf-tcp.service" "$pkgdir/usr/lib/systemd/system/iperf-tcp.service"
  install -Dm644 "$srcdir/iperf-udp.service" "$pkgdir/usr/lib/systemd/system/iperf-udp.service"
}
