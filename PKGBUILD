# Maintainer: moss-ai fleet <noreply@paperclip.ing>
pkgname=moss-ai
pkgver=0.1.0
pkgrel=1
pkgdesc="Non-LLM brain-inspired AI: neuroevolution, SNN, few-shot learning, continual learning"
arch=('any')
url="https://gitlab.com/Bingusfan360/moss-ai"
license=('MIT')
depends=('python' 'python-numpy' 'python-torch')
optdepends=('ollama: for serving layer and LLM conversation partner')
makedepends=('python-setuptools')
source=("git+https://gitlab.com/Bingusfan360/moss-ai.git")
sha256sums=('SKIP')

build() {
    cd "$srcdir/moss-ai"
    python -m build --wheel --no-isolation 2>/dev/null || true
}

package() {
    cd "$srcdir/moss-ai"
    # Install Python package
    python -m installer --destdir="$pkgdir" dist/*.whl 2>/dev/null || \
    python setup.py install --root="$pkgdir" --optimize=1 2>/dev/null || \
    (mkdir -p "$pkgdir/usr/lib/python3/dist-packages/mossai" && \
     cp -r mossai/* "$pkgdir/usr/lib/python3/dist-packages/mossai/" && \
     cp -r engine "$pkgdir/usr/lib/python3/dist-packages/" 2>/dev/null)

    # Install CLI entry points
    install -Dm755 "$srcdir/moss-ai/scripts/llm_conversation.py" \
        "$pkgdir/usr/bin/moss-ai-llm-conversation"

    # Install documentation
    install -Dm644 "$srcdir/moss-ai/README.md" \
        "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 "$srcdir/moss-ai/AGENTS.md" \
        "$pkgdir/usr/share/doc/$pkgname/AGENTS.md"

    # Install license
    install -Dm644 "$srcdir/moss-ai/LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE" 2>/dev/null || true
}