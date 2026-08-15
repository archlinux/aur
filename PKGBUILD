# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Bao Trinh <qubidt at gmail dot com>

pkgname="neonmodem"
pkgver=1.1.0
pkgrel=1
pkgdesc="A BBS-style command line client that supports Discourse, Lemmy, Lobsters and Hacker News as backends"
arch=(
  'aarch64'
  'armv6h'
  'armv7h'
  'i686'
  'x86_64'
)
url="https://neonmodem.com"
_url="https://github.com/mrusme/${pkgname}"
license=(
  'GPL-3.0-only'
)
depends=(
  'glibc'
)
makedepends=(
  'git'
  'go'
)
_pkgsrc="${_url##*/}"
source=(
  "${_pkgsrc}::git+${_url}.git#tag=v${pkgver}?signed"
)
sha256sums=('49b46d3f1c116b0926395fb3e760defba4c771a4d3bb245cdf0da260b2b137d0')
validpgpkeys=(
  '4D3899AF73E7F5FE9B39C822272ED814BF63261F' # marius@xn--gckvb8fzb.com <marius@xn--gckvb8fzb.com>
)

prepare() {
  export GOMODCACHE="${srcdir}/go-mod-cache"

  cd "${srcdir}/${_pkgsrc}"
  go mod download -modcacherw -x
  go mod verify

  mkdir -p "completions"
}

build() {
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOCACHE="${srcdir}/go-cache"
  export GOMODCACHE="${srcdir}/go-mod-cache"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  cd "${srcdir}/${_pkgsrc}"
    go build -v -o "build/${pkgname}" -ldflags "\
    -X ${_url#https://}/config.VERSION=${pkgver}" \
    .

  for _sh in bash fish powershell zsh; do
    ./"build/${pkgname}" completion "${_sh}" > "completions/${pkgname}.${_sh}"
  done
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

  cd "completions"
  install -vDm644 "${pkgname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
  install -vDm644 "${pkgname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}.fish"
  install -vDm644 "${pkgname}.powershell" "${pkgdir}/usr/share/powershell/Completions/${pkgname}.ps1"
  install -vDm644 "${pkgname}.zsh" "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
}
