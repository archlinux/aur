pkgname=sfnx
pkgver=0.0.1
pkgrel=2
pkgdesc="A minimal terminal-based password manager"
arch=('x86_64')
url="https://github.com/themohitnair/sfnx"
license=('MIT')
depends=('python' 'python-cryptography' 'python-sqlmodel' 'python-typer' 'python-rich' 'python-pyperclip' 'python-argon2-cffi')
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
    
    # Install dependencies
    "$pkgdir/opt/$pkgname/bin/pip" install cryptography sqlmodel typer rich pyperclip argon2-cffi
    
    # Create the bin directory if it doesn't exist
    mkdir -p "$pkgdir/usr/bin"
    
    # Create the executable script
    cat > "$pkgdir/usr/bin/$pkgname" << EOF
#!/bin/sh
export PYTHONPATH="/opt/$pkgname/lib/python$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')/site-packages:$PYTHONPATH"
exec /opt/$pkgname/bin/python -m sfnx "\$@"
EOF
    
    chmod +x "$pkgdir/usr/bin/$pkgname"
    
    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}