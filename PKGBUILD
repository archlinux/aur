# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="cunicu"
pkgver=0.5.49
pkgrel=1
pkgdesc="A zeroconf peer-to-peer mesh VPN using Wireguard® and Interactive Connectivity Establishment (ICE)"
arch=('x86_64' 'aarch64' 'i686' 'armv7h')
url="https://cunicu.li"
# _url="https://github.com/${pkgname}/${pkgname}"
_url="https://codeberg.org/${pkgname}/${pkgname}"
license=('Apache-2.0')
depends=('glibc' 'gcc-libs')
makedepends=('git' 'go' 'protoc-gen-go' 'protoc-gen-go-grpc') # 'golangci-lint'
# checkdepends=('ginkgo')
optdepends=('wireguard-tools: for controlling WireGuard interfaces')
_pkgsrc="${pkgname}-${pkgver}"
source=("${_pkgsrc}::git+${_url}.git#tag=v${pkgver}")
b2sums=('309ff0ff36276b03e5b60b5f3e9a1ad42ca4fa79aa699cc4ea0bff88671a47cc8607e8e078f4f69699a5c96c649d9cddfb6e3f21dbae813827ec14b45c100efd')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  # make prepare
  mkdir -p "build" "completions" "manpages"
}

build() {
  cd "${srcdir}/${_pkgsrc}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  # make

  go build -o "build/${pkgname}" -ldflags "\
    -X ${url#https://}/${pkgname}/pkg/buildinfo.Version=${pkgver} \
    -X ${url#https://}/${pkgname}/pkg/buildinfo.Tag=$(git describe --tags) \
    -X ${url#https://}/${pkgname}/pkg/buildinfo.Commit=$(git rev-parse HEAD) \
    -X ${url#https://}/${pkgname}/pkg/buildinfo.Branch=$(git rev-parse --abbrev-ref HEAD) \
    -X ${url#https://}/${pkgname}/pkg/buildinfo.DateStr=$(date -Iseconds)" \
    ./"cmd/${pkgname}"

  # make completions
  for _sh in bash fish zsh powershell; do
    ./"build/${pkgname}" completion "${_sh}" > "completions/${pkgname}.${_sh}"
  done

  # make docs
  ./"build/${pkgname}" docs man > "manpages/${pkgname}.1"
}

# check() {
#   cd "${srcdir}/${_pkgsrc}"
#   # make tests
# 
#   go test ./...
# }

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -Dm755 "build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "manpages/${pkgname}.1" "${pkgdir}/usr/share/man/man1/${pkgname}.1"

  cd "completions"
  install -Dm644 "${pkgname}.bash"       "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
  install -Dm644 "${pkgname}.fish"       "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}.fish"
  install -Dm644 "${pkgname}.zsh"        "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
  install -Dm644 "${pkgname}.powershell" "${pkgdir}/usr/share/powershell/Completions/${pkgname}.ps1"

  cd "${srcdir}/${_pkgsrc}/etc"
  install -Dm644 "${pkgname}.yaml" "${pkgdir}/etc/${pkgname}.example.yaml"

  cd "systemd"
  install -Dm644 "${pkgname}.service" "${pkgdir}/usr/lib/systemd/${pkgname}.service"
}
