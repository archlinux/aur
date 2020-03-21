# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=cloudflared
pkgver=2020.2.1
pkgrel=3
pkgdesc="Argo Tunnel client"
arch=(x86_64)
url=""https://github.com/cloudflare/cloudflared
license=('custom:cloudflared')
makedepends=(go)
conflicts=(cloudflared-bin)
backup=("etc/$pkgname/config.yml")
source=("$pkgname-$pkgver.tar.gz::https://github.com/cloudflare/cloudflared/archive/$pkgver.tar.gz"
        "config.yml"
        "$pkgname.service"
        "sysusers.d.conf"
        "tmpfiles.d.conf")
sha512sums=('79bafdeeed0d12eac93dab225a9c7628267e5b25b6968bbec19cde2c899b0b0205d71f757302a452240ab22c76e7166538032872eac2558f3bd7578057bdfff8'
            '52a8e1a71b7195047ea490ade1caae8f82c7c332d9473611853b6cc21c31eb4403a94b66e9efc800faa4a1d3c0d8b5ad01d60896728161eeb4bf2a69ac58b95a'
            '8ce1641505bb0daa68fb1bc7ea733c505a5424e663ceccd6e05900acf25428c6b05caa9ed1d7a1b2883e5bf6203ef890d4141c3cda56451482ebf0db6268ef1b'
            '019e8bf95390d8f4815cf6118d419dba677967a22d9e68c245c71b32b198f188756e213ccada3f00b44a11b1486ef08780702ea0226086fc7e79e6c4466a26ae'
            '6454925c07fd2ea737ac88d2275e5ca55debcdd675f47f7f2a640357591547b96631993cfb210bc31efe793536173b8d878e381fc18e7f6e80262cde81db0ab9')

prepare() {
  cd "$pkgname-$pkgver"
  # update mismatched vendor directory, which is fixed upstream
  # go: inconsistent vendoring in /build/cloudflared/src/cloudflared-2020.2.1:
  # github.com/gorilla/websocket@v1.4.0: is explicitly required in go.mod, but vendor/modules.txt indicates github.com/gorilla/websocket@v1.2.0
  go mod vendor
}

build() {
  cd "$pkgname-$pkgver"
  go build -v \
    -buildmode=pie \
    -trimpath \
    -mod=vendor \
    -modcacherw \
    -ldflags "-extldflags $LDFLAGS -X "main.Version=${pkgver}" -X "main.BuildTime="$(date --iso-8601=seconds --utc)""" \
    github.com/cloudflare/cloudflared/cmd/cloudflared
}

package() {
  # binary
  install -Dm755 -t "$pkgdir/usr/bin" "$pkgname-$pkgver/$pkgname"

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
