# Maintainer: synthforged <synthforged at proton dot me>
pkgname=vent
pkgver=1.0.1
pkgrel=1
pkgdesc='Voice-to-text overlay for Wayland'
arch=('x86_64')
url='https://github.com/synthforged/vent'
license=('MIT')
depends=(
    'python>=3.11'
    'gtk4'
    'gtk4-layer-shell'
    'gobject-introspection'
    'cairo'
    'portaudio'
    'wtype'
    'wl-clipboard'
    'python-gobject'
    'python-numpy'
)
makedepends=('python-pip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    python -m venv --system-site-packages "$srcdir/venv"
    "$srcdir/venv/bin/pip" install --no-cache-dir "$srcdir/$pkgname-$pkgver"
}

package() {
    # Install venv to /opt
    install -dm755 "$pkgdir/opt/$pkgname"
    cp -a "$srcdir/venv/"* "$pkgdir/opt/$pkgname/"

    # Fix hardcoded build paths in shebangs and configs
    find "$pkgdir/opt/$pkgname/bin" -type f -exec \
        sed -i "s|$srcdir/venv|/opt/$pkgname|g" {} +
    sed -i "s|$srcdir/venv|/opt/$pkgname|g" \
        "$pkgdir/opt/$pkgname/pyvenv.cfg" 2>/dev/null || true

    # Wrapper script
    install -dm755 "$pkgdir/usr/bin"
    printf '#!/usr/bin/env bash\nexec /opt/%s/bin/%s "$@"\n' \
        "$pkgname" "$pkgname" > "$pkgdir/usr/bin/$pkgname"
    chmod 755 "$pkgdir/usr/bin/$pkgname"

    # License
    install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
