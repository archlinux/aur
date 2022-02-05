# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=html2md
pkgver=0.2.2
pkgrel=2
pkgdesc="HTML to Markdown converter"
arch=('x86_64')
url="https://github.com/suntong/html2md"
license=('MIT')
depends=('glibc')
makedepends=('git' 'go')
options=('!lto')
_commit='ed1b03f99d79b4a4ecd499d1d4636402343193e3'
source=(
  "$pkgname::git+$url.git#commit=$_commit"
  'go.mod'
  'go.sum'
)
sha512sums=('SKIP'
            'a49b0ed0f475fcd16b18be9115c98fa1ac1b77c90c902e1e12edf786b1104c32b93beda2617aded21956731a1bbebf7dd20e4cec554ee465c899935c207f8911'
            '56cf6feccfc7acb68609953cd2e407edfb25c00b682dcc6143a2d6663ce6d2043504b41ecc4c6d1a99be1f73ead31cd6c066300467b18e9d4b684d6565181523')
b2sums=('SKIP'
        '46367ab71522030278b89393f8f978252d8135c3f0b2a5cc13a38b680bf204c9014674e22d11306775b33bbc9478b974c58211f79f23293f6224178ab4aa0f4f'
        '89bba593434e6f94fb4ab6fc563665319b5f79c8b608713062e12d66308ef5eaa22f722d20f33fb38eae693b3dcf30d28f72c226dfd5a34a2c46bdb86b5f388e')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed 's/^v//'
}

prepare() {
  cd "$pkgname"

  # create directory for build output
  mkdir build

  # use pre-generated module list
  cp ../go.{mod,sum} .

  # download dependencies
  go mod download

  # ensure package displays correct version & date strings
  local date=$(git show --no-patch --format=%cd --date=format:%Y-%m-%d)
  local version=$(git describe --tags | sed 's/^v//')

  sed -i \
    -e "s/\" + version + \"/$version/" \
    -e "s/ + date +/ + \"$date\" +/" \
    html2md_cliDef.go
}

build() {
  cd "$pkgname"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"

  go build -v \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -extldflags ${LDFLAGS}" \
    -o build \
    .
}

check() {
  cd "$pkgname"

  go test -v ./...
}

package() {
  cd "$pkgname"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" build/html2md

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
