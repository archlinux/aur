# Maintainer: vitaliikuzhdin <vitaliikuzhdin@gmail.com>

pkgname="algolia"
pkgver=1.6.11
pkgrel=2
pkgdesc="Interact with and configure Algolia applications"
arch=('any')
url="https://github.com/${pkgname}/cli"
license=('MIT')
depends=('glibc')
makedepends=('make' 'go')
_pkgsrc="cli-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('0965dadab1519128130532141701efbf56310f7cb9735c1da596cf6f2aad4657')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  ./"scripts/completions.sh"
}

build() {
  cd "${srcdir}/${_pkgsrc}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  make build
}

check() {
  cd "${srcdir}/${_pkgsrc}"
  make test
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  cd "completions"
  install -Dm644 "${pkgname}.bash" "$pkgdir/usr/share/bash-completion/completions/${pkgname}"
  install -Dm644 "${pkgname}.fish" "$pkgdir/usr/share/fish/vendor_completions.d/${pkgname}.fish"
  install -Dm644 "${pkgname}.zsh" "$pkgdir/usr/share/zsh/site-functions/_${pkgname}"
}
