# Maintainer: David Runge <dvzrv@archlinux.org>

_name=jfrog
_upstream_name=jfrog-cli
pkgname=jfrog-cli-go
pkgver=1.30.3
pkgrel=1
pkgdesc="Simple interface to Artifactory, Bintray and Mission Control"
arch=('x86_64')
url="https://github.com/jfrog/jfrog-cli-go"
license=('Apache')
depends=('glibc')
makedepends=('git' 'go-pie')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jfrog/${_upstream_name}/archive/${pkgver}.tar.gz")
sha512sums=('b6df68a50d8f5a2943373abc14c3db0067f38b3430b8355948015ef2a34f016f14343589a4a45a1ad11ed8d270be45d2223baee4f66a649a9158b2978bae2a66')

prepare() {
  mv -v "${_upstream_name}-${pkgver}" "${pkgname}-${pkgver}"
  (
    cd "$pkgname-$pkgver/"
    go mod vendor
    # adding random resources: https://github.com/jfrog/jfrog-cli/issues/445
    go run ./python/addresources.go
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
