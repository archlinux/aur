# Maintainer: David Runge <dvzrv@archlinux.org>

_name=jfrog
_upstream_name=jfrog-cli
pkgname=jfrog-cli-go
pkgver=1.38.4
pkgrel=1
pkgdesc="Simple interface to Artifactory, Bintray and Mission Control"
arch=('x86_64')
url="https://github.com/jfrog/jfrog-cli-go"
license=('Apache')
depends=('glibc')
makedepends=('git' 'go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jfrog/${_upstream_name}/archive/v${pkgver}.tar.gz")
sha512sums=('a67a7a97772e196a42e698822059e58f6b9fcf80ea6aac86dcd49839be2b5ae989d7c96d70b7205f9726e3bac6ad8bfae4336604e75b8aad7927a30027422c81')
b2sums=('2113ffc5db2bafe67d9043a6e48ec284e4376decc2f8d618f2c3ea3dd53d993fbec4598e6f25e473f990f4769a8166405e06fe0aba9edb893b605d6dbcfb3224')

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
