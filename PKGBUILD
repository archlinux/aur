# Maintainer: Vinay <vinaymeldrum@gmail.com>
pkgname=go-send-git
pkgver=r1.0.0
pkgrel=1
pkgdesc="Secure file transfer tool with challenge-response authentication"
arch=('x86_64' 'aarch64')
url="https://github.com/VinMeld/go-send"
license=('GPL3')
depends=('glibc')
makedepends=('go' 'git')
provides=("go-send")
conflicts=("go-send")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "go-send"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "go-send"
  export CGO_ENABLED=0
  go build -trimpath -ldflags "-s -w" -o go-send-client cmd/client/main.go
  go build -trimpath -ldflags "-s -w" -o go-send-server cmd/server/main.go
}

package() {
  cd "go-send"
  install -Dm755 go-send-client "$pkgdir/usr/bin/go-send-client"
  install -Dm755 go-send-server "$pkgdir/usr/bin/go-send-server"
  
  # Install systemd service
  install -Dm644 packaging/systemd/go-send-server.service "$pkgdir/usr/lib/systemd/system/go-send-server.service"
  
  # Install license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
