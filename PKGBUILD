# Maintainer: Andreas 'Segaja' Schleifer <archlinux at segaja dot de>

pkgname=alicloud-vault
pkgver=1.2.0
pkgrel=1
pkgdesc='A vault for securely storing and accessing Alibaba Cloud credentials in development environments'
arch=('x86_64')
url="https://github.com/arafato/${pkgname}"
license=('MIT')
depends=('glibc')
makedepends=('go-pie')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('865e7cb1e61d97bef8b0239e4528f4faceed005904805fa015c1a8952764dd4f43798a700f9cda3972a3a3b7fc4334527ddb80089f20a0312ac040ae1c08f440')

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
