pkgname=clocko-git
pkgver=r19.ca4d98d 
pkgrel=1
pkgdesc="A clock tool written in Go"
arch=('x86_64' 'aarch64')
url="https://codeberg.org/b1u3rchie/Clocko"
license=('BSD-2-Clause')
depends=('glibc')
makedepends=('go' 'git')
source=("clocko::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/clocko"
  if git describe --long --tags >/dev/null 2>&1; then
    git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g'
  elif git rev-list --count HEAD >/dev/null 2>&1; then
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  else
    date +%Y.%m.%d
  fi
}

prepare() {
  cd "$srcdir/clocko"
  go mod download
}

build() {
  cd "$srcdir/clocko"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  go build -v -o clocko .
}

package() {
  cd "$srcdir/clocko"
  
  install -Dm755 clocko "$pkgdir"/usr/bin/clocko
  
  if [ -f LICENSE ]; then
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
  fi
  
  if [ -f README.md ]; then
    install -Dm644 README.md "$pkgdir"/usr/share/doc/"$pkgname"/README.md
  fi
}
