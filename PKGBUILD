# Maintainer: David Runge <dave@sleepmap.de>

pkgname=jfrog-cli-go
_name=jfrog
pkgver=1.25.0
pkgrel=1
pkgdesc="Simple interface to Artifactory, Bintray and Mission Control"
arch=('x86_64')
url="https://github.com/jfrog/jfrog-cli-go"
license=('Apache')
depends=('glibc')
makedepends=('git' 'go-pie')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jfrog/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('19a1ee1f2a834d108ab0ea36904ff5eea6c89233d9f1fd387e5a47a65db6ef3495e5168eaab6f0d7ed78acc79833428783f0e05f59952560a0cd244cf262498d')

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
           "jfrog-cli/${_name}/main.go"
}

package() {
  cd "$pkgname-$pkgver"
  # executable
  install -vDm 755 "${_name}" -t "${pkgdir}/usr/bin/"
  install -vDm 644 {CONTRIBUTING,README}.md \
    -t "${pkgdir}/usr/share/doc/${pkgname}"
}
