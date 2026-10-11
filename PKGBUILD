# Maintainer: Luke Bubar <luke@coldmail.xyz>

pkgname=goatak
pkgver=0.24.0
pkgrel=1
pkgdesc='Fast and simple ATAK/CivTAK server (CoT router) and web client'
arch=('x86_64' 'aarch64')
url='https://github.com/kdudkov/goatak'
license=('AGPL-3.0-or-later')
# bash, openssl and zip are used by the bundled cert/*.sh scripts
depends=('bash' 'openssl' 'zip')
makedepends=('go')
backup=('etc/goatak/goatak_server.yml')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        "$pkgname.sysusers")
sha256sums=('2f0cccd01db05698fada88c975c5ece6bdb1e7e54e1b42bacfd8e54d72f7ba73'
            '895d12d1d636d2c853ff90d598dc4a69e42985d189ec478a5b77a75edf84abd6')

build() {
  cd "$pkgname-$pkgver"

  export CGO_ENABLED=0
  export GOFLAGS="-trimpath -mod=readonly -modcacherw"

  go build \
    -ldflags "-s -w -X main.gitRevision=v$pkgver -X main.gitBranch=release" \
    -o dist/ ./cmd/...
}

package() {
  cd "$pkgname-$pkgver"

  # binaries (names per upstream .goreleaser.yml; `webclient` is released as `goatak_client`)
  install -Dm755 dist/goatak_server -t "$pkgdir/usr/bin/"
  install -Dm755 dist/takreplay     -t "$pkgdir/usr/bin/"
  install -Dm755 dist/webclient        "$pkgdir/usr/bin/goatak_client"

  # configuration
  install -Dm644 goatak_server.yml "$pkgdir/etc/goatak/goatak_server.yml"
  install -Dm644 goatak_client.yml -t "$pkgdir/usr/share/doc/$pkgname/"

  # templates: cert generation scripts and default data (seeded into /var/lib/goatak by the service)
  install -dm755 "$pkgdir/usr/share/$pkgname"
  cp -r cert data "$pkgdir/usr/share/$pkgname/"
  find "$pkgdir/usr/share/$pkgname" -type d -exec chmod 755 {} +
  find "$pkgdir/usr/share/$pkgname" -type f -name '*.sh' -exec chmod 755 {} +
  find "$pkgdir/usr/share/$pkgname" -type f ! -name '*.sh' -exec chmod 644 {} +

  # system user
  install -Dm644 "$srcdir/$pkgname.sysusers" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
