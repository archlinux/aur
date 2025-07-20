# Maintainer: Justin Wagner <0xDezzy@gmail.com>

pkgname=keygen-cli-git
pkgver=r209.3fa3a56
pkgrel=1
pkgdesc="CLI to interact with keygen.sh"
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://github.com/keygen-sh/keygen-cli"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
provides=('keygen-cli')
conflicts=('keygen-cli')
source=("git+https://github.com/keygen-sh/keygen-cli.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/keygen-cli"
  # If there are no tags, use commit count and short hash
  if ! git describe --long --tags 2>/dev/null; then
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  else
    git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g;s/^v//'
  fi
}

build() {
  cd "$srcdir/keygen-cli"
  
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  
  go build -o keygen .
}

package() {
  cd "$srcdir/keygen-cli"
  
  install -Dm755 keygen "$pkgdir/usr/bin/keygen"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  
  # Install documentation if it exists
  if [ -f README.md ]; then
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  fi
}
