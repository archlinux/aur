# Maintainer: c0m4r <https://github.com/c0m4r
pkgname=kula
pkgver=0.11.0
pkgrel=1
pkgdesc="Lightweight, self-contained monitoring tool"
arch=('x86_64')
url="https://github.com/c0m4r/kula"
license=('AGPL-3.0')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/c0m4r/kula/archive/${pkgver}.tar.gz")
sha256sums=('5cdb79b377a46c20e797b83198a8ded93a9f42b255b9ad659a6b6a08c8f85be5')
install='kula.install'

build() {
  cd "${pkgname}-${pkgver}"
  export CGO_ENABLED=0
  go build     -trimpath     -ldflags="-s -w"     -buildvcs=false     -o kula ./cmd/kula/
}

check() {
  cd "${pkgname}-${pkgver}"
  export CGO_ENABLED=1
  go vet ./...
  go test -v -race ./...
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
