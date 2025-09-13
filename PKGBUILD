# Maintainer: mfw <espadonne@outlook.com>

pkgname=parrot-cli
pkgver=1.3.0
pkgrel=2
pkgdesc='Intelligent CLI command failure assistant with AI-powered responses'
arch=('x86_64')
url='https://github.com/tenseleyFlow/parrot'
license=('MIT')
depends=('bash')
optdepends=('ollama: for local AI backend support'
            'curl: for API backend requests')
makedepends=('go>=1.21' 'make')
provides=('parrot')
conflicts=('parrot-cli-git')
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
    install -Dm644 parrot-hook.sh "$pkgdir/usr/share/$pkgname/parrot-hook.sh"
    
    # Install configuration templates
    install -Dm644 config/parrot.toml.example "$pkgdir/etc/$pkgname/parrot.toml.example"
    
    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    [ -f INSTALLATION_FLOWS.md ] && install -Dm644 INSTALLATION_FLOWS.md "$pkgdir/usr/share/doc/$pkgname/INSTALLATION_FLOWS.md" || true
}

post_install() {
    echo "🦜 Parrot has been installed successfully!"
    echo ""
    
    # Check if Ollama is available for automatic setup
    if command -v ollama >/dev/null 2>&1; then
        echo "🤖 Ollama detected - setting up local AI backend..."
        
        # Pull the model in background if not already present
        if ! ollama list | grep -q "llama3.2:3b"; then
            echo "📥 Downloading AI model (this may take a few minutes)..."
            echo "   You can continue using your terminal - parrot will work when ready"
            (ollama pull llama3.2:3b >/dev/null 2>&1 && echo "✅ AI model ready!" || echo "❌ Model download failed") &
        else
            echo "✅ AI model already available"
        fi
        echo ""
    else
        echo "🔄 Using built-in responses (no setup required)"
        echo ""
        echo "For AI-powered responses, install Ollama:"
        echo "  https://ollama.com/download"
        echo ""
    fi
    
    echo "🚀 NEXT STEP: Run this command to enable shell integration:"
    echo "    parrot install"
    echo ""
    echo "💡 This adds smart command failure detection to your shell"
    echo "   After running it, failed commands will trigger helpful responses!"
    echo ""
    echo "📖 For more options, run: parrot --help"
}