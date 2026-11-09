# Maintainer: Frederick Zhang <frederick888@tsundere.moe>

pkgname=gup
pkgver=1.10.4
pkgrel=1
pkgdesc='Update binaries installed by "go install" with goroutines'
arch=('x86_64' 'aarch64' 'armv7h' 'armv7l')
url='https://github.com/nao1215/gup'
license=('Apache-2.0')
depends=()
makedepends=('go')
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/nao1215/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('3976c5b90fc898b88311984b7f144e99e86696999f4ed6e569539fdc4a6154a5a91a1b4b97f014f4344b47dea882af08e26550f8a703a8f4b799e9ee51af0c4d')
b2sums=('1d9595ada059d082166b6339b8241fb9ee9240d1123b6073d19ff6611978e2284d4540d8c27e0ff4d952a6bb9b473e0e6fdeef193401c9356242103876375706')

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
