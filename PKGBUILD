# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="cunicu"
pkgver=0.12.0
pkgrel=1
pkgdesc="A zeroconf peer-to-peer mesh VPN using Wireguard® and Interactive Connectivity Establishment (ICE)"
arch=('x86_64' 'aarch64' 'i686' 'armv7h')
url="https://cunicu.li"
# _url="https://github.com/${pkgname}/${pkgname}"
_url="https://codeberg.org/${pkgname}/${pkgname}"
license=('Apache-2.0')
depends=('glibc')
makedepends=('git' 'go' 'protoc-gen-go' 'protoc-gen-go-grpc')
optdepends=('wireguard-tools: for controlling WireGuard interfaces')
_pkgsrc="${pkgname}-${pkgver}"
source=("${_pkgsrc}::git+${_url}.git#tag=v${pkgver}")
b2sums=('d4daa54843a2045bc84d07012f74f9d37fa57128c12f56a87aa7c15445b0cd8ea1ddb810ad5545f96e98c5b9f9775388af4d8cf84e65fe8fee010de4849e843f')
# validpgpkeys=('09BE3BAE8D55D4CD8579285A9675EAC34897E6E2') # Steffen Vogel (primary) <post@steffenvogel.de>

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  mkdir -p "build" "completions" "manpages"
}

build() {
  cd "${srcdir}/${_pkgsrc}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o "build/${pkgname}" -ldflags "\
    -X ${url#https://}/${pkgname}/pkg/buildinfo.Version=${pkgver} \
    -X ${url#https://}/${pkgname}/pkg/buildinfo.Tag=$(git describe --tags) \
    -X ${url#https://}/${pkgname}/pkg/buildinfo.Commit=$(git rev-parse HEAD) \
    -X ${url#https://}/${pkgname}/pkg/buildinfo.Branch=$(git rev-parse --abbrev-ref HEAD) \
    -X ${url#https://}/${pkgname}/pkg/buildinfo.DateStr=$(date -Iseconds)" \
    ./"cmd/${pkgname}"

  for _sh in bash fish zsh powershell; do
    ./"build/${pkgname}" completion "${_sh}" > "completions/${pkgname}.${_sh}"
  done

  ./"build/${pkgname}" docs man > "manpages/${pkgname}.1"
}

# check() {
#   cd "${srcdir}/${_pkgsrc}"
#   go test ./...
# }

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -vDm755 "build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -vDm644 "manpages/${pkgname}.1" "${pkgdir}/usr/share/man/man1/${pkgname}.1"

  cd "${srcdir}/${_pkgsrc}/completions"
  install -vDm644 "${pkgname}.bash"       "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
  install -vDm644 "${pkgname}.fish"       "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}.fish"
  install -vDm644 "${pkgname}.zsh"        "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
  install -vDm644 "${pkgname}.powershell" "${pkgdir}/usr/share/powershell/Completions/${pkgname}.ps1"

  cd "${srcdir}/${_pkgsrc}/etc"
  install -vDm644 "${pkgname}.yaml" "${pkgdir}/etc/${pkgname}.example.yaml"

  cd "${srcdir}/${_pkgsrc}/etc/systemd"
  install -vDm644 "${pkgname}.service" "${pkgdir}/usr/lib/systemd/${pkgname}.service"
  install -vDm644 "${pkgname}.socket"  "${pkgdir}/usr/lib/systemd/${pkgname}.socket"
}
