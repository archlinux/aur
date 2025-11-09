# Maintainer: Sebastian Eberlein <aur@s.eberlein.xyz>
# https://github.com/sebasnabas/pkgbuilds
# vi: ft=sh

pkgname=runme
pkgver=3.15.4
pkgrel=1
pkgdesc="DevOps Notebooks Built with Markdown"
arch=('x86_64' 'aarch64')
url="https://github.com/runmedev/runme"
license=('Apache-2.0')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('b10217526ea47b6c9e015e323f3e64b846dcca3ffc2cf14a9d44b4c0c4d8f3745f58bdda705c1684d9ca44aa240ecc9e005880ccf71804a35ad5ba66d964fe75')

build() {
  cd "${pkgname}-${pkgver}"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  export CGO_ENABLED=0
  go build \
    -ldflags "-s -w " \
    -ldflags "-X github.com/runmedev/runme/v3/internal/version.BuildVersion=${pkgver} " \
    -ldflags "-X github.com/runmedev/runme/v3/internal/version.BuildDate=$(date --iso-8601=ns)" \
    -o "${pkgname}"

  mkdir completion
  "./${pkgname}" completion bash > "completion/${pkgname}"
  "./${pkgname}" completion zsh > "completion/_${pkgname}"
  "./${pkgname}" completion fish > "completion/${pkgname}.fish"
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "${srcdir}/${pkgname}-${pkgver}/${pkgname}" -t "${pkgdir}/usr/bin/"
  install -Dm 644 "${srcdir}/${pkgname}-${pkgver}/completion/${pkgname}" -t "${pkgdir}/usr/share/bash-completion/completions/"
  install -Dm 644 "${srcdir}/${pkgname}-${pkgver}/completion/_${pkgname}" -t "${pkgdir}/usr/share/zsh/site-functions/"
  install -Dm 644 "${srcdir}/${pkgname}-${pkgver}/completion/${pkgname}.fish" -t "${pkgdir}/usr/share/fish/completions/"
}
