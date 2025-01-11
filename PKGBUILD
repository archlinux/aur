# Maintainer: tarik02 <taras[dot]fomin[at]gmail[dot]com>

pkgname=ssh-ggh
pkgver=0.1.4
pkgrel=1
pkgdesc="Recall your SSH sessions (also search your SSH config file)"
arch=('x86_64' 'aarch64')
url="https://github.com/byawitz/ggh"
license=('Apache-2.0')

conflicts=("${pkgname}-bin" "${pkgname}-git")
depends=(glibc openssh)
makedepends=(go)

source=("ggh-v${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('4692a306792444950f45472a01dcef478a5780203d7aaf1b7b959065a190fe64')

prepare() {
  mv "$srcdir/ggh-${pkgver}" "$srcdir/ggh"

  cd "$srcdir/ggh"
  go mod download
}

build() {
  cd "$srcdir/ggh"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOPATH="${srcdir}"
  export GOFLAGS="-buildmode=pie -mod=readonly -modcacherw"

  go build -ldflags "-compressdwarf=false -linkmode external" .
}

package() {
  cd "$srcdir/ggh"
  install -Dm755 "ggh" "${pkgdir}/usr/bin/ggh"
}
