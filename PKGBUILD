# Maintainer: David Birks <david@birks.dev>
pkgname=ssmsh
pkgver=2.1.0
pkgrel=1
pkgdesc='Interactive shell for the AWS Parameter Store'
arch=('x86_64')
url='https://github.com/bwhaley/ssmsh'
license=('MIT')
makedepends=('go>=1.27.2')
options=('!debug')
source=("ssmsh-${pkgver}.tar.gz::https://github.com/bwhaley/ssmsh/archive/v${pkgver}.tar.gz")
b2sums=('b76bc7013d571f3662a1d70af89adc5f74d356e4c0786a886ddd254b0531f9c30ed9cd0cb37b7bf5e405aac9d9aad061a4f91f6799c6df2ac47559c70d3562fe')

build() {
  cd "${srcdir}/ssmsh-${pkgver}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -buildvcs=false -mod=readonly -modcacherw"
  go build \
    -ldflags="-X main.Version=${pkgver}" \
    -o ssmsh \
    .
}

package() {
  install -Dm755 "${srcdir}/ssmsh-${pkgver}/ssmsh" "${pkgdir}/usr/bin/ssmsh"
  install -Dm644 "${srcdir}/ssmsh-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
