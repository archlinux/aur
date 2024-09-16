# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="updatecli"
pkgname="${_pkgname}-git"
pkgver=0.84.0.r18.g8cafa82
pkgrel=1
pkgdesc="A declarative dependency management command line tool"
arch=('x86_64')
url="https://www.updatecli.io"
_url="https://github.com/${_pkgname}/${_pkgname}"
license=('Apache-2.0')
makedepends=('git' 'go')
# checkdepends=('docker')
depends=('glibc')
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
  mkdir -p "build" "completions" "manpages"
}

build() {
  cd "${srcdir}/${_pkgsrc}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o "build/${_pkgname}" -ldflags "\
    -X ${_url#https://}/pkg/core/version.BuildTime=$(date -u +"%Y-%m-%dT%H:%M:%SZ") \
    -X ${_url#https://}/pkg/core/version.GoVersion=$(go version | awk '{print $3}') \
    -X ${_url#https://}/pkg/core/version.Version=${pkgver}" \
    .

  ./"scripts/manpages.sh"
  ./"scripts/completions.sh"
}

check() {
  cd "${srcdir}/${_pkgsrc}"
  # make test
  make test-short
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -Dm755 "build/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README.adoc" "${pkgdir}/usr/share/doc/${_pkgname}/README.adoc"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -Dm644 "manpages/${_pkgname}.1.gz" "${pkgdir}/usr/share/man/man1/${_pkgname}.1.gz"

  cd "completions"
  install -Dm644 "${_pkgname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
  install -Dm644 "${_pkgname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${_pkgname}.fish"
  install -Dm644 "${_pkgname}.zsh"  "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
}
