# Maintainer: RiverOnVenus <aur@zhui.dev>
# Contributor: YeahSure <lapdogpdx.yahoo.com>
pkgname=colout-git
pkgver=1.1.r7.g6a8fe89
pkgrel=1
pkgdesc="Reads text on stdin and produces colorized and stylized output"
arch=('any')
url="https://github.com/nojhan/colout"
license=('GPL-3.0-or-later')
depends=('python' 'python-pygments' 'python-babel')
makedepends=('git' 'python-setuptools-scm' 'python-build' 'python-installer' 'python-wheel')
provides=('colout')
conflicts=('colout')
source=("$pkgname::git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  (
    set -o pipefail
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/-/.r/;s/-/./' \
      || printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

prepare() {
  cd $pkgname
  git clean -dfx
}

build() {
  cd $pkgname
  python -m build --wheel --no-isolation
}

package() {
  cd $pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: set ts=2 sw=2 et:
