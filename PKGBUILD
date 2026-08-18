# Maintainer: Julien Virey <julien.virey+aur@gmail.com>
pkgname=bootimus
pkgver=0.1.76
pkgrel=1
pkgdesc="A Complete enhanced version of the PXE server"
arch=('x86_64' 'aarch64')
url="https://github.com/garybowers/bootimus"
license=('Apache-2.0')
depends=('glibc')
makedepends=('go' 'git')
backup=(etc/bootimus/bootimus.yaml)
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
  bootimus.service
  bootimus.sysusers
  bootimus.tmpfiles
)
sha256sums=('bc4ef18f1e87f73c8ea567589a6e5627df4984ea0f4a78d617be689c5283362e'
            '7c459b9b60f0ee7659ee0a319191aacf5f3bcfc7ac12bb4f59ce0eb9dfe20087'
            '6a725ce5fa5b20e624f2694331cfd53f0696d0e5b5aa88ab2fc23ebf99e1bd9b'
            '1a3d47f5480778994f3359de2a8b9d90665fba1d98e7557b8bf6a2118b61f1bb')

prepare() {
  cd "$pkgname-$pkgver"
  export GOMODCACHE="${GOMODCACHE:-$srcdir/gomod}"
  go mod download -modcacherw
}

build() {
  cd "$pkgname-$pkgver"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

  sed -i 's/"version": "[^"]*"/"version": "$(VERSION)"/' distro-profiles.json
  sed -i 's/"version": "[^"]*"/"version": "$(VERSION)"/' tools-profiles.json
  cp distro-profiles.json internal/profiles/distro-profiles.json
  cp tools-profiles.json internal/tools/tools-profiles.json
  go build -ldflags="-linkmode=external -w -s -X $pkgname/internal/server.Version=$pkgver" -o "$pkgname" .

  # Clean up deps
  go clean -modcache
}

package() {
  # Systemd
  install -Dm644 bootimus.service "$pkgdir/usr/lib/systemd/system/bootimus.service"
  install -Dm644 bootimus.sysusers "$pkgdir/usr/lib/sysusers.d/bootimus.conf"
  install -Dm644 bootimus.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/bootimus.conf"

  # App
  cd "$pkgname-$pkgver"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 bootimus.example.yaml "$pkgdir/etc/$pkgname/bootimus.example.yaml"
}

# vim: sw=2 ts=2 et:
