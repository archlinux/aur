# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="cunicu"
pkgname="${_pkgname}-git"
pkgver=0.5.15.r0.ga9cf67a
pkgrel=1
pkgdesc="A zeroconf peer-to-peer mesh VPN using Wireguard® and Interactive Connectivity Establishment (ICE)"
arch=('any')
url="https://${_pkgname}.li"
# _url="https://github.com/${_pkgname}/${_pkgname}"
_url="https://codeberg.org/${_pkgname}/${_pkgname}"
license=('Apache-2.0')
depends=('glibc' 'gcc-libs')
makedepends=('git' 'go' 'protoc-gen-go' 'protoc-gen-go-grpc') # 'make' 'golangci-lint'
# checkdepends=('ginkgo')
optdepends=('bash-completion: for shell auto-completion'
            'zsh-completions: for shell auto-completion'
            'wireguard-tools: for controlling WireGuard interfaces')
provides=("${_pkgname}=${pkgver%%.r*}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}"
source=("${_pkgsrc}::git+${_url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgsrc}"
  git describe --long --tags --abbrev=7 | sed 's/v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  # make prepare

  mkdir -p "build" "completions" "manpages"
  go mod tidy
  go generate ./...
  go mod download
}

build() {
  cd "${srcdir}/${_pkgsrc}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  # make

  go build -o "build/${_pkgname}" -ldflags "\
    -X ${url#https://}/${_pkgname}/pkg/buildinfo.Version=${pkgver} \
    -X ${url#https://}/${_pkgname}/pkg/buildinfo.Tag=$(git describe --tags) \
    -X ${url#https://}/${_pkgname}/pkg/buildinfo.Commit=$(git rev-parse HEAD) \
    -X ${url#https://}/${_pkgname}/pkg/buildinfo.Branch=$(git rev-parse --abbrev-ref HEAD) \
    -X ${url#https://}/${_pkgname}/pkg/buildinfo.DateStr=$(date -Iseconds)" \
    ./"cmd/${_pkgname}"

  # make completions
  for _sh in bash fish zsh powershell; do
    ./"build/${_pkgname}" completion "${_sh}" > "completions/${_pkgname}.${_sh}"
  done

  # make docs
  ./"build/${_pkgname}" docs man > "manpages/${_pkgname}.1"
}

# check() {
#   cd "${srcdir}/${_pkgsrc}"
#   # make tests
# 
#   go test ./...
# }

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -Dm755 "build/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -Dm644 "manpages/${_pkgname}.1" "${pkgdir}/usr/share/man/man1/${_pkgname}.1"

  cd "completions"
  install -Dm644 "${_pkgname}.bash"       "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
  install -Dm644 "${_pkgname}.fish"       "${pkgdir}/usr/share/fish/vendor_completions.d/${_pkgname}.fish"
  install -Dm644 "${_pkgname}.zsh"        "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
  install -Dm644 "${_pkgname}.powershell" "${pkgdir}/usr/share/powershell/Completions/${_pkgname}.ps1"
}
