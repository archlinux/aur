pkgname=anna-git
gitname=annas-archive-cli
pkgver=0.2.0rc4.r0
pkgrel=1
pkgdesc="anna's archive cli"
arch=(any)
url=https://github.com/meurz/$gitname
license=(MIT)
depends=(
  python-beautifulsoup4
  python-click
  python-httpx
  python-socksio
)
makedepends=(
  git
  python-build
  python-hatchling
  python-installer
)
checkdepends=(
  python-pytest
)
source=("git+$url.git")
sha256sums=('SKIP')
pkgver() {
  cd "$srcdir/$gitname"
  local version
  if version=$(git describe --tags --long 2>/dev/null); then
    # upstream tags are fixed
    printf '%s\n' "${version#v}" | sed 's/-/.r/;s/-/./'
  else
    # upstream tags are still broken
    printf '0.2.0rc4.r%s\n' \
      "$(git rev-list --count 001ab3250e9cd829e7225b6385e3fb8aac999090..HEAD)"
  fi
}
build() {
  cd "$srcdir/$gitname"
  python -m build --wheel --no-isolation
}
check() {
  cd "$srcdir/$gitname"
  PYTHONPATH="$PWD/src" python -m pytest -q
}
package() {
  cd "$srcdir/$gitname"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
