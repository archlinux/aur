# Maintainer: ZorudaRinku <aidan@rain.tech>

pkgname=openchatbox
pkgver=0.0.1
pkgrel=1
pkgdesc="Desktop GUI for sending customized OSC chat messages to VRChat"
arch=('any')
url="https://github.com/ZorudaRinku/OpenChatbox"
license=('MIT')
depends=(
    'python'
    'pyside6'
    'python-psutil'
    'python-websockets'
    'hicolor-icon-theme'
)
makedepends=(
    'python-pip'
    'qt6-base'
    'imagemagick'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "OpenChatbox-$pkgver"

    # Tag is source of truth; rewrite in-tree placeholders.
    sed -i -E "s/^version = .*/version = \"$pkgver\"/" pyproject.toml
    sed -i -E "s/^VERSION = .*/VERSION = \"$pkgver\"/" app.py

    /usr/lib/qt6/rcc -g python resources.qrc -o resources_rc.py

    # Install app source into a staging lib dir. --no-deps keeps pip from
    # pulling in PySide6/psutil/websockets — those come from system packages.
    PYTHONDONTWRITEBYTECODE=1 python -m pip install \
        --target="$srcdir/lib" \
        --no-compile \
        --no-warn-script-location \
        --no-deps \
        .

    # Bundle the three Python deps not available in Arch repos.
    PYTHONDONTWRITEBYTECODE=1 python -m pip install \
        --target="$srcdir/lib" \
        --no-compile \
        --no-warn-script-location \
        'bleak>=3.0' 'python-osc>=1.9' 'tomli_w>=1.2'
}

package() {
    cd "OpenChatbox-$pkgver"

    install -dm755 "$pkgdir/usr/lib/$pkgname"
    cp -a "$srcdir/lib/." "$pkgdir/usr/lib/$pkgname/"
    # pip install --target leaves a `bin/` sidecar we don't use (our launcher is /usr/bin/openchatbox)
    rm -rf "$pkgdir/usr/lib/$pkgname/bin"
    # direct_url.json records the build-time srcdir path — strip it to avoid leaking /tmp paths
    rm -f "$pkgdir/usr/lib/$pkgname/$pkgname-$pkgver.dist-info/direct_url.json"

    install -dm755 "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/$pkgname" <<EOF
#!/bin/sh
exec /usr/bin/python -c "import sys; sys.path.insert(0, '/usr/lib/$pkgname'); from main import main; main()" "\$@"
EOF
    chmod 755 "$pkgdir/usr/bin/$pkgname"

    install -Dm644 openchatbox.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"

    convert OpenChatbox.png -resize 512x512 "$srcdir/openchatbox.png"
    install -Dm644 "$srcdir/openchatbox.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/$pkgname.png"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
