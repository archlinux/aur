# Maintainer: Frederick Zhang <frederick888@tsundere.moe>

pkgname=gup
pkgver=1.8.0
pkgrel=1
pkgdesc='Update binaries installed by "go install" with goroutines'
arch=('x86_64' 'aarch64' 'armv7h' 'armv7l')
url='https://github.com/nao1215/gup'
license=('Apache-2.0')
depends=()
makedepends=('go')
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/nao1215/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('fd31dd2894c5b760e17fc0cd98b100f082cd38b80bc1f10aa6c7a0d2bf548a49179854affe9f2413b0e9cf91edf3d068cc43dcd914ae602c6b2ae937aebbf7b1')
b2sums=('b7b563eade523009f2d6de0bbaa8a8f0852e49a0c95b112ca943878658bf61d61fc2d570b9d213b5d49c9a8d74214ba08649c1491cacb07acf1c0271d32c6571')

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
