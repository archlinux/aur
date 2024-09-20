pkgname=sfnx
pkgver=0.0.1
pkgrel=1
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

  "$pkgdir/opt/$pkgname/bin/pip" install cryptography sqlmodel typer rich pyperclip argon2-cffi

  mkdir -p "$pkgdir/usr/bin"
  echo '#!/bin/sh' > "$pkgdir/usr/bin/$pkgname"
  echo "exec /opt/$pkgname/bin/python -m $pkgname \"\$@\"" >> "$pkgdir/usr/bin/$pkgname"
  chmod +x "$pkgdir/usr/bin/$pkgname"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}