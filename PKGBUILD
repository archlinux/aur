# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="ipsw"
pkgname="${_pkgname}-git"
pkgver=3.1.528.r0.g455d715
pkgrel=1
pkgdesc="iOS/macOS Research Swiss Army Knife"
arch=('any')
url="https://github.com/blacktop/${_pkgname}"
license=('MIT')
makedepends=('git' 'go')
depends=('glibc')
optdepends=('bash-completion: for shell auto-completion'
            'zsh-completions: for shell auto-completion')
provides=("${_pkgname}=${pkgver%%.r*}")
conflicts=("${_pkgname}")
backup=("etc/${_pkgname}.conf")
_pkgsrc="${_pkgname}"
source=("${_pkgsrc}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgsrc}"
  git describe --long --tags --abbrev=7 | sed 's/v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  mkdir -p "build" "completions" "manpages"
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
  go build -v -o "build/${_pkgname}" -ldflags "\
    -X ${url#https://}/cmd/${_pkgname}/cmd.AppVersion=${pkgver} \
    -X ${url#https://}/cmd/${_pkgname}/cmd.AppBuildCommit=$(git rev-parse --short HEAD)" \
    ./"cmd/${_pkgname}"

  for _sh in bash fish zsh powershell; do
    ./"build/${_pkgname}" completion "${_sh}" > "completions/${_pkgname}.${_sh}"
  done

  ./"build/${_pkgname}" man "manpages"
}

# check() {
#   cd "${srcdir}/${_pkgsrc}"
#   go test ./...
# }

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -Dm755 "build/${_pkgname}"  "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README.md"          "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE"            "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -Dm644 "config.example.yml" "${pkgdir}/etc/${_pkgname}.conf"

  cd "${srcdir}/${_pkgsrc}/completions"
  install -Dm644 "${_pkgname}.bash"       "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
  install -Dm644 "${_pkgname}.fish"       "${pkgdir}/usr/share/fish/vendor_completions.d/${_pkgname}.fish"
  install -Dm644 "${_pkgname}.zsh"        "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
  install -Dm644 "${_pkgname}.powershell" "${pkgdir}/usr/share/powershell/Completions/${_pkgname}.ps1"

  cd "${srcdir}/${_pkgsrc}/manpages"
  install -d "${pkgdir}/usr/share/man/man1"
  for _manpage in *.1; do
    install -Dm644 "${_manpage}" "${pkgdir}/usr/share/man/man1/"
  done
}
