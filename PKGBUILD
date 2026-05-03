# Maintainer: Pascal <deine-email@example.com>

pkgname=pulsegate-git
_pkgname=PulseGate
pkgver=0.1.0.r8.ge9a6c57
pkgrel=1
pkgdesc="Neon SSH Control Center TUI for managing SSH servers and quick commands"
arch=('x86_64')
url="https://git.pepe44.dev/Pepe44DEV/PulseGate"
license=('MIT')
depends=(
  'glibc'
  'openssh'
  'sshpass'
  'gnome-keyring'
  'libsecret'
)
makedepends=(
  'git'
  'go'
)
optdepends=(
  'seahorse: manage stored keyring passwords'
  'kitty: recommended terminal'
)
provides=('pulsegate')
conflicts=('pulsegate')
source=("$_pkgname::git+https://git.pepe44.dev/Pepe44DEV/PulseGate")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname" || exit 1

  printf "0.1.0.r%s.g%s" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname" || exit 1

  export CGO_ENABLED=0
  export GOPATH="$srcdir/gopath"

  go build \
    -trimpath \
    -mod=readonly \
    -ldflags="-X main.version=${pkgver}" \
    -o pulsegate .
}

package() {
  cd "$srcdir/$_pkgname" || exit 1

  install -Dm755 pulsegate "$pkgdir/usr/bin/pulsegate"

  if [ -f README.md ]; then
    install -Dm644 README.md "$pkgdir/usr/share/doc/pulsegate/README.md"
  fi

  if [ -f config.example.yaml ]; then
    install -Dm644 config.example.yaml "$pkgdir/usr/share/doc/pulsegate/config.example.yaml"
  fi

  if [ -f pulsegate_screenshot.png ]; then
    install -Dm644 pulsegate_screenshot.png "$pkgdir/usr/share/doc/pulsegate/pulsegate_screenshot.png"
  fi
}
