# Maintainer: David Runge <dave@sleepmap.de>

pkgname=jfrog-cli-go
_name=jfrog
pkgver=1.26.0
pkgrel=1
pkgdesc="Simple interface to Artifactory, Bintray and Mission Control"
arch=('x86_64')
url="https://github.com/jfrog/jfrog-cli-go"
license=('Apache')
depends=('glibc')
makedepends=('git' 'go-pie')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jfrog/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('c09a9c1723443c0e7ef67f46e00ca97e3467b9550615fd078ea65eb2444d8e53326aa5a269a3b5bbfd15551951d8d6d13b0ad806707436aa0b920b8207611cd8')

prepare() {
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
