# Maintainer: tarball <bootctl@gmail.com>
# Contributor: brody <archfan@brodix.de>

pkgbase=netbird
pkgname=(
  $pkgbase
  $pkgbase-management
  $pkgbase-signal
)
pkgver=0.24.2
pkgrel=1
url='https://netbird.io'
arch=(i686 pentium4 x86_64 arm armv7h armv6h aarch64 riscv64)
license=(BSD)
makedepends=('go')

source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/netbirdio/$pkgname/archive/refs/tags/v$pkgver.tar.gz"
  'netbird.env'
  'netbird@.service'
  'netbird-signal.env'
  'netbird-signal.service'
  'netbird-management.env'
  'netbird-management.service'
)
sha256sums=('7fd90c6004c7fde6393bd618e106410e708f2d84f7884055acda6b016be42858'
            '128e36e1f814a12886f3122a1809a404be17f81481275b6624e66937941f5269'
            '3bd6d2692dc6d08cfabce1ba2514c02f4463294ebbdb63828baca5d9e4c9daa9'
            '80cd7b6a22087a83c1332c15693d8a18b780ef5ecf3fbc562af28d1a623eef3b'
            'e7b6be420614a4ed1ec6097f2466b6fbf8d0b01a9eb8140ead9b2048ce5be4a8'
            '7d31d7847f5a25bca81def470f7fc5a277c3064e5a0ad71a3f19a29202537315'
            '6f62fd0d631c1375e6f7f7d0843a46519f39e3cd952cf24100dcd8743d876d26')

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
    ./client ./signal ./management

  for bin in client signal management; do
    for shell in bash fish zsh; do
      ./build/$bin completion $shell >build/$bin.$shell
    done
  done
}

# upstream test suite requires root
check() {
  cd "$srcdir/$pkgbase-$pkgver/build"

  [[ "$(./client version)" == $pkgver ]]
  [[ "$(./management --version)" == "$pkgbase-mgmt version $pkgver" ]]
  [[ "$(./signal --version)" == "$pkgbase-signal version $pkgver" ]]
}

package_netbird() {
  backup=(etc/default/$pkgname)
  depends=(glibc)
  optdepends=('resolvconf: Private DNS')
  pkgdesc='WireGuard-based mesh network: client'
  replaces=(wiretrustee)

  install -Dm644 $pkgname.env "$pkgdir/etc/default/$pkgname"
  install -Dm644 $pkgname@.service "$pkgdir/usr/lib/systemd/system/$pkgname@.service"
  install -dm755 "$pkgdir/etc/$pkgbase"

  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 build/client "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 build/client.bash "$pkgdir/usr/share/bash-completion/completions/$pkgname"
  install -Dm644 build/client.fish "$pkgdir/usr/share/fish/completions/$pkgname.fish"
  install -Dm644 build/client.zsh "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
}

package_netbird-management() {
  backup=(etc/default/$pkgname)
  depends=(glibc ca-certificates)
  pkgdesc='WireGuard-based mesh network: management service'

  install -Dm644 $pkgname.env "$pkgdir/etc/default/$pkgname"
  install -Dm644 $pkgname.service "$pkgdir/usr/lib/systemd/system/$pkgname.service"
  install -dm755 "$pkgdir/etc/$pkgbase"

  cd "$srcdir/$pkgbase-$pkgver"

  install -Dm755 build/management "$pkgdir/usr/bin/$pkgbase-mgmt"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 build/management.bash "$pkgdir/usr/share/bash-completion/completions/$pkgbase-mgmt"
  install -Dm644 build/management.fish "$pkgdir/usr/share/fish/completions/$pkgbase-mgmt.fish"
  install -Dm644 build/management.zsh "$pkgdir/usr/share/zsh/site-functions/_$pkgbase-mgmt"
}

package_netbird-signal() {
  backup=(etc/default/$pkgname)
  depends=(glibc)
  pkgdesc='WireGuard-based mesh network: signal service'

  install -Dm644 $pkgname.env "$pkgdir/etc/default/$pkgname"
  install -Dm644 $pkgname.service "$pkgdir/usr/lib/systemd/system/$pkgname.service"

  cd "$srcdir/$pkgbase-$pkgver"

  install -Dm755 build/signal "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 build/signal.bash "$pkgdir/usr/share/bash-completion/completions/$pkgname"
  install -Dm644 build/signal.fish "$pkgdir/usr/share/fish/completions/$pkgname.fish"
  install -Dm644 build/signal.zsh "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
}
