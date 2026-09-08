# Maintainer: Paul Farrow <paulfarrow@github>
pkgname=todoey-git
pkgver=r1.7b95ccc
pkgrel=1
pkgdesc="A terminal-based Todoist client built with Go and Bubble Tea"
arch=('x86_64' 'aarch64')
url="https://github.com/paulfarrow/todoey"
license=('GPL-3.0-or-later')
makedepends=('go' 'git')
provides=('todoey')
conflicts=('todoey')
source=("${pkgname}::git+https://github.com/paulfarrow/todoey.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$pkgname"
  export CGO_ENABLED=0
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  export GOPATH="$srcdir/gopath"
  go build -ldflags "-s -w" -o todoey .
}

package() {
  cd "$pkgname"
  install -Dm755 todoey "$pkgdir/usr/bin/todoey"
  install -Dm644 README.md "$pkgdir/usr/share/doc/todoey/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/todoey/LICENSE"
}
