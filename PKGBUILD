# Maintainer: Frederick Zhang <frederick888@tsundere.moe>

pkgname=gup
pkgver=1.10.1
pkgrel=1
pkgdesc='Update binaries installed by "go install" with goroutines'
arch=('x86_64' 'aarch64' 'armv7h' 'armv7l')
url='https://github.com/nao1215/gup'
license=('Apache-2.0')
depends=()
makedepends=('go')
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/nao1215/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('770e6a5f479998e8d4b223518e7182a292b2bf79be7e319e00ceed8d9471e8fd5339495263d29641b183d992fd6f23af24aa8cf1e028982195db92cbbffcbe3c')
b2sums=('fc7e55a99e9449293fdddc248848d727be0bdd6cc69d43d53b69c8d570b57cb8d8b22978c3e138b20937024dac2e6b543fe7eb91a5616d37084649151f8bc826')

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
