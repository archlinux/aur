# Maintainer: tarik02 <taras[dot]fomin[at]gmail[dot]com>

pkgname=ssh-ggh-git
pkgver=0.1.4.r0.g83fc75e
pkgrel=1
pkgdesc="Recall your SSH sessions (also search your SSH config file)"
arch=('x86_64' 'aarch64')
url="https://github.com/byawitz/ggh"
license=('Apache-2.0')

provides=("${pkgname%-git}=${pkgver}")
conflicts=("${pkgname%-git}" "${pkgname%-git}-bin")
depends=(glibc openssh)
makedepends=(git go)

source=("git+${url}.git")
sha256sums=('SKIP')

prepare() {
  cd "$srcdir/ggh"
  go mod download
}

pkgver() {
  cd "$srcdir/ggh"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
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
