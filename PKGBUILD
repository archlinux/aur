# Maintainer: devlinman <dev.linman.tech@gmail.com>

pkgname=procreate-thumbnailer-git
pkgver=1.0.1.r0.g609dd88
pkgrel=1
pkgdesc="Thumbnailer for Procreate (.procreate) files."
arch=('x86_64')
url='https://github.com/devlinman/Procreate-thumbnailer'
license=('MIT')
depends=('shared-mime-info')
makedepends=('cargo' 'git' 'rust')
source=("git+https://github.com/devlinman/Procreate-thumbnailer.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/Procreate-thumbnailer"

    # If there are git tags, use them; otherwise fallback to commit hash
    if git describe --tags --long >/dev/null 2>&1; then
        git describe --tags --long | sed 's/^v//;s/-/.r/;s/-/./'
    else
        echo "1.0.1.r0.g$(git rev-parse --short HEAD)"
    fi
}

build() {
    cd "$srcdir/Procreate-thumbnailer"
    echo ">>> Building Rust binary..."
    cargo build --release
}

package() {
    cd "$srcdir/Procreate-thumbnailer"

    # Binary
    install -Dm755 "target/release/procreate-thumbnailer" \
        "$pkgdir/usr/bin/procreate-thumbnailer"

    # Thumbnailer definition
    install -Dm644 "procreate.thumbnailer" \
        "$pkgdir/usr/share/thumbnailers/procreate.thumbnailer"

    # MIME definition
    install -Dm644 "procreate.xml" \
        "$pkgdir/usr/share/mime/packages/procreate.xml"

    # License (if present)
    install -Dm644 LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE" 2>/dev/null || true
}
