# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=air
pkgver=1.27.4
pkgrel=1
pkgdesc="Live reload for Go apps"
arch=('x86_64')
url="https://github.com/cosmtrek/air"
license=('GPL3')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('512831511b472b5815a6980c4ea192939f820b0b860ee687ea4a4db2f264d485445c3a2ac442ed2f2448693610e5d789ca3715e5c7a5776c591038dd80800e0c')
b2sums=('3aef8bb703b7ff746eff2ed4250275e6d5e90b6d33cfa75c96cdb1f56bc3106f8f974c9f4d9be7c971fd5740711a15813632fe09fe2a3618fc8bc67f91257723')

prepare() {
  cd "$pkgname-$pkgver"

  # create directory for build output
  mkdir build

  # download dependencies
  go mod download
}

build() {
  cd "$pkgname-$pkgver"

  # set Go flags
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  local goVersion="$(go version | sed -r 's/go version go(.*)\ .*/\1/')"

  go build -v \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -extldflags ${LDFLAGS} \
    -X main.airVersion=$pkgver \
    -X main.goVersion=$goVersion" \
    -o build .
}

check() {
  cd "$pkgname-$pkgver"
  go test -v ./...
}

package() {
  cd "$pkgname-$pkgver"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin"  "build/$pkgname"

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md air_example.toml
}
