# Maintainer: numbpill3d <you@example.com>
pkgname=bloodstream-git
_pkgname=bloodstream
pkgver=0.1.0.r0.g0000000
pkgrel=1
pkgdesc="Animated /proc/net/dev bandwidth vein monitor for the terminal"
arch=('any')
url="https://github.com/numbpill3d/bloodstream"
license=('MIT')
depends=('python' 'python-rich' 'python-typer')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("git+https://github.com/numbpill3d/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  local out
  out=$(git describe --long --tags --abbrev=7 2>/dev/null) || out=""
  if [ -n "$out" ]; then
    echo "$out" | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
  else
    printf '0.1.0.r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  fi
}

build() {
  cd "$_pkgname"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
