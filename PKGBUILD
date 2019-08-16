# Maintainer: David Runge <dave@sleepmap.de>

_name=jfrog
_upstream_name=jfrog-cli
pkgname=jfrog-cli-go
pkgver=1.27.0
pkgrel=1
pkgdesc="Simple interface to Artifactory, Bintray and Mission Control"
arch=('x86_64')
url="https://github.com/jfrog/jfrog-cli-go"
license=('Apache')
depends=('glibc')
makedepends=('git' 'go-pie')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jfrog/${_upstream_name}/archive/${pkgver}.tar.gz")
sha512sums=('3465421e05e3fbce5857b17105f9be48aaf3c718bc15d4c07602040346a647a179f9b876f7429b73c11b9b37722aa08538c1d3c142b72b8bdf30263768e641fc')

prepare() {
  mv -v "${_upstream_name}-${pkgver}" "${pkgname}-${pkgver}"
  (
  cd "$pkgname-$pkgver/"
  go mod vendor
  rm -v go.mod
  )
  export GOPATH="${srcdir}"
  mkdir -vp src
  mv -v "${pkgname}-${pkgver}"/vendor/* src/
  mkdir -vp src/github.com/jfrog
  ln -rTsf "${pkgname}-${pkgver}" src/github.com/jfrog/jfrog-cli-go
}

build() {
  cd "$pkgname-$pkgver"
  export GOPATH="${srcdir}"
  go build -o "${_name}" \
           -ldflags="-linkmode external -extldflags ${LDFLAGS} -s -w" \
           "main.go"
}

package() {
  cd "$pkgname-$pkgver"
  # executable
  install -vDm 755 "${_name}" -t "${pkgdir}/usr/bin/"
  install -vDm 644 {CONTRIBUTING,README}.md \
    -t "${pkgdir}/usr/share/doc/${pkgname}"
}
