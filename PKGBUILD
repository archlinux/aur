# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Bram Swenson <bram@amplified.work>

pkgname=concourse
pkgver=5.5.11
pkgrel=1
pkgdesc="Concourse is a container-based continuous thing-doer written in Go and Elm"
arch=('x86_64')
url='https://concourse-ci.org'
license=('Apache-2.0')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/concourse/concourse/archive/v${pkgver}.tar.gz")
makedepends=('go-pie')
sha256sums=('a04f945719d7b51054d48f35558b3f14e466d8fbe39971987ed8701a35994ea2')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p $srcdir/go
  export GOPATH="${srcdir}"/go
  export PATH=$PATH:$GOPATH/bin
  go get -d -v ./...
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}/cmd/concourse"
  export GOPATH="${srcdir}"/go
  export PATH=$PATH:$GOPATH/bin
  go build -v -o "${srcdir}/${pkgname}-bin"
}

package() {
  install -Dm755 "${pkgname}-bin" "${pkgdir}/usr/bin/concourse"
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s /usr/share/licenses/common/Apache/license.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  go clean -modcache #Remove cached go libraries
}