# Maintainer: Rainu <jetbrains-project-opener@raysha.de>
pkgname=jetbrains-project-opener
pkgver=1.1.1
pkgrel=1
pkgdesc="List all your JetBrains Projects and open the selected one"
arch=('x86_64' 'i686')
url="https://github.com/rainu/jb-project-opener"
source=("git+$url.git#tag=v$pkgver")
sha256sums=("SKIP")
license=('MIT')
makedepends=('git' 'go>=1.17')
depends=('jq' 'rofi' 'jetbrains-toolbox')

prepare(){
  cd "$srcdir/jb-project-opener"
  mkdir -p build/
}

build() {
  GIT_REV=$(cd "$srcdir/jb-project-opener"; git rev-parse --short HEAD)
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  cd "$srcdir/jb-project-opener"
  go build -o build/jetbrains-project-list -ldflags="-X main.ApplicationVersion=v$pkgver -X main.ApplicationCodeRev=$GIT_REV" ./
}

package() {
  cd "$srcdir/jb-project-opener"
  install -Dm755 build/jetbrains-project-list "$pkgdir"/usr/bin/jetbrains-project-list
  install -Dm755 jetbrains-project-opener "$pkgdir"/usr/bin/jetbrains-project-opener
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}