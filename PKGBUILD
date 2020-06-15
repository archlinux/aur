# Maintainer: David Runge <dvzrv@archlinux.org>

_name=jfrog
_upstream_name=jfrog-cli
pkgname=jfrog-cli-go
pkgver=1.37.1
pkgrel=1
pkgdesc="Simple interface to Artifactory, Bintray and Mission Control"
arch=('x86_64')
url="https://github.com/jfrog/jfrog-cli-go"
license=('Apache')
depends=('glibc')
makedepends=('git' 'go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jfrog/${_upstream_name}/archive/${pkgver}.tar.gz")
sha512sums=('747c76a285c882aab1ae062bba1fcab82e1fd8546cdd71d31b2e5ff2e4376d049158bd51f1a8cd0eb0cdc44d5b92b688e5a4bb6c4653bef7f123173d59490bdf')

prepare() {
  mv -v "${_upstream_name}-${pkgver}" "${pkgname}-${pkgver}"
}

build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go build

}

package() {
  cd "$pkgname-$pkgver"
  install -vDm 755 "${_upstream_name}" -t "${pkgdir}/usr/bin/"
  install -vDm 644 {README,RELEASE}.md \
    -t "${pkgdir}/usr/share/doc/${pkgname}"
}
