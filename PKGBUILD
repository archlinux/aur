# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="updatecli"
pkgver=0.94.0
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
b2sums=('e75ec9348dd222b172dc336a9972443d2dd3c307bbac0136722308f4fc7ff4ad3dad4c548e9a5940c6bd99131492372a48fde93071d005c8abb8608b03814674')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  mkdir -p "build" # "completions" "manpages"

  cd "scripts"
  sed -i 's/bash zsh fish/bash zsh fish powershell/g' 'completions.sh'
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

  ./"scripts/completions.sh"
  ./"scripts/manpages.sh"
}

# check() {
#   cd "${srcdir}/${_pkgsrc}"
#   # make test
#   make test-short
# }

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -vDm755 "build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -vDm644 "README.adoc" "${pkgdir}/usr/share/doc/${pkgname}/README.adoc"
  install -vDm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -vDm644 "manpages/${pkgname}.1.gz" "${pkgdir}/usr/share/man/man1/${pkgname}.1.gz"

  cd "completions"
  install -vDm644 "${pkgname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
  install -vDm644 "${pkgname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}.fish"
  install -vDm644 "${pkgname}.powershell" "${pkgdir}/usr/share/powershell/Completions/${pkgname}.ps1"
  install -vDm644 "${pkgname}.zsh" "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
}
