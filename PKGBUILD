# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_binname="space"
pkgname="${_binname}-cli"
pkgver=0.4.2
pkgrel=1
pkgdesc="Deta Space CLI"
arch=('any')
url="https://deta.space"
_url="https://github.com/deta/${pkgname}"
license=('MIT')
makedepends=('go')
depends=('glibc')
optdepends=('bash-completion: for shell auto-completion'
            'zsh-completions: for shell auto-completion')
provides=("${pkgname}" "${_binname}")
conflicts=("${pkgname}" "${_binname}")
_pkgsrc="${pkgname}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${_url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('3c7afc5349b5f2f1296f1c7bf24f055f97c08931f3877c2fd6e126c6cbebfdf2')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  mkdir -p "build" "completions"
  go mod download
  go mod tidy
}

build() {
  cd "${srcdir}/${_pkgsrc}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -v -o "build/${_binname}" -ldflags "\
    -X github.com/deta/space/cmd/shared.SpaceVersion=DEV" \
    .

  for _sh in bash fish zsh powershell; do
    ./"build/${_binname}" completion "${_sh}" > "completions/${_binname}.${_sh}"
  done
}

check() {
  cd "${srcdir}/${_pkgsrc}"
  go test ./...
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -Dm755 "build/${_binname}" "${pkgdir}/usr/bin/${_binname}"
  install -Dm644 "README.md"         "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE"           "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  cd "completions"
  install -Dm644 "${_binname}.bash"       "${pkgdir}/usr/share/bash-completion/completions/${_binname}"
  install -Dm644 "${_binname}.fish"       "${pkgdir}/usr/share/fish/vendor_completions.d/${_binname}.fish"
  install -Dm644 "${_binname}.zsh"        "${pkgdir}/usr/share/zsh/site-functions/_${_binname}"
  install -Dm644 "${_binname}.powershell" "${pkgdir}/usr/share/powershell/Completions/${_binname}.ps1"
}
