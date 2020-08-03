# Maintainer: Andreas 'Segaja' Schleifer <archlinux at segaja dot de>

pkgname=stern
pkgdesc="Multi pod and container log tailing for Kubernetes"
pkgver=1.11.0
pkgrel=1
arch=('x86_64')
url="https://github.com/wercker/stern"
license=('apache')
depends=('glibc')
makedepends=('go')
source=(
  ${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz
  gomodules.patch::https://github.com/wercker/stern/commit/30c4a62d610f8695267e2e5ca0d1b32491bbc04d.patch
)
sha256sums=('d6f47d3a6f47680d3e4afebc8b01a14f0affcd8fb625132af14bb77843f0333f'
            '872b9c67fcf8ee622a40a1eec020bced187bb833ea0beeace2c283e2889f1f4e')

build() {
  cd ${pkgname}-${pkgver}

  patch -p1 -i ../gomodules.patch

  export GO11MODULE=on
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath"

  go build -o "./out/${pkgname}"
}

package() {
  cd ${pkgname}-${pkgver}

  install -Dm 755 "./out/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

  "${pkgdir}/usr/bin/${pkgname}" --completion=bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
  "${pkgdir}/usr/bin/${pkgname}" --completion=zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
}
