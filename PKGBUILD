# Maintainer: Matt Harrison <matt@harrison.us.com>
# Contributor: Krister Bäckman <ixevix@gmail.com>
# Contributor: Zhanibek Adilbekov <zhanibek.adilbekov@pm.me>

# Maintained at: https://github.com/matt-h/aur-pkgbuilds or https://codeberg.org/matt/aur-pkgbuilds

pkgname=slack-cli
pkgver=4.3.0
pkgrel=1
pkgdesc="Command-line interface for building apps on the Slack Platform."
arch=('x86_64' 'aarch64')
url="https://github.com/slackapi/slack-cli/"
license=('Apache-2.0')
depends=('glibc')
makedepends=('go' 'git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/slackapi/slack-cli/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('4593fcee2deb4c193c40be85bdd8aff62cfdad779f0e9b85ebf2565ab88d94732a2781dff415ab7c78966934c4e54ba50d75815aa122b8c8f382cac0c9b32f0f')

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
