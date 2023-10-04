_pkgname=duplicacy
pkgname=$_pkgname-git
pkgver=v3.2.2.r0.5012014
pkgrel=1
pkgdesc="A new generation cloud backup tool based on lock-free deduplication"
arch=('x86_64' 'i686')
url="https://duplicacy.com/"
license=('custom')
depends=('glibc')
makedepends=('go' 'git')
source=("git+https://github.com/gilbertchen/duplicacy")
sha256sums=('SKIP')
provides=("$_pkgname")
conflicts=("$_pkgname")

pkgver () {
  cd "$srcdir/$_pkgname"
  printf "%s" "$(git describe --tags --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
  cd "$_pkgname/$_pkgname"

  mkdir -p "src/github.com/gilbertchen"
  ln -nsf "$srcdir/$_pkgname" "src/github.com/gilbertchen/$_pkgname"

  GO111MODULE=auto GOPATH="$srcdir/$_pkgname/$_pkgname" go get -d -v
}

build() {
  cd "$_pkgname/$_pkgname"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  GO111MODULE=auto GOPATH="$srcdir/$_pkgname/$_pkgname" go build -x -ldflags="-X main.GitCommit=$pkgver"
}

check() {
  cd "$_pkgname/$_pkgname"

  GO111MODULE=auto GOPATH="$srcdir/$_pkgname/$_pkgname" go test -v -x
}

package() {
  cd "$_pkgname"

  install -Dm755 "$_pkgname/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
