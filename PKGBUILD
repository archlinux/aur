# Maintainer: Andreas 'Segaja' Schleifer <archlinux at segaja dot de>

pkgname=alicloud-vault
pkgver=1.1.2
pkgrel=1
pkgdesc='A vault for securely storing and accessing Alibaba Cloud credentials in development environments'
arch=('x86_64')
url="https://github.com/arafato/${pkgname}"
license=('MIT')
depends=('glibc')
makedepends=('go-pie')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('268e791b14049c3c81a50b6bdc07743943b1d01dc29495c22f939d43d44455bf56d554c392265256b1475758e6a1043566f80e42c6b1f1deec4b13dd48cd8a83')

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
