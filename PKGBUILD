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
source=(
  "$pkgname::git+$url.git#tag=v$pkgver"
  'go.mod'
  'go.sum'
)
sha512sums=('1b0b8a84bc9d0e3a180e63157a4c3db22e4d3e732fbb0ec1676850d8f41fcca6b0425ef6f4bc3386432eae73e8ee566cbdab5078c69981d920d4172d74dbba35'
            'c0adcfe1e60ac679559d8081aea72a9859e3b63f0d1a5784ffce4ed1c32c8bd63c968b1861e66837538758cecfc41340be026aaa3681a5870a686cce9dc337d7'
            'fa2d7db48ce8cb4f58dc2943b72732b98e27cdbda769cd19ad873d1d4eedb798b235ae164cb52543394a0a7e7b3592751cae4977e07a5a791ede903f2c990cce')
b2sums=('b4b1dc04936fe2122e37069f01509f273edbf4657b8079568d597deb69570ee9d0bf786b3a525987baba8f8832b7c816bdf54728213b98ef9b2c519a1f6f6882'
        '12fd4d272ba0e2ecc8bb2404504df4dbe77df4a6e8914e82e2fa33a219ef76cfb5e0584b0721a91f83ecf4956af2b2d5f57855fc0fca9a9094fdf77de69f06b1'
        '02cb72cf051f56aab962591a805113f7f57425d42402a0686143e5323c9545436fa2c416df92eff3851e2e5d89edcbb647c76931c330717e0176e24dbebf958d')

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
