# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=xq
pkgver=1.0.0
pkgrel=1
pkgdesc='Command-line XML and HTML beautifier and content extractor'
arch=('x86_64')
url='https://github.com/sibprogrammer/xq'
license=('MIT')
depends=('glibc')
makedepends=('git' 'go')
options=('!lto')
_commit='21fca280a144fbf34ab1a58efa39acb495a46764'
source=(
  "$pkgname::git+$url#commit=$_commit"
  'manpage-template.patch'
)
b2sums=('SKIP'
        '4673d2c90996be27f5889f97541f1c4bd0c89c48d5b0573846d7e7a791bba3eaa66ca9774a054911d0014ee33e48bb19084fa3340a12756b2369928c4b951eb3')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed 's/^v//'
}

prepare() {
  cd "$pkgname"

  # create directory for build output
  mkdir build

  # download dependencies
  go mod download

  # turn man page into a template
  patch -p1 -i "$srcdir/manpage-template.patch"
}

build() {
  cd "$pkgname"

  # set Go flags
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"

  # commit date for binary & man page
  local _commit_date=$(git show --no-patch --format=%cd --date=format:%Y-%m-%d)

  go build -v \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -extldflags ${LDFLAGS} \
    -X main.commit=$_commit \
    -X main.date=$_commit_date \
    -X main.version=$pkgver" \
    -o build \
    .

  # template-ify man page
  sed \
    -e "s/@DATE@/$_commit_date/" \
    -e "s/@VERSION@/$pkgver/" \
    -i docs/xq.man
}

check() {
  cd "$pkgname"

  go test -v ./...
}

package() {
  cd "$pkgname"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" build/xq

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
  cp -vr assets "$pkgdir/usr/share/doc/$pkgname"

  # man
  install -vDm644 docs/xq.man "$pkgdir/usr/share/man/man1/$pkgname.1"

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
