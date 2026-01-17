# Maintainer: tarball <bootctl@gmail.com>
# Contributor: brody <archfan@brodix.de>

pkgbase=netbird
pkgname=(
  $pkgbase
  $pkgbase-management
  $pkgbase-signal
  $pkgbase-relay
  $pkgbase-ui
)
pkgver=0.63.0
pkgrel=3
url='https://netbird.io'
arch=(i686 pentium4 x86_64 arm armv7h armv6h aarch64 riscv64)
_ui_depends=(
  libglvnd
  libx11
  libxcursor
  libxi
  libxinerama
  libxrandr
  libxxf86vm
)
makedepends=('go' "${_ui_depends[@]}")
source=("$pkgbase-$pkgver.tar.gz::https://github.com/netbirdio/netbird/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('36b2962a5cd560b44221f1eaac3fa93fbd7411ff838af9b9cdf806f5ce210cbd')

prepare() {
  cd "$srcdir/$pkgbase-$pkgver"
  mkdir -p build
  go mod download -x
}

build() {
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  cd "$srcdir/$pkgbase-$pkgver"

  go build \
    -o build \
    -ldflags "-s -w -linkmode=external -X github.com/netbirdio/netbird/version.version=$pkgver -extldflags \"$LDFLAGS\"" \
    ./client ./signal ./management ./relay ./client/ui

  # relay does not support completions
  for bin in client signal management; do
    for shell in bash fish zsh; do
      ./build/$bin completion $shell >build/$bin.$shell
    done
  done
}

# upstream test suite requires root
check() {
  cd "$srcdir/$pkgbase-$pkgver/build"

  # relay does not support --version
  [[ "$(./client version)" == $pkgver ]]
  [[ "$(./management --version)" == "$pkgbase-mgmt version $pkgver" ]]
  [[ "$(./signal --version)" == "$pkgbase-signal version $pkgver" ]]
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

package_netbird-ui() {
  license=('BSD-3-Clause')
  pkgdesc='GUI for the Netbird client'
  depends=(
    glibc
    netbird
    "${_ui_depends[@]}"
  )

  cd "$srcdir/$pkgbase-$pkgver"
  install -Dm755 build/ui "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  cd client/ui
  install -Dm644 assets/netbird.png "$pkgdir/usr/share/pixmaps/netbird.png"
  install -Dm644 build/netbird.desktop "$pkgdir/usr/share/applications/netbird.desktop"
}

package_netbird-management() {
  license=('AGPL-3.0-only')
  backup=(etc/default/$pkgname)
  depends=(glibc ca-certificates)
  optdepends=('redis: IDP cache store')
  pkgdesc='WireGuard-based overlay network: management service'

  install -dm755 "$pkgdir/etc/$pkgbase"

  cd "$srcdir/$pkgbase-$pkgver"
  install -Dm755 build/management "$pkgdir/usr/bin/$pkgbase-mgmt"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  _completions management "$pkgbase-mgmt"

  cd release_files/systemd/
  install -Dm644 env "$pkgdir/etc/default/$pkgname"
  install -Dm644 $pkgname.service -t "$pkgdir/usr/lib/systemd/system/"
}

package_netbird-signal() {
  license=('AGPL-3.0-only')
  backup=(etc/default/$pkgname)
  depends=(glibc)
  pkgdesc='WireGuard-based overlay network: signal service'

  cd "$srcdir/$pkgbase-$pkgver"
  install -Dm755 build/signal "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  _completions signal "$pkgname"

  cd release_files/systemd/
  install -Dm644 env "$pkgdir/etc/default/$pkgname"
  install -Dm644 $pkgname.service -t "$pkgdir/usr/lib/systemd/system/"
}

package_netbird-relay() {
  license=('AGPL-3.0-only')
  backup=(etc/default/$pkgname)
  depends=(glibc)
  pkgdesc='WireGuard-based overlay network: relay service'

  cd "$srcdir/$pkgbase-$pkgver"
  install -Dm755 build/relay "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  cd release_files/systemd/
  if [[ ! -f $pkgname.service ]]; then
    cp netbird-signal.service $pkgname.service
    sed -i 's|Netbird Signal|Netbird Relay|' $pkgname.service
    sed -i 's|netbird-signal|netbird-relay|' $pkgname.service
    sed -i -E 's|^ExecStart=.+|ExecStart=/usr/bin/netbird-relay $FLAGS|' $pkgname.service
  fi
  install -Dm644 env "$pkgdir/etc/default/$pkgname"
  install -Dm644 $pkgname.service -t "$pkgdir/usr/lib/systemd/system/"
}
