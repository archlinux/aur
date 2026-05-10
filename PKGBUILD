# Maintainer: Karl McNally <kmcnally@gmail.com>
pkgname=klex
pkgver=0.3.32
pkgrel=1
pkgdesc="FROG: Parallel-first scripting language for batch data processing at scale"
arch=('x86_64' 'aarch64')
url="https://github.com/kmcnally5/FROG"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
provides=('klex')
conflicts=('klex')

source=("git+https://github.com/kmcnally5/FROG.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
    cd "$srcdir/$pkgname"
    go build -o klex .
}

package() {
    cd "$srcdir/$pkgname"

    # Install binary to libexec (not directly in PATH)
    install -Dm755 klex "$pkgdir/usr/lib/klex/klex"

    # Create wrapper script that sets KLEX_PATH for stdlib
    install -Dm755 /dev/stdin "$pkgdir/usr/bin/klex" <<'EOF'
#!/bin/bash
export KLEX_PATH="/usr/share/klex/stdlib"
exec /usr/lib/klex/klex "$@"
EOF

    # Install stdlib
    mkdir -p "$pkgdir/usr/share/klex/stdlib"
    cp stdlib/*.lex "$pkgdir/usr/share/klex/stdlib/"

    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 RELEASE_NOTES.md "$pkgdir/usr/share/doc/$pkgname/RELEASE_NOTES.md"

    # Install examples
    mkdir -p "$pkgdir/usr/share/doc/$pkgname/examples"
    cp -r tests/examples/* "$pkgdir/usr/share/doc/$pkgname/examples/"
}
