# Maintainer: Gheat <admin@gheat.net>
pkgname=tuistore
pkgver=0.4.3
pkgrel=1
pkgdesc="TUI app store — browse, search, and one-key-install terminal apps"
arch=('any')
url="https://github.com/Gheat1/tuistore"
license=('GPL-3.0-or-later')
depends=('python')
makedepends=('uv')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Gheat1/tuistore/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b2be71b0c34b8a3b3dd569a48c5b4f968c0d932aa0aaf01a33c8b3e37b75012b')

# tuistore and ricekit are both on PyPI now, but neither is packaged for
# Arch — a private venv is the simplest correct way to satisfy the
# dependency without re-packaging ricekit separately.
package() {
    cd "$pkgname-$pkgver"

    install -d "$pkgdir/opt/$pkgname"
    uv venv --python python3 "$pkgdir/opt/$pkgname/venv"
    uv pip install --python "$pkgdir/opt/$pkgname/venv/bin/python" .

    # invoke the venv's python directly (-m) rather than relying on the
    # auto-generated entry-point script, whose shebang bakes in the
    # build-time $pkgdir staging path and would break once installed
    install -d "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/$pkgname" <<'EOF'
#!/bin/sh
exec /opt/tuistore/venv/bin/python -m tuistore "$@"
EOF
    chmod 755 "$pkgdir/usr/bin/$pkgname"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
