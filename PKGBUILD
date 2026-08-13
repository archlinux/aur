# Maintainer: tarball <bootctl@gmail.com>
# Contributor: brody <archfan@brodix.de>

pkgbase=netbird
pkgname=(
  $pkgbase
  $pkgbase-server
)
pkgver=0.77.0
pkgrel=1
url='https://netbird.io'
arch=(i686 pentium4 x86_64 arm armv7h armv6h aarch64 riscv64)
makedepends=('go')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/netbirdio/netbird/archive/refs/tags/v$pkgver.tar.gz"
        "netbird-server.service")
sha256sums=('f27f5f5f853b74891838a781eb7a18ba7475375cbf69e9f3bf5c3721a7f0a4c2'
            '6e42973058b2db1a167ac110692d02c57b93d29ce6f68d8d5f8b91babcd856c9')

prepare() {
  cd "$srcdir/$pkgbase-$pkgver"
  mkdir -p build
  go mod download -x
}

build() {
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"

  cd "$srcdir/$pkgbase-$pkgver"

  go build \
    -o build \
    -ldflags "-s -w -linkmode=external -X github.com/netbirdio/netbird/version.version=$pkgver -extldflags \"$LDFLAGS\"" \
    ./client ./combined

  local shell
  for shell in bash fish zsh; do
    ./build/client completion $shell >build/client.$shell
  done
}

# upstream test suite requires root
check() {
  cd "$srcdir/$pkgbase-$pkgver/build"
  [[ "$(./client version)" == $pkgver ]]
}

_completions() {
  install -Dm644 "build/$1.bash" "$pkgdir/usr/share/bash-completion/completions/$2"
  install -Dm644 "build/$1.fish" "$pkgdir/usr/share/fish/vendor_completions.d/$2.fish"
  install -Dm644 "build/$1.zsh" "$pkgdir/usr/share/zsh/site-functions/_$2"
}

package_netbird() {
  license=('BSD-3-Clause')
  backup=(etc/default/$pkgname)
  depends=(glibc)
  optdepends=('resolvconf: Private DNS')
  pkgdesc='WireGuard-based overlay network: client'
  replaces=(wiretrustee)

  install -dm755 "$pkgdir/etc/$pkgbase"

  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 build/client "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  _completions client "$pkgname"

  cd release_files/systemd/
  install -Dm644 env "$pkgdir/etc/default/$pkgname"
  install -Dm644 netbird@.service -t "$pkgdir/usr/lib/systemd/system/"
}

package_netbird-server() {
  license=('AGPL-3.0-only')
  backup=(etc/$pkgname/config.yaml)
  depends=(glibc ca-certificates)
  optdepends=('redis: IDP cache store')
  pkgdesc='WireGuard-based overlay network: single-binary server'
  replaces=($pkgbase-{management,signal,relay})

  install -Dm644 $pkgname.service -t "$pkgdir/usr/lib/systemd/system/"

  cd "$srcdir/$pkgbase-$pkgver"
  install -Dm755 build/combined "$pkgdir/usr/bin/$pkgname"
  install -Dm640 combined/config.yaml.example "$pkgdir/etc/$pkgname/config.yaml"
}
