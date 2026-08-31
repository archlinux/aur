# Maintainer: Frederick Zhang <frederick888@tsundere.moe>

pkgname=gup
pkgver=1.9.1
pkgrel=1
pkgdesc='Update binaries installed by "go install" with goroutines'
arch=('x86_64' 'aarch64' 'armv7h' 'armv7l')
url='https://github.com/nao1215/gup'
license=('Apache-2.0')
depends=()
makedepends=('go')
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/nao1215/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('3ab82abb31ed97af730b807b4e8afe24ae56247246dd2d66e86cab18fde234a4ae2ece3615cbc88e50050c84f2a03572fa400212d443355c47281a91b04b7835')
b2sums=('0c2d71bcf321823d0352925684d9e514ea3dcbbecaead0158753890fef86506a172844a0b3d886d8a7579e8630f5a9e68ddb99ad4244434bfc9400a5f11a4aec')

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
