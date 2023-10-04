# Maintainer: jkl
_srcname=duplicacy
_pkgname=duplicacy-ix
pkgname=$_pkgname-git
pkgver=v3.2.2.ix.r0.28efe91
pkgrel=1
pkgdesc="Cloud backup tool based on lock-free deduplication with Linux/POSIX enhancement (special file/hardlinks/flags)"
arch=('x86_64' 'i686')
url="https://duplicacy.com/"
license=('custom')
depends=('glibc')
makedepends=('go' 'git')
source=("git+https://github.com/jkl1337/duplicacy#branch=ix")
sha256sums=('SKIP')
provides=("$_srcname")
conflicts=("$_srcname" "$_srcname-git")

pkgver () {
  cd "$srcdir/$_srcname"
  printf "%s" "$(git describe --tags --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
  cd "$_srcname/$_srcname"

  mkdir -p "src/github.com/gilbertchen"
  ln -nsf "$srcdir/$_srcname" "src/github.com/gilbertchen/$_srcname"

  GO111MODULE=auto GOPATH="$srcdir/$_srcname/$_srcname" go get -d -v
}

build() {
  cd "$_srcname/$_srcname"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  GO111MODULE=auto GOPATH="$srcdir/$_srcname/$_srcname" go build -x -ldflags="-X main.GitCommit=$pkgver"
}

check() {
  cd "$_srcname/$_srcname"

  GO111MODULE=auto GOPATH="$srcdir/$_srcname/$_srcname" go test -v -x
}

package() {
  cd "$_srcname"

  install -Dm755 "$_srcname/$_srcname" "$pkgdir/usr/bin/$_srcname"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
