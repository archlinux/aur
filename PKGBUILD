# Maintainer: xa9e <xa9e@protonmail.com>
pkgname=uncover-git
pkgver=1.2.1.r2.g8275048
pkgrel=1
pkgdesc='Quickly discover exposed hosts on the internet using multiple search engines (git version)'
arch=('x86_64' 'aarch64' 'armv7h' 'i686')
url='https://github.com/projectdiscovery/uncover'
license=('MIT')
depends=('glibc')
makedepends=('git' 'go')
provides=("uncover=${pkgver}")
conflicts=('uncover')
source=('uncover::git+https://github.com/projectdiscovery/uncover.git')
b2sums=('SKIP')

pkgver() {
  cd uncover
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  export GOMODCACHE="${srcdir}/go-mod-cache"

  cd uncover
  go mod download -modcacherw
  go mod verify
}

build() {
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOCACHE="${srcdir}/go-cache"
  export GOMODCACHE="${srcdir}/go-mod-cache"
  export GOFLAGS='-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw'

  cd uncover
  go build -v -o build/uncover ./cmd/uncover
}

check() {
  export GOCACHE="${srcdir}/go-cache"
  export GOMODCACHE="${srcdir}/go-mod-cache"
  export GOFLAGS='-mod=readonly -modcacherw'

  cd uncover
  go test ./...
}

package() {
  cd uncover
  install -Dm755 build/uncover "${pkgdir}/usr/bin/uncover"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
