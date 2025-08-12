# Maintainer: Benjamin Hammond <benjaminphammond@gmail.com>
pkgname=org
pkgver=0.1.0
pkgrel=1
pkgdesc="Suckless second-brain CLI tool"
arch=('any')
url="https://github.com/benjaminingreens/org"
license=('AGPL3')
depends=('python')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("git+$url#tag=v$pkgver")
sha256sums=('SKIP')

prepare() {
  cd "$srcdir/$pkgname"
  # Strip install_requires to avoid networked pip installs at build time (AUR policy)
  if grep -q "install_requires\s*=" setup.py 2>/dev/null; then
    sed -i '/install_requires\s*=\s*\[/,/\],/d' setup.py
  fi
}

build() {
  cd "$srcdir/$pkgname"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  for f in README README.md; do
    [[ -f "$f" ]] && install -Dm644 "$f" "$pkgdir/usr/share/doc/$pkgname/$f"
  done
}
