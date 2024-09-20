pkgname=sfnx
pkgver=0.0.2
pkgrel=2
pkgdesc="A minimal terminal-based password manager"
arch=('x86_64')
url="https://github.com/themohitnair/sfnx"
license=('MIT')
depends=('python' 'python-cryptography' 'python-sqlmodel' 'python-typer' 'python-rich' 'python-pyperclip' 'python-argon2-cffi')
makedepends=('python-pip' 'python-build' 'python-installer' 'python-wheel')
source=("git+https://github.com/themohitnair/sfnx.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    echo $(grep '^version =' pyproject.toml | cut -d'"' -f2)
}

build() {
    cd "$srcdir/$pkgname"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$pkgname"
    python -m venv --system-site-packages "$pkgdir/opt/$pkgname"
    "$pkgdir/opt/$pkgname/bin/pip" install --no-deps dist/*.whl

    # Create the executable script
    install -Dm755 /dev/null "$pkgdir/usr/bin/$pkgname"
    cat > "$pkgdir/usr/bin/$pkgname" << EOF
#!/bin/sh
exec /opt/$pkgname/bin/python -m sfnx "\$@"
EOF

    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}