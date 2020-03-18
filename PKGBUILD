# Maintainer: Andreas 'Segaja' Schleifer <archlinux at segaja dot de>

pkgname=alicloud-vault
pkgver=1.1.1
pkgrel=1
pkgdesc='A vault for securely storing and accessing Alibaba Cloud credentials in development environments'
arch=('x86_64')
url="https://github.com/arafato/${pkgname}"
license=('MIT')
depends=('glibc')
makedepends=('go-pie')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('862082f0f1fe585923cfe8aa782f67cd10dc1752d9e9590c7f5ab6bf67ae4e112e9e310eb8c16ab516e2e0d38902ea105205f2138dfbb6a24a1061bb3f09c702')

build() {
  cd "${pkgname}-${pkgver}"

  go build \
    -trimpath \
    -ldflags="-extldflags ${LDFLAGS} -X main.Version=${pkgver} -s -w" \
    -o "./${pkgname}" .

  go clean --modcache
}

check() {
  cd "${pkgname}-${pkgver}"

  go test ./...
}

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 LICENSE
}
