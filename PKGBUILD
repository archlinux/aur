# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_binname="kubedb"
_pkgname="${_binname}-cli"
pkgname="${_pkgname}-git"
pkgver=0.47.0.rc.1.r1.ga82c4b2
pkgrel=2
pkgdesc="kubectl plugin for KubeDB"
arch=('any')
url="https://${_binname}.com"
_url="https://github.com/${_binname}/cli"
license=('custom:AppsCode-Community-1.0.0')
provides=("${_pkgname}=${pkgver%%.r*}" "${_binname}=${pkgver%%.r*}")
conflicts=("${_pkgname}" "${_binname}")
makedepends=('git' 'go')
depends=('glibc')
optdepends=('bash-completion: for shell auto-completion'
            'zsh-completions: for shell auto-completion')
_pkgsrc="cli"
source=("${_pkgsrc}::git+${_url}.git"
        "LICENSE.md::https://github.com/appscode/licenses/raw/1.0.0/AppsCode-Community-1.0.0.md")
sha256sums=('SKIP'
            '98112798ec6560d74223511ed367c2c170a63e5cdf5855dd444009cb3c80b07c')

pkgver() {
  cd "${_pkgsrc}"
  git describe --long --tags --abbrev=7 | sed 's/v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  mkdir -p "build" "completions"
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
  install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.md"

  cd "${_pkgsrc}"
  install -Dm755 "build/${_binname}" "${pkgdir}/usr/bin/${_binname}"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"

  cd "completions"
  install -Dm644 "${_binname}.bash"       "${pkgdir}/usr/share/bash-completion/completions/${_binname}"
  install -Dm644 "${_binname}.fish"       "${pkgdir}/usr/share/fish/vendor_completions.d/${_binname}.fish"
  install -Dm644 "${_binname}.zsh"        "${pkgdir}/usr/share/zsh/site-functions/_${_binname}"
  install -Dm644 "${_binname}.powershell" "${pkgdir}/usr/share/powershell/Completions/${_binname}.ps1"
}
