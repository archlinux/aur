# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_binname="kubedb"
pkgname="${_binname}-cli"
pkgver=0.47.0
pkgrel=1
pkgdesc="kubectl plugin for KubeDB"
arch=('any')
url="https://${_binname}.com"
_url="https://github.com/${_binname}/cli"
license=('custom:AppsCode-Community-1.0.0')
provides=("${pkgname}" "${_binname}")
conflicts=("${pkgname}" "${_binname}")
makedepends=('go')
depends=('glibc')
optdepends=('bash-completion: for shell auto-completion'
            'zsh-completions: for shell auto-completion')
_pkgsrc="cli-${pkgver}"
source=("${_pkgsrc}.tar.gz::${_url}/archive/refs/tags/v${pkgver}.tar.gz"
        "LICENSE.md::https://github.com/appscode/licenses/raw/1.0.0/AppsCode-Community-1.0.0.md")
sha256sums=('9bad4453f6e89b704d00207f0008a1d5fa2289ae9011cabb48f7a4e32a8e776f'
            '98112798ec6560d74223511ed367c2c170a63e5cdf5855dd444009cb3c80b07c')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  mkdir -p "build" "completions"
  go mod download
}

build() {
  cd "${srcdir}/${_pkgsrc}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o "build/${_binname}" ./"cmd/kubectl-dba"

  for _sh in bash fish zsh powershell; do
    ./"build/${_binname}" completion "${_sh}" > "completions/${_binname}.${_sh}"
  done
}

check() {
  cd "${srcdir}/${_pkgsrc}"
  go test ./...
}

package() {
  cd "${srcdir}"
  install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"

  cd "${_pkgsrc}"
  install -Dm755 "build/${_binname}" "${pkgdir}/usr/bin/${_binname}"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  cd "completions"
  install -Dm644 "${_binname}.bash"       "${pkgdir}/usr/share/bash-completion/completions/${_binname}"
  install -Dm644 "${_binname}.fish"       "${pkgdir}/usr/share/fish/vendor_completions.d/${_binname}.fish"
  install -Dm644 "${_binname}.zsh"        "${pkgdir}/usr/share/zsh/site-functions/_${_binname}"
  install -Dm644 "${_binname}.powershell" "${pkgdir}/usr/share/powershell/Completions/${_binname}.ps1"
}
