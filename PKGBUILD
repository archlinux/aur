# Maintainer: lucilf3r <ahmedalnanga@gmail.com>
pkgname=canto-git
pkgver=1.0
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
source=("$pkgname::git+https://github.com/lucilf3r/canto.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --tags --long 2>/dev/null \
        | sed 's/^v//;s/\([^-]*\)-\([0-9]*\)-g.*/\1.r\2/' \
        || printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$pkgname"
    python -m venv --system-site-packages .venv
    .venv/bin/pip install --quiet \
        kokoro-onnx \
        ebooklib \
        sounddevice \
        onnxruntime

    mkdir -p models
    if [ ! -f models/kokoro-v0_19.onnx ]; then
        wget -q -O models/kokoro-v0_19.onnx \
            "https://github.com/thewh1teagle/kokoro-onnx/releases/download/model-files/kokoro-v0_19.onnx"
    fi
    if [ ! -f models/voices.bin ]; then
        wget -q -O models/voices.bin \
            "https://github.com/thewh1teagle/kokoro-onnx/releases/download/model-files/voices.bin"
    fi
}

package() {
    cd "$pkgname"

    # App files
    install -dm755 "$pkgdir/opt/canto"
    cp -r . "$pkgdir/opt/canto/"

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
