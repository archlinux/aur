# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="updatecli"
pkgver=0.80.0
pkgrel=1
pkgdesc="A declarative dependency management command line tool"
arch=('any')
url="https://www.${pkgname}.io"
_url="https://github.com/${pkgname}/${pkgname}"
license=('Apache-2.0')
depends=('glibc')
makedepends=('go') # 'make'
# checkdepends=('docker')
optdepends=('bash-completion: for shell auto-completion'
            'zsh-completions: for shell auto-completion')
_pkgsrc="${pkgname}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${_url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('37300c540849eb000318fbd19e737828dd79488c5ee5c251aea97d403d9ce2ee')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  [ -d "build" ] || mkdir "build"
  [ -d "completions" ] || mkdir "completions"
  [ -d "manpages" ] || mkdir "manpages"
}

build() {
  cd "${srcdir}/${_pkgsrc}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o "build/${pkgname}" .

  ./"scripts/manpages.sh"
  ./"scripts/completions.sh"
}

check() {
  cd "${srcdir}/${_pkgsrc}"
  # make test
  # make test-short
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -Dm755 "build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "README.adoc" "${pkgdir}/usr/share/doc/${pkgname}/README.adoc"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "manpages/${pkgname}.1.gz" "${pkgdir}/usr/share/man/man1/${pkgname}.1.gz"

  cd "completions"
  install -Dm644 "${pkgname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
  install -Dm644 "${pkgname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}.fish"
  install -Dm644 "${pkgname}.zsh"  "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
}
