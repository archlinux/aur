# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="containerlab"
pkgver=0.65.0
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
b2sums=('37aeac9c838fcbe121b7a46ab07ef31195882faafa7a4dfeb3ee9eb86a29aeb629dab743556dcf5bc415a5c1a18722e2b1a7ee7304439a5d14d2f192fe0ac77b')

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
