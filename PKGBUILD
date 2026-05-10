# Maintainer: lucilf3r <ahmedalnanga@gmail.com>
pkgname=canto-git
pkgver=r1.0000000
pkgrel=1
pkgdesc="EPUB reader with offline TTS and Spotify-style lyrics view"
arch=('any')
url="https://github.com/lucilf3r/canto"
license=('MIT')
depends=('python' 'pyside6' 'python-numpy' 'python-pillow'
         'python-beautifulsoup4' 'python-lxml' 'fontconfig')
makedepends=('git' 'python-pip')
optdepends=('xdg-utils: open with support')
install=canto.install
provides=('canto')
conflicts=('canto')
source=("$pkgname::git+https://github.com/lucilf3r/canto.git"
        "https://github.com/thewh1teagle/kokoro-onnx/releases/download/model-files/kokoro-v0_19.onnx"
        "https://github.com/thewh1teagle/kokoro-onnx/releases/download/model-files/voices.bin")
sha256sums=('SKIP' 'SKIP' 'SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$pkgname"
    python -m venv --system-site-packages .venv
    .venv/bin/pip install --quiet \
        kokoro-onnx \
        ebooklib \
        sounddevice \
        onnxruntime
}

package() {
    cd "$pkgname"

    # App files
    install -dm755 "$pkgdir/opt/canto"
    cp -r . "$pkgdir/opt/canto/"

    # Kokoro model files
    install -Dm644 "$srcdir/kokoro-v0_19.onnx" "$pkgdir/opt/canto/models/kokoro-v0_19.onnx"
    install -Dm644 "$srcdir/voices.bin"         "$pkgdir/opt/canto/models/voices.bin"

    # Launcher script
    install -dm755 "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/canto" <<'EOF'
#!/bin/sh
exec /opt/canto/.venv/bin/python /opt/canto/main.py "$@"
EOF
    chmod +x "$pkgdir/usr/bin/canto"

    # Desktop entry
    install -Dm644 canto.desktop \
        "$pkgdir/usr/share/applications/canto.desktop"

    # MIME association for .epub files
    install -dm755 "$pkgdir/usr/share/mime/packages"
    cat > "$pkgdir/usr/share/mime/packages/canto.xml" <<'EOF'
<?xml version="1.0" encoding="UTF-8"?>
<mime-info xmlns="http://www.freedesktop.org/standards/shared-mime-info">
  <mime-type type="application/epub+zip">
    <glob pattern="*.epub"/>
  </mime-type>
</mime-info>
EOF
}
