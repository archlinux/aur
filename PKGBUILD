# Maintainer: Andreas 'Segaja' Schleifer <archlinux at segaja dot de>

pkgname=stern
pkgdesc="Multi pod and container log tailing for Kubernetes"
pkgver=1.14.0
pkgrel=1
arch=('x86_64')
url="https://github.com/stern/stern"
license=('apache')
depends=('glibc')
makedepends=('go')
source=(
  ${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz
)
sha256sums=('f166462dd2b0fb8227dfd1d15c4e718b0917a5d5bb33aeb609affa8e7ac41b4f')
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

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm 755 "./out/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

  "${pkgdir}/usr/bin/${pkgname}" --completion=bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
  "${pkgdir}/usr/bin/${pkgname}" --completion=zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
}
