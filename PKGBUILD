# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=fawkes-git
pkgver=0.3.r27.gaedaa82
pkgrel=1
pkgdesc="Image cloaking tool for personal privacy"
arch=('any')
url="https://sandlab.cs.uchicago.edu/fawkes/"
license=('BSD')
depends=('python' 'python-bleach' 'python-keras' 'python-mtcnn' 'python-numpy' 'python-pillow' 'python-scikit-image' 'python-tensorflow')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel')
provides=("fawkes=$pkgver")
conflicts=('fawkes')
source=("git+https://github.com/Shawn-Shan/fawkes.git")
sha256sums=('SKIP')


pkgver() {
  cd "fawkes"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "fawkes"

  python \
    -m build \
    --wheel \
    --no-isolation
}

package() {
  cd "fawkes"

  python \
    -m installer \
    --destdir="$pkgdir" \
    dist/*.whl
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/fawkes"
}
