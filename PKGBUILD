# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="traitor"
_commit_rel="7802ea75066d7a4c8eb975c572424aff66452cca" # 0.0.14
_commit="0d221ba0d0e6abf48e7ec602eac03ac45381f24e" # r4
pkgver="0.0.14+r4+g${_commit::7}"
pkgrel=1
pkgdesc="Automatic Linux privesc via exploitation of low-hanging fruit"
arch=('aarch64' 'i686' 'x86_64')
url="https://github.com/liamg/${pkgname}"
license=('MIT')
depends=('glibc')
makedepends=('go')
_pkgsrc="${pkgname}-${_commit}"
source=("${_pkgsrc}.tar.gz::${url}/archive/${_commit}.tar.gz")
b2sums=('8e07be949dcefc5203c807564a354b179e798b47d59094715668bd8206c62396e8f3efd71ff343d9c3d864339fa05a2035176c8fde48f90f6fdd2e1e6d9ebb27')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  mkdir -p "build"

  cd "internal/version"
  sed -i 's/var Version string = "v[^"]*"/'"var Version string = \"v${pkgver}\"/" 'version.go'
}

build() {
  cd "${srcdir}/${_pkgsrc}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -v -o "build/${pkgname}" -ldflags "\
    -X ${url#https://}/version.Version=${pkgver}" \
    ./"cmd/${pkgname}"
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -vDm755 "build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
