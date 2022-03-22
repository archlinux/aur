# Maintainer: Giovanni Harting <539@idlegandalf.com>
# Contributor: Pavers_Career <pavers_career_0d AT ícloud DOT com>

pkgname=adguardhome
_pkgname=AdGuardHome
pkgver=0.107.5
pkgrel=2
epoch=1
pkgdesc="Network-wide ads and trackers blocking DNS server"
arch=(x86_64 aarch64 armv7h armv6h)
url="https://github.com/AdguardTeam/AdGuardHome"
license=('GPL')
source=("$pkgname-$pkgver.tar.gz::https://github.com/AdguardTeam/AdGuardHome/archive/v$pkgver.tar.gz"
        "$pkgname.service"
        "$pkgname.defaults"
)
makedepends=(go 'nodejs<17.0.0' npm yarn git)
b2sums=('92b7027296622862715479b265b79b7147afd69beef6cbb7bf02409ab288965f5bf77d87390ddd9068e0c061247a5071e43ad65e3337b919985964792fbc5ed1'
        '0e45eb3b76d00110d53caeebb4ced95b97895d8b2b4934d3bd7bdac3a572690a6c5dc176d70b5e1d9ac5f8e358e192dbd32681e01df92b404286103475bd22ba'
        'ec3a3cd8debae4dcb4a723ef2ba31960aa1f897e2f8c857fcf9861bc7959072b22fed3091c0d07084c280be0755d03bf6ca4fef5f2d08ae20397378e13cf9c9b')

prepare() {
  cd "$_pkgname-$pkgver"
  go get github.com/lucas-clemente/quic-go@9c8cadba9e359c2339372071e4f4fb0bd6c2f75b
}

build() {
  cd "$_pkgname-$pkgver"
  make -j1 CHANNEL=release VERBOSE=1 VERSION=v$pkgver
}

package() {
  install -Dm755 "$_pkgname-$pkgver/$_pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
  install -Dm644 "$srcdir"/$pkgname.defaults "$pkgdir/etc/defaults/$pkgname"
}
