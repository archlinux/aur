# Maintainer: Matt Harrison <matt@harrison.us.com>
# Contributor: Krister Bäckman <ixevix@gmail.com>
# Contributor: Zhanibek Adilbekov <zhanibek.adilbekov@pm.me>

# Maintained at: https://github.com/matt-h/aur-pkgbuilds or https://codeberg.org/matt/aur-pkgbuilds

pkgname=slack-cli
pkgver=4.2.0
pkgrel=1
pkgdesc="Command-line interface for building apps on the Slack Platform."
arch=('x86_64' 'aarch64')
url="https://github.com/slackapi/slack-cli/"
license=('Apache-2.0')
depends=('glibc')
makedepends=('go' 'git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/slackapi/slack-cli/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('8e9f83e02cd4162f019d0ba27bb7631bca2c0000a6fca35ee96ff043511b9fc1e16d03d4e7b248b3e6f9c4e8769067082ea65ac032d4f10e9168c64916b36464')

prepare(){
  cd "$pkgname-$pkgver"
  mkdir -p build/
}

build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  go build -o build/$pkgname -ldflags="-X github.com/slackapi/slack-cli/internal/version.Version=v${pkgver}"
}

check() {
  cd "$pkgname-$pkgver"
  go test ./...
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
