# Maintainer: Andreas 'Segaja' Schleifer <archlinux at segaja dot de>

pkgname=stern
pkgdesc="Multi pod and container log tailing for Kubernetes"
pkgver=1.15.0
pkgrel=1
arch=('x86_64')
url="https://github.com/stern/stern"
license=('apache')
depends=('glibc')
makedepends=('go')
source=(
  ${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz
)
sha256sums=('d62bd798d8b801d44c505f89890801424a3d2e1cd3b46c62ad49d250d20d50d8')
build() {
  cd "${pkgname}-${pkgver}"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

  go build \
    -ldflags "-linkmode external -X \"github.com/stern/stern/cmd.version=${pkgver}\"" \
    -o "./out/${pkgname}"
}

check() {
  cd "${pkgname}-${pkgver}"

  go test -v ./...
}

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm 755 "./out/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

  "${pkgdir}/usr/bin/${pkgname}" --completion=bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
  "${pkgdir}/usr/bin/${pkgname}" --completion=zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
}
