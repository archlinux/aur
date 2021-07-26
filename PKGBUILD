# Maintainer: Nogweii <me@nogweii.net>
pkgname=zk
pkgver=0.6.0
pkgrel=1
pkgdesc='A command-line tool helping you to maintain a Zettelkasten or personal wiki.'
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/mickael-menu/${pkgname}"
license=('GPL3')
depends=('icu')
makedepends=('go' 'git')
source=("${pkgname}::git+${url}#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"

  VERSION=`git describe --tags --match v[0-9]* 2> /dev/null`
  BUILD=`git rev-parse --short HEAD`

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  CGO_ENABLED=1 go build -tags "fts5 icu" -ldflags "-X=main.Version=$VERSION -X=main.Build=$BUILD"
}

check() {
  cd "$srcdir/$pkgname"
  ./zk --version
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
  mkdir -p "$pkgdir"/usr/share/docs/$pkgname
  cp -r "docs" "$pkgdir"/usr/share/docs/$pkgname
}
