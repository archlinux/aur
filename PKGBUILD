pkgname=sfnx
pkgver=0.0.2
pkgrel=6
pkgdesc="A minimal terminal-based password manager"
arch=('x86_64')
url="https://github.com/themohitnair/sfnx"
license=('MIT')
depends=('python')
makedepends=('python-pip' 'python-poetry')
source=("git+https://github.com/themohitnair/sfnx.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    echo $(grep '^version =' pyproject.toml | cut -d'"' -f2)
}

build() {
    cd "$srcdir/$pkgname"
    poetry build
}

package() {
    cd "$srcdir/$pkgname"
    python -m venv "$pkgdir/opt/$pkgname"
    
    # Install the package wheel
    "$pkgdir/opt/$pkgname/bin/pip" install --no-deps dist/*.whl
    
    # Manually install dependencies from pyproject.toml
    "$pkgdir/opt/$pkgname/bin/pip" install -r <(poetry export --without-hashes)

    install -Dm755 /dev/null "$pkgdir/usr/bin/$pkgname"
    cat > "$pkgdir/usr/bin/$pkgname" << EOF
#!/bin/sh
exec /opt/$pkgname/bin/python -m sfnx "\$@"
EOF

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}