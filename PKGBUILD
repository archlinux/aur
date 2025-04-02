# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=html2md
pkgver=1.6.0
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
sha512sums=('5627bac47f3a480a376a361616fde7527d11a393a4d87a84e4cea72085140e0312de226b2d6afc0fc739fe1739782c0196a09028926861f36ccedb6c7167125f'
            'c0adcfe1e60ac679559d8081aea72a9859e3b63f0d1a5784ffce4ed1c32c8bd63c968b1861e66837538758cecfc41340be026aaa3681a5870a686cce9dc337d7'
            'fa2d7db48ce8cb4f58dc2943b72732b98e27cdbda769cd19ad873d1d4eedb798b235ae164cb52543394a0a7e7b3592751cae4977e07a5a791ede903f2c990cce')
b2sums=('014b024cbb8ed644e928a18cf1e270b9f9581b1d860cf780f02deb18da4b60ec17bb95a0eef1211c9b93bc194cebbb954b4d4251d373ba68893a6a3eb1c52951'
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
