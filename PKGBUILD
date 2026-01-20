# Maintainer: mithrel <imithrellas@gmail.com>

# This is a -git style PKGBUILD meant for AUR packaging.
# It builds ginkgo-cli, ginkgo-lsp(language server for tag completion in code editors)
# and installs the user service + man pages.

pkgname=ginkgo-cli
pkgver=0.4.0
pkgrel=1
pkgdesc="Local-first journaling CLI with daemon, search, and sync"
arch=('x86_64' 'aarch64')
url="https://github.com/iMithrellas/GinkGo"
license=('WTFPL')
depends=('glibc')
makedepends=('go')
keywords=('journal' 'notes' 'cli' 'tui' 'jrnl')
optdepends=(
  'systemd: user service for ginkgod'
)

source=("https://github.com/iMithrellas/GinkGo/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e22679415ca073ce04c551b0c2f79653701140da232a2803a769a176f233cc94')

build() {
  cd "$srcdir/GinkGo-$pkgver"
  export CGO_ENABLED=0
  go build -trimpath -ldflags "-s -w" -o build/ginkgo-lsp ./cmd/ginkgo-lsp
  go build -trimpath -ldflags "-s -w" -o build/ginkgo-cli ./cmd/ginkgo-cli
}

package() {
  cd "$srcdir/GinkGo-$pkgver"

  # Install binaries (ginkgod is a symlink to ginkgo-cli).
  install -Dm755 build/ginkgo-cli "$pkgdir/usr/bin/ginkgo-cli"
  install -Dm755 build/ginkgo-lsp "$pkgdir/usr/bin/ginkgo-lsp"
  ln -sf ginkgo-cli "$pkgdir/usr/bin/ginkgod"

  # Install man pages (pre-generated in docs/man).
  install -d "$pkgdir/usr/share/man/man1"
  for f in docs/man/*.1; do
    install -Dm644 "$f" "$pkgdir/usr/share/man/man1/$(basename "$f")"
  done
  gzip -9 "$pkgdir/usr/share/man/man1/"*.1

  # Install the systemd user service.
  install -Dm644 systemd/ginkgo.service "$pkgdir/usr/lib/systemd/user/ginkgo.service"

  # License.
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
