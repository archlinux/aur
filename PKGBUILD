# Maintainer: David Runge <dvzrv@archlinux.org>

_name=jfrog
_upstream_name=jfrog-cli
pkgname=jfrog-cli-go
pkgver=1.39.3
pkgrel=1
pkgdesc="Simple interface to Artifactory, Bintray and Mission Control"
arch=('x86_64')
url="https://github.com/jfrog/jfrog-cli"
license=('Apache')
depends=('glibc')
makedepends=('git' 'go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jfrog/${_upstream_name}/archive/v${pkgver}.tar.gz")
sha512sums=('dd8adb48d9e92829b433a794946c337b7372cc96b5f951f85c59d00ca647f8cc7b53aa0f3a228e1b52b776d32a7a72afa42a76df72eced56452998d26e6890c8')
b2sums=('e25563d3fe6b5b62919e09e605404951dd781b4a77e1c063e37ebe53935cf5f6e61abffdffbe8c314d6c2bab81c5578254f6a194f56b801f7197323411504a81')

prepare() {
  mv -v "${_upstream_name}-${pkgver}" "${pkgname}-${pkgver}"
}

build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build
}

package() {
  cd "$pkgname-$pkgver"
  install -vDm 755 "${_upstream_name}" -t "${pkgdir}/usr/bin/"
  install -vDm 644 {README,RELEASE}.md \
    -t "${pkgdir}/usr/share/doc/${pkgname}"
}
