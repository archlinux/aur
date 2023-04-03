pkgname=carapace-bin-git
pkgver=v0.23.0.r96.97097f2f
pkgrel=1
pkgdesc='multi-shell multi-command argument completer, git version'
arch=('x86_64')
url="https://github.com/rsteube/carapace-bin"
license=('MIT')
makedepends=('go' 'git')
source=("$pkgname::git+$url")
sha256sums=('SKIP')
_executable='carapace'
provides=("$_executable")
conflicts=('carapace-bin')

prepare(){
  cd "$pkgname"
  mkdir -p build/
}

pkgver() {
	cd "$srcdir/${pkgname%-VCS}"
	printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
  cd "$pkgname"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  cd cmd/carapace
  go generate ./...
  go build -o ../../build -tags release
}

package() {
  cd "$pkgname"
  pwd
  install -Dm755 build/$_executable "$pkgdir"/usr/bin/$_executable
  install -Dm755 LICENSE "$pkgdir"/usr/share/licenses/$pkgname
}
