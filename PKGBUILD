# Maintainer: David Runge <dvzrv@archlinux.org>

_name=jfrog
_upstream_name=jfrog-cli
pkgname=jfrog-cli-go
pkgver=1.33.2
pkgrel=1
pkgdesc="Simple interface to Artifactory, Bintray and Mission Control"
arch=('x86_64')
url="https://github.com/jfrog/jfrog-cli-go"
license=('Apache')
depends=('glibc')
makedepends=('git' 'go-pie')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jfrog/${_upstream_name}/archive/${pkgver}.tar.gz")
sha512sums=('60619b6936a2960555d310ce039020ed528a8520183df2d768020c47bad24ab269bb017af616629bbb160c61db7b87759faea727666b555029106b2398c2f107')

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
