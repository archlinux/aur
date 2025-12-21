# Maintainer: mfw <espadonne@outlook.com>

pkgname=parrot-cli
pkgver=1.8.9
pkgrel=1
pkgdesc='Intelligent roasts of failed commands'
arch=('x86_64')
url='https://github.com/tenseleyFlow/parrot'
license=('MIT')
depends=('bash')
optdepends=('ollama: for local AI backend support'
            'curl: for API backend requests')
makedepends=('go>=1.21' 'make')
provides=('parrot')
conflicts=('parrot-cli-git')
install=parrot-cli.install
source=("git+https://github.com/tenseleyFlow/parrot.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
    cd parrot
    export CGO_ENABLED=0
    export GOOS=linux
    export GOARCH=amd64
    go mod download
    go build -ldflags="-w -s" -o parrot .
}

package() {
    cd parrot
    
    # Install main binary
    install -Dm755 parrot "$pkgdir/usr/bin/parrot"
    
    # Install shell integration hooks
    install -Dm644 parrot-hook.sh "$pkgdir/usr/share/parrot/parrot-hook.sh"
    install -Dm644 parrot-hook.fish "$pkgdir/usr/share/parrot/parrot-hook.fish"

    # Install configuration templates
    install -Dm644 config/parrot.toml.example "$pkgdir/etc/$pkgname/parrot.toml.example"
    
    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    [ -f INSTALLATION_FLOWS.md ] && install -Dm644 INSTALLATION_FLOWS.md "$pkgdir/usr/share/doc/$pkgname/INSTALLATION_FLOWS.md" || true
}