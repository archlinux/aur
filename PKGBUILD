# Maintainer : atriix <aur a snilius d com>

pkgname=certstrap-git
_pkgname="certstrap"

pkgver=v1.2.0.r36.g14dbcb0
pkgrel=1

pkgdesc="Tools to bootstrap CAs, certificate requests, and signed certificates."
arch=('x86_64')
url="https://github.com/square/certstrap"
license=('Apache')

depends=('go>=1.13')
makedepends=('git')

options=('!emptydirs')

source=("git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/$_pkgname"
  go mod vendor -v
}

build() {
  cd "$srcdir/$_pkgname"
  go build -mod=vendor -v -ldflags "-X main.release=$pkgver"
  BUILD_TAG=$pkgver go test -v ./...
}

package() {
  install -Dm755 "$srcdir/$_pkgname/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}

# vim: ts=2 sw=2 et ft=PKGBUILD:
