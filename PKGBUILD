# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="containerlab"
pkgver=0.67.0
pkgrel=1
pkgdesc="Container-based networking labs"
arch=('aarch64' 'x86_64')
url="https://containerlab.dev"
_url="https://github.com/srl-labs/${pkgname}"
license=('BSD-3-Clause')
depends=('glibc')
makedepends=('go')
_pkgsrc="${pkgname}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${_url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('86544a5a790398325518e75a15710977039b103bfbd26d35c3b14298beac835b817e47a80d48aecfbd8c992838da82e8f9358bbd540ea38164501b1b5490ece8')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  mkdir -p "build"
}

build() {
  cd "${srcdir}/${_pkgsrc}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o "build/${pkgname}" -ldflags "\
    -X ${_url#https://}/cmd.version=${pkgver}" \
    .
}

check() {
  cd "${srcdir}/${_pkgsrc}"
  go test ./...
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -vDm755 "build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  find "lab-examples" -type f ! -name '.gitignore' -exec \
    install -vDm644 "{}" "${pkgdir}/usr/share/doc/${pkgname}/{}" \;
}
