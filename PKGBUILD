pkgname=fast-git
pkgver=0.0.0
pkgrel=1
pkgdesc='Internet speed test in your terminal'
arch=('x86_64')
url='https://github.com/maaslalani/fast'
license=('MIT')
depends=('ca-certificates')
makedepends=('git' 'go')
provides=('fast')
conflicts=('fast')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd fast
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd fast
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go build -o fast .
}

package() {
  cd fast
  install -Dm755 fast "$pkgdir/usr/bin/fast"
  install -Dm644 README.md "$pkgdir/usr/share/doc/fast/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
