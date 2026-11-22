# Maintainer: mp0rta <3p0rta26@gmail.com>
pkgname=mqvpn-bin
pkgver=0.20.0
pkgrel=1
pkgdesc="Multipath VPN using MASQUE CONNECT-IP (RFC 9484) and Multipath QUIC (prebuilt binary)"
arch=(x86_64 aarch64)
url="https://github.com/mp0rta/mqvpn"
license=(Apache-2.0)
depends=(libevent gcc-libs glibc)
provides=(mqvpn)
conflicts=(mqvpn)
options=(!strip !debug)
source_x86_64=("https://github.com/mp0rta/mqvpn/releases/download/v${pkgver}/mqvpn_${pkgver}_amd64.tar.gz")
source_aarch64=("https://github.com/mp0rta/mqvpn/releases/download/v${pkgver}/mqvpn_${pkgver}_arm64.tar.gz")
sha256sums_x86_64=('92436de87cbeb0e12abf5d45abcc35414b24417ea0e75a4b5fc40c2992f9e1b5')
sha256sums_aarch64=('52cf53b57685892d9b3289daba2207a7eb90ac721c36117cb963d4ee8d184be9')

package() {
  install -Dm755 bin/mqvpn "${pkgdir}/usr/bin/mqvpn"
  install -Dm755 lib/mqvpn/mqvpn-server-nat.sh "${pkgdir}/usr/lib/mqvpn/mqvpn-server-nat.sh"
  # The NAT script runs this helper from its own directory.
  install -Dm755 lib/mqvpn/mqvpn-nat-config "${pkgdir}/usr/lib/mqvpn/mqvpn-nat-config"
  # The release tarball's units are generated for /usr/local.
  local unit
  for unit in systemd/*.service; do
    sed 's#/usr/local/#/usr/#g' "$unit" | install -Dm644 /dev/stdin "${pkgdir}/usr/lib/systemd/system/${unit##*/}"
  done
  install -Dm644 -t "${pkgdir}/etc/mqvpn" etc/mqvpn/*.conf.example
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE NOTICE
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/third-party" third-party/*.txt
}
