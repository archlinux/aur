# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="ipsw"
pkgver=3.1.554
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
b2sums=('fc4ee4b6bbb389517e229b53e5786cbd7aec267053df17cd569b8d5e96ee97ab9079968fa1a77b917b4042cc13277ef96eee6cabe84f8bda72108a4a9bc4a9b8')
# validpgpkeys=('9F1581FE95BD6E63C45205DD5A95D762E23EC861') # blacktop <blacktop@users.noreply.github.com> (https://github.com/blacktop.gpg)

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
