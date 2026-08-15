# Maintainer: Frederick Zhang <frederick888@tsundere.moe>

pkgname=gup
pkgver=1.8.1
pkgrel=1
pkgdesc='Update binaries installed by "go install" with goroutines'
arch=('x86_64' 'aarch64' 'armv7h' 'armv7l')
url='https://github.com/nao1215/gup'
license=('Apache-2.0')
depends=()
makedepends=('go')
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/nao1215/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('c0fa4520b3ec38dea9eace66ebbae4fb492d2e7b0d40531dd143629e1d9b22d3c0f01e39a8aa3b45c9639b267d5db26a15c405239fec088e4d64893330d87930')
b2sums=('f5bd8fb31ffdeed7d9b06eaaaa0c0f590b1a9b08bcb0905f2b9e72df35a4b8e4c49902502ebf5311b8dc321ff22a41431a909e2c11d3223ec64e4fed0ba0b59e')

build() {
  cd "${pkgname}-${pkgver}"

  # set Go flags
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOPATH="${srcdir}"

  go build -v \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-compressdwarf=false \
    -linkmode external \
    -X github.com/nao1215/gup/internal/cmdinfo.Version=v${pkgver}
    -extldflags \"${LDFLAGS}\"" \
    -o "${pkgname}"
  "./${pkgname}" completion bash >"${pkgname}.bash"
  "./${pkgname}" completion zsh  >"${pkgname}.zsh"
  "./${pkgname}" completion fish >"${pkgname}.fish"
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "${pkgname}" -t "${pkgdir}"/usr/bin/
  install -Dm644 "${pkgname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
  install -Dm644 "${pkgname}.zsh"  "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
  install -Dm644 "${pkgname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}.fish"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}

# vim: ts=2 sw=2 et:
