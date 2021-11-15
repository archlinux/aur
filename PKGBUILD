# Maintainer: rany <rany 2 at riseup dot net>
pkgname=popuradns
_pkgname='PopuraDNS'
pkgver=0.1.0
pkgrel=4
pkgdesc="A simple DNS server with decentralized domain names support"
makedepends=('go')
arch=('i686' 'x86_64')
url="https://github.com/popura-network/PopuraDNS"
license=('Apache')
provides=('coredns')
conflicts=('coredns')
source=(${_pkgname}-${pkgver}.tar.gz::https://github.com/popura-network/PopuraDNS/archive/refs/tags/v${pkgver}.tar.gz
        coredns.service
        coredns-sysusers.conf
)
backup=('etc/coredns/Corefile')

sha256sums=('52aa97b35b88bffebf42052139d90d2bad6615b646c01f99e41a09e10cfc021d'
            'bbacde21632be9d7a9a758103775c768f9688372539b1b342ccf5c5db6746b4f'
            '536d03f8b20b0d2d6e8f96edd7e4e4dd7f6fef39ab0e952522d8725f3cc186b7')

build() {
  export GOPATH="$srcdir/build"
  export PATH="$GOPATH/bin:$PATH"
  cd "$srcdir/${_pkgname}-${pkgver}" || exit 1
  GOFLAGS='-modcacherw' ./build.sh
}

package() {
  install -Dm755 "$srcdir/${_pkgname}-${pkgver}/coredns" "$pkgdir/usr/bin/coredns"
  install -Dm644 "$srcdir/coredns.service" "$pkgdir/usr/lib/systemd/system/coredns.service"
  install -Dm644 "$srcdir/coredns-sysusers.conf" "$pkgdir/usr/lib/sysusers.d/coredns.conf"
  install -d "${pkgdir}/etc/coredns"
  install -Dm644 "$srcdir/${_pkgname}-${pkgver}/Corefile" "${pkgdir}/etc/coredns/Corefile"
  install -Dm644 "$srcdir/${_pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
