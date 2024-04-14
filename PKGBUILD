# Maintainer: RiverOnVenus <error@zhui.dev>
# Contributor: Sebastian Meßlinger <sebastian.messlinger@posteo.de>
pkgname=dnslookup-git
pkgver=1.10.0.r1.gbbd6081
pkgrel=1
epoch=1
pkgdesc="Simple command line utility to make DNS lookups to the specified server"
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'mips' 'mips64')
url="https://github.com/ameshkov/dnslookup"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
provides=('dnslookup')
conflicts=('dnslookup')
source=("$pkgname"::"git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
  cd "$pkgname"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o dnslookup main.go
}

package() {
  install -Dm755 "$srcdir/$pkgname/dnslookup" "$pkgdir/usr/bin/dnslookup"
  install -Dm644 "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
