# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=cloudflared
pkgver=2021.3.2
pkgrel=1
pkgdesc="Argo Tunnel client"
arch=(x86_64 armv7h aarch64)
url="https://github.com/cloudflare/cloudflared"
license=('custom:cloudflared')
depends=(glibc)
makedepends=(go)
conflicts=(cloudflared-bin)
backup=("etc/$pkgname/config.yml")
source=("$pkgname-$pkgver.tar.gz::https://github.com/cloudflare/cloudflared/archive/$pkgver.tar.gz"
        "config.yml"
        "$pkgname.service"
        "sysusers.d.conf"
        "tmpfiles.d.conf")
b2sums=('e314402e46acd2a37b7da2d6b1274306fed662ba662c0c607b09f55a559884fbf19d24348c0e633a5537a00545fa0cebf2b70b44deb7dca222fefa45fd45980d'
        '887218db3b5e7cdbb90c86b60aac1597d70b59fccece18c8c5e6e2357d04aa219b2438436f23f913a0c8dc6eb425ef3e22901e28fd30e5130d17e414e67ec4af'
        '14229bc641d46bc162882f0fec0304f7f5d24ae52049fbfd57c08cd493645fc54697807a8aafb8fca3c51dd4f7bd7b46ac1527a5eea97decfddaef0c069f65eb'
        '7a15fc73f02cc74e2cea55ba51632724bae16f140e07904a88daa3179ed320e9e6efa9a1901d8249fd1618a2a91f93384a93bfaba6eba6990457b7c2d2155f58'
        'c19a0ac124fffbe084fda2e02413dd3b8309dce1d6b4fbc2346f0b311ad59bed0887166ebe9d45019e629b944b0a5590e53119f8a6d8afc9dd774a15383bb5d5')

prepare() {
  cd "$pkgname-$pkgver"
  mkdir build
}

build() {
  cd "$pkgname-$pkgver"
  go build -v \
    -buildmode=pie \
    -trimpath \
    -mod=vendor \
    -modcacherw \
    -ldflags "-extldflags $LDFLAGS -X "main.Version=${pkgver}" -X "main.BuildTime="$(date --iso-8601=seconds --utc)""" \
    -o build ./cmd/...
}

check() {
  cd "$pkgname-$pkgver"
  go test ./...
}

package() {
  # binary
  install -Dm755 -t "$pkgdir/usr/bin" "$pkgname-$pkgver/build/$pkgname"

  # license
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$pkgname-$pkgver/LICENSE"

  # systemd files
  install -Dm644 -t "$pkgdir/usr/lib/systemd/system" "$pkgname.service"
  install -Dm644 sysusers.d.conf "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
  install -Dm644 tmpfiles.d.conf "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"

  # config
  install -Dm644 -t "$pkgdir/etc/$pkgname" config.yml
}

# vim:set ts=2 sw=2 et:
