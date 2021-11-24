# Maintainer: orhun <orhunparmaksiz@gmail.com>
# Contributor: Sefa Eyeoglu <contact@scrumplex.net>
# https://github.com/orhun/pkgbuilds

pkgname=stegify-git
pkgdesc="Tool for LSB steganography written in Go (git)"
pkgver=1.2.r2.g62518ca
pkgrel=3
arch=('x86_64')
url="https://github.com/DimitarPetrov/stegify"
license=('MIT')
makedepends=('git' 'go')
conflicts=("${pkgname%-git}")
source=("git+$url")
sha512sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname%-git}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go mod init github.com/DimitarPetrov/stegify
  go get github.com/DimitarPetrov/stegify/steg
  go build -o "${pkgname%-git}" .
}

package() {
  cd "${pkgname%-git}"
  install -Dm 755 "${pkgname%-git}" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
