# Maintainer: tarball <bootctl@gmail.com>
# Contributor: brody <archfan@brodix.de>

pkgbase=netbird
pkgname=(
  $pkgbase
  $pkgbase-management
  $pkgbase-signal
  $pkgbase-relay
)
pkgver=0.37.2
pkgrel=1
url='https://netbird.io'
arch=(i686 pentium4 x86_64 arm armv7h armv6h aarch64 riscv64)
license=(BSD-3-Clause)
makedepends=('go')

source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/netbirdio/$pkgname/archive/refs/tags/v$pkgver.tar.gz"
  'netbird.env'
  'netbird@.service'
  'netbird-signal.env'
  'netbird-signal.service'
  'netbird-management.env'
  'netbird-management.service'
  'netbird-relay.env'
  'netbird-relay.service'
)
sha256sums=('20d0663de3f1e66238b2d8cedd3f50ba93539f17935c8243a1a3a458bf079b71'
            '128e36e1f814a12886f3122a1809a404be17f81481275b6624e66937941f5269'
            '2fa681ef862bfa609d62596e730ff5fbfa706fedca801556cd18a97f349e039f'
            '80cd7b6a22087a83c1332c15693d8a18b780ef5ecf3fbc562af28d1a623eef3b'
            '2f5b3fee5a87099903d4fb65fc1a295b07669c90160b702c705471cb2a313842'
            '7d31d7847f5a25bca81def470f7fc5a277c3064e5a0ad71a3f19a29202537315'
            '834deff3977679cd70bab8fff7413e3f96085acd88175ff69e500478cb689229'
            'da07172b4a061387adda838f241982954e3eea62b9ba4aa677393b29d1630b28'
            '8ba9b40cd7db61a9339e2ccc3528e2b2951cc8f6afc252af329af12617334436')

prepare() {
  cd "$srcdir/$pkgbase-$pkgver"
  mkdir -p build
  go mod download
}

build() {
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  cd "$srcdir/$pkgbase-$pkgver"

  go build \
    -o build \
    -ldflags "-s -w -linkmode=external -X github.com/netbirdio/$pkgname/version.version=$pkgver -extldflags \"$LDFLAGS\"" \
    ./client ./signal ./management ./relay

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

package_netbird() {
  backup=(etc/default/$pkgname)
  depends=(glibc)
  optdepends=('resolvconf: Private DNS')
  pkgdesc='WireGuard-based overlay network: client'
  replaces=(wiretrustee)

  install -Dm644 $pkgname.env "$pkgdir/etc/default/$pkgname"
  install -Dm644 $pkgname@.service "$pkgdir/usr/lib/systemd/system/$pkgname@.service"
  install -dm755 "$pkgdir/etc/$pkgbase"

  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 build/client "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 build/client.bash "$pkgdir/usr/share/bash-completion/completions/$pkgname"
  install -Dm644 build/client.fish "$pkgdir/usr/share/fish/vendor_completions.d/$pkgname.fish"
  install -Dm644 build/client.zsh "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
}

package_netbird-management() {
  backup=(etc/default/$pkgname)
  depends=(glibc ca-certificates)
  pkgdesc='WireGuard-based overlay network: management service'

  install -Dm644 $pkgname.env "$pkgdir/etc/default/$pkgname"
  install -Dm644 $pkgname.service "$pkgdir/usr/lib/systemd/system/$pkgname.service"
  install -dm755 "$pkgdir/etc/$pkgbase"

  cd "$srcdir/$pkgbase-$pkgver"

  install -Dm755 build/management "$pkgdir/usr/bin/$pkgbase-mgmt"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 build/management.bash "$pkgdir/usr/share/bash-completion/completions/$pkgbase-mgmt"
  install -Dm644 build/management.fish "$pkgdir/usr/share/fish/vendor_completions.d/$pkgbase-mgmt.fish"
  install -Dm644 build/management.zsh "$pkgdir/usr/share/zsh/site-functions/_$pkgbase-mgmt"
}

package_netbird-signal() {
  backup=(etc/default/$pkgname)
  depends=(glibc)
  pkgdesc='WireGuard-based overlay network: signal service'

  install -Dm644 $pkgname.env "$pkgdir/etc/default/$pkgname"
  install -Dm644 $pkgname.service "$pkgdir/usr/lib/systemd/system/$pkgname.service"

  cd "$srcdir/$pkgbase-$pkgver"

  install -Dm755 build/signal "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 build/signal.bash "$pkgdir/usr/share/bash-completion/completions/$pkgname"
  install -Dm644 build/signal.fish "$pkgdir/usr/share/fish/vendor_completions.d/$pkgname.fish"
  install -Dm644 build/signal.zsh "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
}

package_netbird-relay() {
  backup=(etc/default/$pkgname)
  depends=(glibc)
  pkgdesc='WireGuard-based overlay network: relay service'

  install -Dm644 $pkgname.env "$pkgdir/etc/default/$pkgname"
  install -Dm644 $pkgname.service "$pkgdir/usr/lib/systemd/system/$pkgname.service"

  cd "$srcdir/$pkgbase-$pkgver"

  install -Dm755 build/relay "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
