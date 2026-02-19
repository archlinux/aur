# Maintainer: Ashley <info@meisgaming.net>
pkgname=cowtotext
pkgver=1.0.0
pkgrel=5
pkgdesc="Real-time audio transcription and translation tool using Whisper and Argos Translate"
arch=('x86_64')
url="https://github.com/MeIsGaming/cow-to-text"
license=('MIT')
depends=('python311' 'ffmpeg' 'libpulse')
makedepends=('git')
optdepends=('cuda: For GPU acceleration')
source=("git+${url}.git#branch=main")
sha256sums=('SKIP')

build() {
    cd cow-to-text

    # Build wheel
    python -m build --wheel --no-isolation
}

package() {
    cd cow-to-text

    # Create isolated Python 3.11 runtime environment
    python3.11 -m venv "$pkgdir/usr/lib/cowtotext/venv"

    # Install app and all runtime dependencies into the bundled venv
    "$pkgdir/usr/lib/cowtotext/venv/bin/pip" install \
        --no-cache-dir \
        --disable-pip-version-check \
        dist/*.whl

    # Ensure launcher uses bundled dependencies
    install -dm755 "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/cowtotext" << 'EOF'
#!/bin/sh
exec /usr/lib/cowtotext/venv/bin/python -m cowtotext_main "$@"
EOF
    chmod 755 "$pkgdir/usr/bin/cowtotext"
    
    # Install license and docs
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/${pkgname}/README.md"
}
