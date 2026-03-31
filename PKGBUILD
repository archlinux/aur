# Maintainer: Krister Bäckman <ixevix@gmail.com>
# Contributor: Zhanibek Adilbekov <zhanibek.adilbekov@pm.me>

pkgname=slack-cli
pkgver=3.15.0
pkgrel=1
pkgdesc="Command-line interface for building apps on the Slack Platform."
arch=('x86_64')
url="https://github.com/slackapi/slack-cli/"
license=('Apache-2.0')
depends=('glibc')
makedepends=('go' 'git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/slackapi/slack-cli/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('ed4fb64e93c7fe1966c5e4060408e316fe9dac9909624c81889fdf8dd845ff3d20163e25a7cd48336880f8d51393cf629fd2a72e8a6a936d9236fadc270c7d72')

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

  go build -o build/$pkgname -ldflags="-X github.com/slackapi/slack-cli/internal/pkg/version.Version=v${pkgver}"
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
