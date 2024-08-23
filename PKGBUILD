# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="ipsw"
pkgver=3.1.537
pkgrel=1
pkgdesc="iOS/macOS Research Swiss Army Knife"
arch=('any')
url="https://github.com/blacktop/${pkgname}"
license=('MIT')
makedepends=('git' 'go')
depends=('glibc')
optdepends=('bash-completion: for shell auto-completion'
            'zsh-completions: for shell auto-completion')
backup=("etc/${pkgname}.conf")
_pkgsrc="${pkgname}-${pkgver}"
source=("${_pkgsrc}::git+${url}#tag=v${pkgver}")
sha256sums=('db2cfd57cf6655af45b4a5280c561624e2758d61563980ccd76613a3da4fb726')

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
  go build -v -o "build/${pkgname}" -ldflags "\
    -X ${url#https://}/cmd/${pkgname}/cmd.AppVersion=${pkgver} \
    -X ${url#https://}/cmd/${pkgname}/cmd.AppBuildCommit=$(git rev-parse --short HEAD)" \
    ./"cmd/${pkgname}"

  for _sh in bash fish zsh powershell; do
    ./"build/${pkgname}" completion "${_sh}" > "completions/${pkgname}.${_sh}"
  done

  ./"build/${pkgname}" man "manpages"
}

# check() {
#   cd "${srcdir}/${_pkgsrc}"
#   go test ./...
# }

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -Dm755 "build/${pkgname}"   "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "README.md"          "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE"            "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "config.example.yml" "${pkgdir}/etc/${pkgname}.conf"

  install -d "${pkgdir}/usr/share/man/man1"
  find "manpages" -mindepth 1 -type f -exec install -Dm644 "{}" "${pkgdir}/usr/share/man/man1/" \;

  cd "${srcdir}/${_pkgsrc}/completions"
  install -Dm644 "${pkgname}.bash"       "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
  install -Dm644 "${pkgname}.fish"       "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}.fish"
  install -Dm644 "${pkgname}.zsh"        "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
  install -Dm644 "${pkgname}.powershell" "${pkgdir}/usr/share/powershell/Completions/${pkgname}.ps1"
}
