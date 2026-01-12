# Maintainer: Ryan Hughes <ryan@ryanrhughes.com>
pkgname=hatchet
pkgver=1.1.1
pkgrel=1
pkgdesc="A TUI for managing work via Fizzy and Git worktrees with automatic database cloning for Rails projects"
install=hatchet.install
arch=('x86_64' 'aarch64')
url="https://github.com/ryanrhughes/hatchet"
license=('MIT')
depends=('fizzy-cli')
makedepends=('bun')
options=('!debug' '!strip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ryanrhughes/hatchet/archive/v$pkgver.tar.gz")
sha256sums=('62e481ebdfab4caaee1ff03e78310379115afa5feaef6eabf7293621a306b049')

build() {
    cd "$pkgname-$pkgver"
    bun install --frozen-lockfile
    bun build src/main.ts --compile --outfile dist/hatchet
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 dist/hatchet "$pkgdir/usr/bin/hatchet"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    
    # Install Chrome extension
    install -d "$pkgdir/usr/share/hatchet/chrome-extension"
    cp -r chrome-extension/* "$pkgdir/usr/share/hatchet/chrome-extension/"
    
    # Install scripts
    install -d "$pkgdir/usr/share/hatchet/scripts"
    install -Dm755 scripts/*.sh "$pkgdir/usr/share/hatchet/scripts/"
}
