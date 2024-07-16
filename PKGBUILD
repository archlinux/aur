#Maintainer: Raihan Ahamed (raihan2000) <raihan1999ahamed@gmail.com>

pkgname=(hexagonrpcd)
pkgdesc="Qualcomm HexagonFS daemon"
pkgver=0.3.2.r0.gb7eff23
pkgrel=1
arch=(any)
license=(GPL-3.0-or-later)
url="https://gitlab.com/sdm845-mainline/hexagonrpc/"
depends=(glibc)
makedepends=(
    linux-headers
    meson
    git
)
_commit=b7eff23db1b11541d11175bd3f42bd4c85214baf  # tags/0.3.2^0
source=(
    "git+https://gitlab.com/sdm670-mainline/hexagonrpc.git#commit=$_commit"
    10-fastrpc.rules
    hexagonrpcd-adsp-rootpd.service
    hexagonrpcd-adsp-sensorspd.service
    hexagonrpcd-sdsp.service
)
sha256sums=(
    58ad8305f9cc06885dd2e589ed8637b1b8428f6930c7f36001b6b4570cfabd81
    41dfc4e8c4fd88f461a5a6e4a4e86849eb302f8bcb2b5ce2efa9690f5415d52d
    0e5b65dfc3623c286438e26ba75ceb158a68696d07101d62322d94eb33bd258b
    a48b11bfeac17e32b38e0e69a5276ba192cb9270a296ffc0912fc6d465e1847f
    db3a5898ed91277223dc1dbbc750e44b77a24626bd744eaac8dde37614c3b30f
)

pkgver() {
  cd hexagonrpc
  git describe --long --abbrev=7 --tags $_commit | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson hexagonrpc build
  meson compile -C build
}

package() {
  DESTDIR="$pkgdir" meson install --no-rebuild -C build

  echo -e 'g fastrpc\nu fastrpc - "Qualcomm HexagonFS service" /var/lib/fastrpc' |
    install -Dm644 /dev/stdin "$pkgdir/usr/lib/sysusers.d/fastrpc.conf"

  # Allow access for FastRPC node for FastRPC user/group
  install -Dm 644 "$srcdir"/10-fastrpc.rules -t "$pkgdir"/usr/lib/udev/rules.d/

  install -Dm755 "$srcdir"/$pkgname-adsp-rootpd.service "$pkgdir"/usr/lib/systemd/system/$pkgname-adsp-rootpd.service
  install -Dm755 "$srcdir"/$pkgname-adsp-sensorspd.service "$pkgdir"/usr/lib/systemd/system/$pkgname-adsp-sensorspd.service
  install -Dm755 "$srcdir"/$pkgname-sdsp.service "$pkgdir"/usr/lib/systemd/system/$pkgname-sdsp.service
}
