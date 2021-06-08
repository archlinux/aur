# Maintainer: Fernandez Ludovic <lfernandez dot dev at gmail dot com>

pkgname='lego'
pkgver=v4.4.0
pkgrel=1
pkgdesc='Lets Encrypt client and ACME library written in Go'
url='https://go-acme.github.io/lego/'
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
license=('MIT')
provides=("${pkgname}")
conflicts=("${pkgname}-git" "${pkgname}-bin")

depends=()
# makedepends=('git')
makedepends=('git' 'go>=1.14')

_url='https://github.com/go-acme/lego'

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

  # the make command doesn't work because the command use git to build the version.
  # make build

  go build -v -trimpath -ldflags "-X \"main.version=${pkgver}-src\"" -o "dist/${pkgname}" "./cmd/${pkgname}/"

  go clean -modcache
}

package() {
	# Bin
	rm -f "${pkgdir}/usr/bin/${pkgname}"
	install -Dm755 "${srcdir}/${pkgname}-${pkgver#v}/dist/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

	# License
	install -Dm644 "${srcdir}/${pkgname}-${pkgver#v}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
