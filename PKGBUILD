# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="cli-of-life"
pkgver=0.3.0
pkgrel=1
pkgdesc="Play Conway's Game of Life in your terminal"
arch=('any')
url="https://github.com/gabe565/${pkgname}"
license=('Apache-2.0')
depends=('glibc')
makedepends=('go')
optdepends=('bash-completion: for shell auto-completion'
            'zsh-completions: for shell auto-completion')
_pkgsrc="${pkgname}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('8505aaab9fd07f82dfaee7883703e0c6fb00cbdc7cf17c092c8554f41ce3be6a')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  mkdir -p "build" "completions" "manpages"
  go mod download
}

build() {
  cd "${srcdir}/${_pkgsrc}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o "build/${pkgname}" .

  # go run ./"internal/generate/completions"
  for _sh in bash fish zsh powershell; do
    ./"build/${pkgname}" --completion "${_sh}" > "completions/${pkgname}.${_sh}"
  done

  go run ./"internal/generate/manpages"
}

check() {
  cd "${srcdir}/${_pkgsrc}"
  go test ./...
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -Dm755 "build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "manpages/${pkgname}.1.gz" "${pkgdir}/usr/share/man/man1/${pkgname}.1.gz"

  cd "completions"
  install -Dm644 "${pkgname}.bash"       "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
  install -Dm644 "${pkgname}.fish"       "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}.fish"
  install -Dm644 "${pkgname}.zsh"        "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
  install -Dm644 "${pkgname}.powershell" "${pkgdir}/usr/share/powershell/Completions/${pkgname}.ps1"
}
