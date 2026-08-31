# Maintainer: c0m4r <https://github.com/c0m4r>
pkgname=kula
pkgver=0.19.0
pkgrel=1
pkgdesc="Lightweight, self-contained monitoring tool"
arch=('x86_64')
url="https://github.com/c0m4r/kula"
license=('AGPL-3.0')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/c0m4r/kula/archive/${pkgver}.tar.gz")
sha256sums=('ad640cd7c47c17a7baac2f8a42f9a5626a3fd8a15f2f77e4f271a4181b70cd5f')
install='kula.install'

check() {
  cd "${pkgname}-${pkgver}"
  export CGO_ENABLED=1
  go vet ./...
  go test -v -race -skip TestLandlockEnforcement ./...
}

build() {
  cd "${pkgname}-${pkgver}"
  export CGO_ENABLED=0
  go build     -trimpath     -ldflags="-s -w"     -buildvcs=false     -o kula ./cmd/kula/
}

package() {
  cd "${pkgname}-${pkgver}"

  # Install binary
  install -Dm755 kula "$pkgdir/usr/bin/kula"

  # Install systemd service
  install -Dm644 addons/init/systemd/kula.service "$pkgdir/usr/lib/systemd/system/kula.service"

  # Install example config
  install -Dm640 config.example.yaml "$pkgdir/etc/kula/config.example.yaml"

  # Create data directory
  install -dm750 "$pkgdir/var/lib/kula"

  # Install bash completion
  install -Dm644 addons/bash-completion/kula "$pkgdir/usr/share/bash-completion/completions/kula"

  # Create man directory
  install -dm755 "$pkgdir/usr/share/man/man1"

  # Install man page
  if [ -f "addons/man/kula.1" ]; then
      install -Dm644 addons/man/kula.1 "$pkgdir/usr/share/man/man1/kula.1"
  else
      install -Dm644 addons/kula.1 "$pkgdir/usr/share/man/man1/kula.1"
  fi

  # Copy scripts directory
  if [ -d "scripts" ]; then
      cp -r scripts "$pkgdir/usr/share/kula/"
  fi

  # Install documentation
  for f in CHANGELOG.md VERSION README.md SECURITY.md LICENSE config.example.yaml; do
      if [ -f "$f" ]; then
          install -Dm644 "$f" "$pkgdir/usr/share/kula/$f"
      fi
  done
}
