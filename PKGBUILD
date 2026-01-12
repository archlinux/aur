# Maintainer: AzPepoze <https://github.com/AzPepoze>
pkgname=gdrive-bisync-git
pkgver=r1.0000000
pkgrel=1
pkgdesc="Bidirectional synchronization with Google Drive"
arch=('x86_64' 'aarch64')
url="https://github.com/AzPepoze/gdrive-bisync"
license=('MIT')
depends=('glibc')
makedepends=('git' 'go')
provides=("gdrive-bisync")
conflicts=("gdrive-bisync")
install="gdrive-bisync-git.install"
source=("${pkgname%-git}::git+https://github.com/AzPepoze/gdrive-bisync.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  echo "==> Compiling gdrive-bisync..."
  cd "$srcdir/${pkgname%-git}"
  export GOPATH="$srcdir/go-path"
  export GOCACHE="$srcdir/go-build"
  export CGO_ENABLED=0
  
  case "$CARCH" in
    x86_64)
      export GOARCH=amd64
      ;;
    aarch64)
      export GOARCH=arm64
      ;;
  esac
  
  export GOOS=linux
  go build -trimpath -ldflags="-s -w" -o "gdrive-bisync" cmd/gdrive-bisync/main.go
}

package() {
  echo "==> Installing files to package directory..."
  cd "$srcdir/${pkgname%-git}"
  
  install -Dm755 "gdrive-bisync" "$pkgdir/usr/bin/gdrive-bisync"
  install -Dm644 "config/config.example.json" "$pkgdir/usr/share/gdrive-bisync/config/config.example.json"
}
