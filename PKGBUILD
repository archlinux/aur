pkgname=hut
pkgver=r161.f6e3d65
pkgrel=1
pkgdesc='A CLI tool for sr.ht'
arch=('aarch64' 'arm' 'armv6h' 'armv7h' 'i686' 'x86_64')
url="https://git.sr.ht/~emersion/hut"
license=('AGPLv3')
makedepends=('go' 'git')
source=("git+https://git.sr.ht/~emersion/hut")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare(){
  cd "$pkgname"
  mkdir -p build/
}

build() {
  cd "$pkgname"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  make all
}

check() {
  cd "$pkgname"
  go test ./...
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir/" PREFIX=/usr/ install
}
