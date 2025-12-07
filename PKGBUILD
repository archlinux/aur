# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="ipsw"
pkgver=3.1.643
pkgrel=1
pkgdesc="iOS/macOS Research Swiss Army Knife"
arch=('x86_64')
url="https://github.com/blacktop/${pkgname}"
license=('MIT')
depends=('glibc')
makedepends=('git' 'go')
backup=("etc/${pkgname}.conf")
_pkgsrc="${pkgname}-${pkgver}"
source=("${_pkgsrc}::git+${url}.git#tag=v${pkgver}") # ?signed
b2sums=('SKIP')

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
  install -vDm755 "build/${pkgname}"   "${pkgdir}/usr/bin/${pkgname}"
  install -vDm644 "README.md"          "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE"            "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -vDm644 "config.example.yml" "${pkgdir}/etc/${pkgname}.conf"

  install -d "${pkgdir}/usr/share/man/man1"
  find "manpages" -mindepth 1 -type f -exec install -vDm644 "{}" "${pkgdir}/usr/share/man/man1/" \;

  cd "${srcdir}/${_pkgsrc}/completions"
  install -vDm644 "${pkgname}.bash"       "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
  install -vDm644 "${pkgname}.fish"       "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}.fish"
  install -vDm644 "${pkgname}.zsh"        "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
  install -vDm644 "${pkgname}.powershell" "${pkgdir}/usr/share/powershell/Completions/${pkgname}.ps1"
}
