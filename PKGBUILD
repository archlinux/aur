# Maintainer: Sebastian Eberlein <aur@s.eberlein.xyz>
# https://github.com/sebasnabas/pkgbuilds
# vi: ft=sh

pkgname=runme
pkgver=3.16.5
pkgrel=1
pkgdesc="DevOps Notebooks Built with Markdown"
arch=('x86_64' 'aarch64')
url="https://github.com/runmedev/runme"
license=('Apache-2.0')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('a96662b8d24875d6991f07d8e8b5f8b7caf3577f2ec1b6ad4a1c60e5ee632e7f5ac986fd1a44902d040c5b5b9cbdfb6b518f2722178b19813174a2da92b30dce')

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
