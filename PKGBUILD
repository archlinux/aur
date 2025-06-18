# Maintainer: kamisaki
# Description: Better last command interface with structured output.

pkgname=lastf
pkgver=1.0.0
pkgrel=1
pkgdesc="Better last command interface with structured output."
arch=('x86_64')
license=('GPL3')
depends=()
makedepends=('python' 'python-virtualenv' 'clang')
source=("https://github.com/xeyossr/lastf/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$srcdir/$pkgname-$pkgver"

    DIST_DIR="${pkgname}.dist"

    python -m venv .venv

    .venv/bin/pip install --upgrade pip
    .venv/bin/pip install nuitka

    if [[ -f requirements.txt ]]; then
        .venv/bin/pip install -r requirements.txt
    fi

    .venv/bin/python -m nuitka \
        --standalone \
        --enable-plugin=pylint-warnings \
        --lto=yes \
        --clang \
        --jobs=4 \
        "${pkgname}.py"
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    INSTALL_DIR="$pkgdir/usr/lib/$pkgname"
    LAUNCHER_PATH="$pkgdir/usr/bin/$pkgname"

    install -dm755 "$INSTALL_DIR"
    cp -r "${pkgname}.dist/"* "$INSTALL_DIR/"

    install -dm755 "$(dirname "$LAUNCHER_PATH")"
    cat > "$LAUNCHER_PATH" <<EOF
#!/usr/bin/env bash
exec /usr/lib/$pkgname/${pkgname}.bin "\$@"
EOF
    chmod +x "$LAUNCHER_PATH"
}

