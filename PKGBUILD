# Maintainer: envolution
# Contributor: George Rawlinson <grawlinson@archlinux.org>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=html2md
pkgver=1.6.0
pkgrel=1
pkgdesc='HTML to Markdown converter'
arch=(x86_64 aarch64 armv7h i686)
url='https://github.com/suntong/html2md'
license=('MIT')
depends=('glibc')
makedepends=('git' 'go')
options=('!lto')
source=(
  "$pkgname::git+$url.git#tag=v$pkgver"
  'go.mod'
  'go.sum'
)
sha256sums=('9df1f93b4a88ed0000afffd63ea8c07670f60faa91ae7e6ae10426c5685053aa'
            'af244c62a0aece1c73ad99e6f946da56a141b765c449f84001559cd1e860db11'
            'ae905c1f54c41726b7c687e62a0b43fc6e033d860d720de3d15e276ad63f0fa8')

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
    -ldflags "-linkmode external -extldflags '${LDFLAGS}'" \
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
# vim:set ts=2 sw=2 et:
