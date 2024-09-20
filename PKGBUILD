pkgname=sfnx
pkgver=0.0.2
pkgrel=3
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
    "$pkgdir/opt/$pkgname/bin/pip" install --no-deps dist/*.whl
    "$pkgdir/opt/$pkgname/bin/pip" install -r <(poetry export --format requirements.txt)

    install -Dm755 /dev/null "$pkgdir/usr/bin/$pkgname"
    cat > "$pkgdir/usr/bin/$pkgname" << EOF
#!/bin/sh
exec /opt/$pkgname/bin/python -m sfnx "\$@"
EOF

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}