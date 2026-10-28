# Maintainer: Gianluca Boiano <morf3089@gmail.com>
pkgname=openartifact
pkgver=0.14.0 # renovate: datasource=github-releases depName=openartifact/openartifact extractVersion=^v(?<version>\d.+)$
pkgrel=1
pkgdesc="Free-as-in-freedom artifact repository manager (Maven, npm, PyPI, OCI, Helm, ...)"
arch=('x86_64' 'aarch64')
url='https://github.com/openartifact/openartifact'
license=('AGPL-3.0-or-later')
makedepends=('go' 'bun')
provides=("oa-cli=$pkgver")
conflicts=('openartifact-bin')
backup=('etc/openartifact/openartifact.yaml')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        "openartifact.service")
sha256sums=('ebd41929047780735871c5b96cd8d6605706689548f7ed7c8a933f63079a3db8'
            'bc1ec1cb88982f5c3bfc5a86505bcc8b87e6e83541609526b90b298ea2c473cb')

build() {
  cd "$pkgname-$pkgver"
  export CGO_ENABLED=0 GOFLAGS="-trimpath -mod=readonly -modcacherw"

  # The server embeds web/dist
  (cd web && bun install --frozen-lockfile && bun run build)

  go build -ldflags "-s -w -X main.version=$pkgver" -o build/openartifact ./cmd/server
  go build -ldflags "-s -w" -o build/resetpw ./cmd/resetpw
  go build -ldflags "-s -w -X main.version=$pkgver" -o build/oa ./cmd/oa
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build/openartifact "$pkgdir/usr/bin/openartifact"
  install -Dm755 build/resetpw "$pkgdir/usr/bin/openartifact-resetpw"
  install -Dm755 build/oa "$pkgdir/usr/bin/oa"
  install -Dm644 openartifact.example.yaml "$pkgdir/etc/openartifact/openartifact.yaml"
  install -Dm644 .env.example "$pkgdir/usr/share/doc/$pkgname/env.example"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
  install -Dm644 "$srcdir/openartifact.service" -t "$pkgdir/usr/lib/systemd/system/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
