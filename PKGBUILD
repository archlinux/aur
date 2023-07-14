# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=xq
pkgver=1.2.1
pkgrel=1
pkgdesc='Command-line XML and HTML beautifier and content extractor'
arch=('x86_64')
url='https://github.com/sibprogrammer/xq'
license=('MIT')
depends=('glibc')
makedepends=('git' 'go')
conflicts=('yq')
options=('!lto')
_commit='8ed07bdd6390e64f126abb832bcab0da317f7f34'
source=(
  "$pkgname::git+$url#commit=$_commit"
  'manpage-template.patch'
)
b2sums=('SKIP'
        'f2448e22798e018d6962016dc800ff96ae9c23b776742348a7036d613efa8c37e5c8c7a539804f2daebc4c152495cc1cbbcb2635fcf223e958596333cab1b843')

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
  export GOPATH="${srcdir}"

  # commit date for binary & man page
  local _commit_date=$(git show --no-patch --format=%cd --date=format:%Y-%m-%d)

  go build -v \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-compressdwarf=false \
    -linkmode external \
    -extldflags ${LDFLAGS} \
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
