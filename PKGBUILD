# Maintainer: Allen Wild <allenwild93@gmail.com>
# Contributor: Alireza Ayinmehr <alireza.darksun@gmail.com>
# Contributor: Abhishek Mukherjee <amukherjee@tripadvisor.com>
pkgname=docker-credential-secretservice
pkgver=0.7.0
pkgrel=1
pkgdesc="program to use secretservice to keep Docker credentials safe"
arch=(x86_64 i686 aarch64)
url="https://github.com/docker/docker-credential-helpers"
license=('MIT')
depends=('libsecret')
makedepends=('go')
source=("docker-credential-helpers-$pkgver.tar.gz::${url}/archive/v$pkgver.tar.gz")
b2sums=('3719d8b84fa886e1220db22a5717a43757275cbeba5575879347b782543d2c0eeac915a28bcb3552d02161bee4d34e39fe44d1959c7a0f908289f33da7173dce')
install=$pkgname.install

build() {
  cd "$srcdir/docker-credential-helpers-${pkgver}"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"
  export GOFLAGS="-v -buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  export GOPATH="$srcdir"
  # Makefile sets VERSION and REVISION using git commands which don't work when building from
  # a tarball, override to use pkgver instead
  GOPATH="$srcdir" make secretservice VERSION="$pkgver" REVISION=""
}

package() {
  cd "$srcdir/docker-credential-helpers-${pkgver}"
  install -D -m 0755 bin/build/docker-credential-secretservice "$pkgdir/usr/bin/docker-credential-secretservice"
  install -D -m 0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}


# vim:set ts=2 sw=2 et:
