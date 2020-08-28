# Maintainer: Hao Long <aur@esd.cc>

pkgname=tcppc
pkgver=0.4.0
pkgrel=1
pkgdesc="A simple honeypot to capture TCP/TLS/UDP payloads on ALL ports"
arch=("x86_64" "i686")
url="https://github.com/md-irohas/tcppc-go"
license=("MIT")
depends=("glibc")
makedepends=("go")
backup=("etc/tcppc.toml")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('8c2d678a20d03e1ebfd6cf9921df84f4a2f54818df88b8600897fc5221884f91')

prepare() {
  cd tcppc-go-${pkgver}
  # Init Go Module enviroment
  go mod init github.com/md-irohas/tcppc-go
  go mod tidy
  # Binary will install to /usr/bin/tcppc
  sed -i "s|/usr/local/bin/tcppc|/usr/bin/tcppc|g" tcppc.service.orig
  # Log file should be placed in /var/log/tcppc
  sed -i "s|data/tcppc-%Y%m%d.jsonl|/var/log/tcppc/tcppc-%Y%m%d.jsonl|g" tcppc.toml.orig
}

build() {
  cd tcppc-go-${pkgver}
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build .
}

package() {
  cd tcppc-go-${pkgver}
  install -Dm755 tcppc-go ${pkgdir}/usr/bin/${pkgname}
  install -Dm644 tcppc.service.orig ${pkgdir}/usr/lib/systemd/system/tcppc.service
  install -Dm644 tcppc.toml.orig ${pkgdir}/etc/tcppc.toml
}

