# Maintainer: numbpill3d <you@example.com>
pkgname=krux-linkmapper-git
_pkgname=krux-linkmapper
pkgver=0.1.0.r0.g0000000
pkgrel=1
pkgdesc="Terminalcore link mapper — crawl the web as a force-directed 88x31 graph"
arch=('any')
url="https://github.com/numbpill3d/krux-linkmapper"
license=('MIT')
depends=(
  'python'
  'python-fastapi'
  'python-aiohttp'
  'python-pywebview'   # GTK window backend
  'python-gobject'     # pywebview GTK binding
  'webkit2gtk-4.1'    # webview rendering engine
  'uvicorn'            # ASGI server (optional dep of fastapi, required to run krux)
)
makedepends=('git' 'python-build' 'python-installer' 'python-wheel')
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
  # NOTE: this repo has no LICENSE file yet. Copy aur/LICENSE-MIT into the
  # repo as LICENSE and commit it BEFORE publishing, otherwise this line fails.
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
