#!/bin/sh
# Maintainer: Aidan Timson (Timmo) <aidan@timmo.dev>
pkgname=go-automate-git
pkgver=0.1.0.r91.gfa86b0b
pkgrel=1
pkgdesc="CLI utility to trigger Home Assistant automations via keyboard shortcuts (git version)"
arch=('x86_64' 'aarch64')
url="https://github.com/timmo001/go-automate"
license=('Apache-2.0')
keywords=('home-assistant' 'automation' 'cli' 'keyboard-shortcuts')
install=arch-package.install
makedepends=('git' 'go' 'bun')
depends=('libnotify')
provides=('go-automate')
conflicts=('go-automate')
options=('!strip')
source=("$pkgname::git+https://github.com/timmo001/go-automate.git")
md5sums=('SKIP')

build() {
  cd "$pkgname"

  # Generate version from git
  local version
  version="$(git describe --long --tags --abbrev=7 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' || printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)")"

  # Build with version injection
  export CGO_ENABLED=0
  go build -v \
    -ldflags="-X 'main.Version=${version}'" \
    -o "go-automate" .

  # Build TUI
  cd tui && bun install && bun build src/index.ts --compile --outfile ../go-automate-tui
  cd ..
}

package() {
  cd "$srcdir/$pkgname"

  # Install binary
  install -Dm755 go-automate "$pkgdir/usr/bin/go-automate"
  install -Dm755 go-automate-tui "$pkgdir/usr/bin/go-automate-tui"
  install -Dm644 .scripts/linux/go-automate-home-assistant-bridge.service "$pkgdir/usr/lib/systemd/user/go-automate-home-assistant-bridge.service"

  # Install license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
