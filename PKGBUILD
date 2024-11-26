# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="updatecli"
pkgver=0.88.0
pkgrel=1
pkgdesc="A declarative dependency management command line tool"
arch=('x86_64' 'aarch64')
url="https://www.updatecli.io"
_url="https://github.com/${pkgname}/${pkgname}"
license=('Apache-2.0')
depends=('glibc')
makedepends=('go')
# checkdepends=('docker')
_pkgsrc="${pkgname}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${_url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('64db19f5111c234a80f92438347493cbeedffab467077b8012979a4187d185e2d45d7b756e995b344c0f7cce2fe6e5526cee3ef99b54dddc5b5c73b2019f39e6')

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
  install -vDm755 "build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -vDm644 "README.adoc" "${pkgdir}/usr/share/doc/${pkgname}/README.adoc"
  install -vDm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -vDm644 "manpages/${pkgname}.1.gz" "${pkgdir}/usr/share/man/man1/${pkgname}.1.gz"

  cd "completions"
  install -vDm644 "${pkgname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
  install -vDm644 "${pkgname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}.fish"
  install -vDm644 "${pkgname}.zsh"  "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
}
