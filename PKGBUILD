# Maintainer: Kyle Westhaus <kwesthaus+aur at gmail dot com>
# Maintainer: Kevin Orr <kevinorr54+aur at gmail dot com>
# Contributor: Kaley Main <kaleypoole17 at gmail dot com>
# Contributor: John Trengrove <john at retrofilter dot com>

pkgname=dgraph-git
pkgver=v1.0.12.rc3.r628.gcf7c1e630
pkgrel=1
pkgdesc='Low latency, high throughput, native and distributed graph database'
arch=('x86_64')
url='https://github.com/dgraph-io/dgraph'
license=('APACHE' 'custom:DCL')
makedepends=('go' 'git')
provides=('dgraph')
conflicts=('dgraph' 'dgraph-bin')
source=("$pkgname::git+$url")
sha256sums=('SKIP')

prepare() {
  mkdir -p "$srcdir/tmpgopath/src/github.com/dgraph-io/"
  ln -rTsf "$srcdir/$pkgname" "$srcdir/tmpgopath/src/github.com/dgraph-io/dgraph"
}

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir"

  GOPATH="$(pwd)/tmpgopath" go install \
    -buildmode=pie \
    -gcflags "all=-trimpath=$PWD" \
    -asmflags "all=-trimpath=$PWD" \
    -ldflags "-X github.com/dgraph-io/dgraph/x.lastCommitSHA=$(git --git-dir ./$pkgname/.git rev-parse --short HEAD) -X 'github.com/dgraph-io/dgraph/x.lastCommitTime=$(git --git-dir ./$pkgname/.git log -1 --format=%ci)' -X github.com/dgraph-io/dgraph/x.dgraphVersion=$(git --git-dir ./$pkgname/.git describe --always --tags) -X github.com/dgraph-io/dgraph/x.gitBranch=$(git --git-dir ./$pkgname/.git rev-parse --abbrev-ref HEAD) -extldflags '$LDFLAGS -Wl,-z,relro,-z,now'" \
    -v "./tmpgopath/src/github.com/dgraph-io/dgraph/dgraph/..."
}

package() {
  cd "$srcdir"
  install -Dm644 "$pkgname/licenses/DCL.txt" "$pkgdir/usr/share/licenses/$pkgname/DCL.txt"
  for binary in dgraph; do
    install -Dm755 "tmpgopath/bin/$binary" "$pkgdir/usr/bin/$binary"
  done
}

# vim:set ts=2 sw=2 et:
