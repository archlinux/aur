# Maintainer: Josephine Pfeiffer <hi@josie.lol>
pkgname=getmesh
pkgver=1.1.5
pkgrel=1
pkgdesc="Integration, and lifecycle management CLI tool that ensures the use of supported and trusted versions of Istio"
arch=(x86_64)
url="https://github.com/tetratelabs/getmesh"
license=('Apache-2.0')
groups=()
depends=()
makedepends=('git' 'sed' 'go')
optdepends=()
provides=("$pkgname")
conflicts=("$pkgname")
backup=("etc/$pkgname/$pkgname.conf")
_commit="331f0ec3eb58e0e9f96ce68995e9d19c2cecb11f" # v1.1.5
source=("$pkgname::git+$url#commit=$_commit")
md5sums=('SKIP')
replaces=()
options=()
noextract=()

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --tags | sed 's|^v||; s|-|.|g'
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
  go build -o build .
}

check() {
  cd "$pkgname"
# todo: upstream e2e test failing
# go test ./...
}

package() {
  cd "$pkgname"
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
