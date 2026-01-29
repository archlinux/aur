# Maintainer: afkdev8 <mail@afkdev8.com>
pkgname=qrcode-pretty
pkgver=1.0.3
pkgrel=1
pkgdesc="A tool which generates pretty QR codes"
arch=('any')
url="https://github.com/mrinfinidy/qrcode-pretty"
license=('MIT')
depends=('python' 'python-qrcode' 'python-pillow')
makedepends=('git' 'python-build' 'python-installer' 'python-hatchling')
source=("git+https://github.com/mrinfinidy/qrcode-pretty.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  # Use version from pyproject.toml or fallback to git describe
  git describe --tags 2>/dev/null | sed 's/^v//;s/-/./g' ||
    python -c "import tomllib; print(tomllib.load(open('pyproject.toml', 'rb'))['project']['version'])"
}

build() {
  cd "$srcdir/$pkgname"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 assets/default.png "$pkgdir/usr/share/$pkgname/assets/default.png"

  install -d "$pkgdir/usr/lib/$pkgname"
  mv "$pkgdir/usr/bin/$pkgname" "$pkgdir/usr/lib/$pkgname/$pkgname-real"

  cat >"$pkgdir/usr/bin/$pkgname" <<'EOF'
#!/bin/sh
export DEFAULT_IMAGE="${DEFAULT_IMAGE:-/usr/share/qrcode-pretty/assets/default.png}"
exec /usr/lib/qrcode-pretty/qrcode-pretty-real "$@"
EOF
  chmod 755 "$pkgdir/usr/bin/$pkgname"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
