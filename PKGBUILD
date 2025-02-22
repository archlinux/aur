# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=zinc
pkgver=0.4.10
pkgrel=1
pkgdesc='A lightweight alternative to Elasticsearch that requires minimal resources'
arch=('x86_64')
url='https://zinclabs.io/'
license=('Apache')
depends=('glibc')
makedepends=(
  'git'
  'go'
  'nodejs'
  'npm'
)
options=('!lto')
_commit='0652db6d39badc753f28ee1122dcbc0e5da1c35e'
source=("$pkgname::git+https://github.com/zincsearch/zincsearch.git#commit=$_commit")
md5sums=('SKIP')

#pkgver() {
#  cd "$pkgname"
#
#  git describe --tags | sed 's/^v//'
#}

prepare() {
  cd "$pkgname"

  # create directory for build output
  mkdir -p build

  # download dependencies
  go mod download
}


build() {
  cd "$pkgname"

  # generate web UI
  pushd web
  npm install
  npm run build
  popd

  # set Go flags
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"

  # ensure build date is reproducible
  local _build_date="$(date --utc --date="@${SOURCE_DATE_EPOCH:-$(date +%s)}" +%Y-%m-%d_%I:%M:%S%p-GMT)"

  go build -v \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -extldflags '${LDFLAGS}' \
    -X github.com/zinclabs/zinc/pkg/meta/v1.Version=${pkgver} \
    -X github.com/zinclabs/zinc/pkg/meta/v1.BuildDate=${_build_date} \
    -X github.com/zinclabs/zinc/pkg/meta/v1.CommitHash=${_commit}" \
    -o build \
    ./cmd/...
}

#check() {
#  cd "$pkgname"
#
#  export ZINC_FIRST_ADMIN_USER="admin"
#  export ZINC_FIRST_ADMIN_PASSWORD="Complexpass#123" 
#
#  go test -v ./...
#}

package() {
  cd "$pkgname"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" build/zincsearch

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}
