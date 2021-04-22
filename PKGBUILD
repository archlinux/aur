# Maintainer: Fernandez Ludovic <lfernandez dot dev at gmail dot com>

pkgname='goreleaser'
pkgver=v0.164.0
pkgrel=1
pkgdesc='Deliver Go binaries as fast and easily as possible'
url='https://goreleaser.com'
arch=('x86_64' 'i686' 'aarch64')
license=('MIT')
provides=("${pkgname}")
conflicts=("${pkgname}-bin")

depends=()
# makedepends=('git')
makedepends=('git' 'go>=1.14')
optdepends=('nfpm: deb and rpm packager'
	'snapcraft: snap packager')

_url="https://github.com/${pkgname}/${pkgname}"

source=("${pkgname}-${pkgver}.tar.gz::${_url}/archive/${pkgver}.tar.gz")
sha256sums=('SKIP')

prepare() {
  # setup env variables & dirs
  mkdir -p "${srcdir}/go"
  export GOPATH="${srcdir}/go"
  export GO111MODULE=on

  cd "${srcdir}/${pkgname}-${pkgver#v}"
  
  # download dependencies
  go mod download
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver#v}"

  go build -v \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-s -w -extldflags \"${LDFLAGS}\" -X \"main.version=${pkgver}-src\" -X \"main.builtBy=aur\" -X  \"main.date=$(date)\"" -o "dist/${pkgname}" .

  go clean -modcache
}

package() {
  # Bin
  rm -f "${pkgdir}/usr/bin/${pkgname}"
  install -Dm755 "${srcdir}/${pkgname}-${pkgver#v}/dist/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

  # License
  install -Dm644 "${srcdir}/${pkgname}-${pkgver#v}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
