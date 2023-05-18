# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=html2md
pkgver=1.1.0
pkgrel=1
pkgdesc='HTML to Markdown converter'
arch=('x86_64')
url='https://github.com/suntong/html2md'
license=('MIT')
depends=('glibc')
makedepends=('git' 'go')
options=('!lto')
_commit='d16838c89887a1a5efd6856f043ccb43c9391ce0'
source=(
  "$pkgname::git+$url.git#commit=$_commit"
  'go.mod'
  'go.sum'
)
sha512sums=('SKIP'
            '2851262e88d4c0ed1f265c33171e4e7467023e3285eb763b870c16cff940d9c4c269eaf844f2c84867dba164ba2af8aeec0e2b5e304db47f31f6e7060a2d0b43'
            'e176d6c70f32a6ead1f5826ab784ee4007458a1ecb2c72d54f36e4637c8083f60c759dcc48071681f8a04285a6031170609ddef4c1429527e59a5812de457197')
b2sums=('SKIP'
        '203b9b58242acddb6b3bda3f85c18720eff765a2ecf842fc68b8e977892ecc37c91c808982a4ee2fcfde271e6d884d6b31f128c2776783c715bd60dbd908b750'
        '0532b55eec0c94b37b22a282604b3013104ecdcf0cac6a8f53f67182790298612a25061f733f0bc10d9882480306700d21ea42f70c882893dea452ff7fbd27ca')

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
    .
}

check() {
  cd "$pkgname"

  go test -v ./...
}

package() {
  cd "$pkgname"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" html2md

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
