# Maintainer: flatiron <warrenm83 at hotmail dot com>
pkgname=nanolathe-git
pkgver=r923.ad15dec
pkgrel=1
pkgdesc='Open-source 2.5D RTS engine in Go; clean-room Total Annihilation reimplementation (requires original game data)'
arch=('x86_64' 'aarch64')
url='https://nanolathe.gg/'
license=('MIT')
depends=('glibc' 'libglvnd' 'libx11' 'libxcursor' 'libxi' 'libxinerama' 'libxrandr' 'alsa-lib')
makedepends=('git' 'go>=2:1.27.1')
provides=('nanolathe')
conflicts=('nanolathe')
options=('!lto')
source=('git+https://github.com/nanolathe-gg/nanolathe.git'
        'nanolathe.desktop')
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd nanolathe
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd nanolathe
  export GOPATH="$srcdir/gopath" GOFLAGS='-modcacherw'
  go mod download
}

build() {
  cd nanolathe
  export GOPATH="$srcdir/gopath"
  export CGO_ENABLED=0 GOTOOLCHAIN=local
  export GOFLAGS='-buildmode=pie -trimpath -mod=readonly -modcacherw'
  go build -ldflags "-linkmode=internal -extldflags \"$LDFLAGS\"" -o nanolathe ./cmd/nanolathe
}

check() {
  cd nanolathe
  export GOPATH="$srcdir/gopath" CGO_ENABLED=0 GOTOOLCHAIN=local GOFLAGS='-mod=readonly -modcacherw'
  go test $(go list ./... | grep -vE '/(cmd/nanolathe|internal/client)$')
}

package() {
  cd nanolathe
  install -Dm755 nanolathe -t "$pkgdir/usr/bin"
  install -Dm644 LICENSE NOTICE.md -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 "$srcdir/nanolathe.desktop" -t "$pkgdir/usr/share/applications"
}
