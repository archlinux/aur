# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: matthias.lisin

pkgname="mockery"
pkgver=3.6.1
pkgrel=1
pkgdesc="A mock code autogenerator for Go"
arch=(
  'aarch64'
  'x86_64'
 )
url="https://vektra.github.io/mockery"
_url="https://github.com/vektra/${pkgname}"
license=(
  'BSD-3-Clause'
)
depends=(
  'glibc'
)
makedepends=(
  'go'
)
provides=(
  'golang-mockery'
)
conflicts=(
  'golang-mockery'
)
replaces=(
  'golang-mockery'
)
_pkgsrc="${_url##*/}-${pkgver}"
source=(
  "${_pkgsrc}.tar.gz::${_url}/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=('7a6f1a99626cd4471353d6726e48980911763dfce67a04131235ca586e75b579')

prepare() {
  export GOMODCACHE="${srcdir}/go-mod-cache"

  cd "${srcdir}/${_pkgsrc}"
  go get -modcacherw -v ./...

  mkdir -p "build" "completions"
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
    -X ${_url#https://}/v2/pkg/logging.SemVer=${pkgver}" \
    .

  # --config='/dev/null' to avoid reading .mockery.yaml
  for _sh in bash fish powershell zsh; do
    ./"build/${pkgname}" --config='/dev/null' completion "${_sh}" > "completions/${pkgname}.${_sh}"
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
