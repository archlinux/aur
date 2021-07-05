# Maintainer: Allen Wild <allenwild93@gmail.com>
# Contributor: Alireza Ayinmehr <alireza.darksun@gmail.com>
# Contributor: Abhishek Mukherjee <amukherjee@tripadvisor.com>
pkgname=docker-credential-secretservice
pkgver=0.6.4
pkgrel=1
pkgdesc="program to use secretservice to keep Docker credentials safe"
arch=(x86_64)
url="https://github.com/docker/docker-credential-helpers"
license=('MIT')
depends=('libsecret')
makedepends=('go')
source=("docker-credential-helpers-$pkgver.tar.gz::${url}/archive/v$pkgver.tar.gz")
sha512sums=('4e8c97c529e18e700aef77ba0ebfb1d432ca8f96bd0efddc0336e9fca5a5f8e98cb058dfaaee289dc4515dcf48d26d54df86120ce94648a8d87b291a14bae0d5')
install=$pkgname.install

build() {
  cd "$srcdir/docker-credential-helpers-${pkgver}"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"
  export GOFLAGS="-v -buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  export GOPATH="$srcdir"
  GOPATH="$srcdir" make secretservice
}

package() {
  cd "$srcdir/docker-credential-helpers-${pkgver}"
  install -D -m 0755 bin/docker-credential-secretservice "$pkgdir/usr/bin/docker-credential-secretservice"
  install -D -m 0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}


# vim:set ts=2 sw=2 et:
