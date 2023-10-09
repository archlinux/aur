# Maintainer: jkl
_pkgname=dupluxy
pkgname=$_pkgname-git
pkgver=v0.1.0.r0.2d5338f
_duplicacyver=v3.2.3
pkgrel=2
pkgdesc="Duplicacy based cloud backup tool based on lock-free deduplication with Linux/POSIX enhancement and hardlinks"
arch=('x86_64' 'i686')
url="https://www.dupluxy.com/"
license=('custom')
depends=('glibc')
makedepends=('go' 'git')
source=("git+https://github.com/dupluxy/dupluxy")
sha256sums=('SKIP')
provides=("$_pkgname" duplicacy)
conflicts=(duplicacy duplicacy-git)

pkgver () {
  cd "$srcdir/$_pkgname"
  printf "%s" "$(git describe --tags --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
  cd "$_pkgname"

  mkdir -p "$srcdir/go/duplicacy/src/github.com/gilbertchen"
  mkdir -p "$srcdir/go/$_pkgname/src/github.com/dupluxy"

  ln -nsf "$srcdir/$_pkgname" "$srcdir/go/duplicacy/src/github.com/gilbertchen/duplicacy"
  ln -nsf "$srcdir/$_pkgname" "$srcdir/go/$_pkgname/src/github.com/dupluxy/$_pkgname"
}

build() {
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  export GO111MODULE=auto

  export GOPATH="$srcdir/go"

  cd "$_pkgname/duplicacy"
  git checkout "$_duplicacyver"

  commit="$(git rev-parse --short=6 HEAD)"
  go get -d -v
  go build -ldflags="-X main.GitCommit=$commit"

  git checkout master
  cd "$srcdir/$_pkgname/$_pkgname"

  commit="$(git rev-parse --short HEAD)"
  go get -d -v
  go build -ldflags="-X main.Version=$pkgver -X main.GitCommit=$commit"
}

check() {
  cd "$_pkgname/src"

  git checkout master

  GO111MODULE=auto GOPATH="$srcdir/go" go test -v -x
}

package() {
  cd "$_pkgname"

  install -Dm755 "$_pkgname/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm755 "duplicacy/duplicacy" "$pkgdir/usr/bin/duplicacy.real"

  ln -s "$_pkgname" "$pkgdir/usr/bin/duplicacy"

  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
