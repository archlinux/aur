# Maintainer: David Runge <dvzrv@archlinux.org>

_name=jfrog
_upstream_name=jfrog-cli
pkgname=jfrog-cli-go
pkgver=1.39.2
pkgrel=1
pkgdesc="Simple interface to Artifactory, Bintray and Mission Control"
arch=('x86_64')
url="https://github.com/jfrog/jfrog-cli"
license=('Apache')
depends=('glibc')
makedepends=('git' 'go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jfrog/${_upstream_name}/archive/v${pkgver}.tar.gz")
sha512sums=('fdce46e540af56453ce7350ec18a610de54b5411f83b93c2148be73090c8e417d540ba736ffbc45b57a069e6b1f6eccf7b3e945a84213f9b3505c0e94b460b71')
b2sums=('bf23da5461c266a909393d7960a08c618202034c2d8d0561d9d0d72551d783f9aae13dab8d9a58a277b2c61467647ecd0c9e45c619af06dee2ae4ce632c56ca2')

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
