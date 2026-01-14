# Maintainer: Joe S <joe@kitsunehosting.net>

pkgname=kischvidimer-git
pkgver=0
pkgrel=1
pkgdesc="KiCad schematic HTML viewer generator"
arch=('any')
url="https://gitlab.com/dnschneid/kischvidimer"
license=('Apache')
depends=('python' 'python-fonttools')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-setuptools-scm')
provides=('kischvidimer')
conflicts=('kischvidimer')
source=("git+https://gitlab.com/dnschneid/kischvidimer.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/kischvidimer"
  # Try to get version from git describe, fallback to commit hash
  if git describe --long --tags >/dev/null 2>&1; then
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
  else
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  fi
}

build() {
  cd "$srcdir/kischvidimer"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/kischvidimer"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
