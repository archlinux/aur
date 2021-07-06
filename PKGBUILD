# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=iperf-git
pkgver=r2057.g029d09f
pkgrel=1
pkgdesc="A tool to measure maximum TCP bandwidth"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/iperf2/"
license=('custom')
depends=('gcc-libs')
makedepends=('git')
provides=('iperf')
conflicts=('iperf')
source=("git+https://git.code.sf.net/p/iperf2/code"
        "iperf-tcp.service::https://raw.githubusercontent.com/archlinux/svntogit-community/packages/iperf/trunk/iperf-tcp.service"
        "iperf-udp.service::https://raw.githubusercontent.com/archlinux/svntogit-community/packages/iperf/trunk/iperf-udp.service")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')


pkgver() {
  cd "code"

  _rev=$(git rev-list --count --all)
  _hash=$(git rev-parse --short HEAD)
  printf "r%s.g%s" "$_rev" "$_hash"
}

build() {
  cd "code"

  autoreconf -fi
  ./configure \
    --prefix="/usr" \
    --enable-fastsampling
  make
}

package() {
  cd "code"

  make DESTDIR="$pkgdir" install
  install -Dm644 "COPYING" -t "$pkgdir/usr/share/licenses/iperf"

  install -Dm644 "$srcdir"/iperf-{tcp,udp}.service -t "$pkgdir/usr/lib/systemd/system"
}
