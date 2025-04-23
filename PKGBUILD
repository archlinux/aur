# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=cython-git
pkgver=3.0.12.r813.g7687821df
pkgrel=1
pkgdesc="C-Extensions for Python"
arch=('i686' 'x86_64')
url="https://cython.org/"
license=('Apache-2.0')
depends=('python')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('gdb' 'python-numpy' 'python-pytest' 'python-tests')
provides=("cython=$pkgver")
conflicts=('cython')
source=("git+https://github.com/cython/cython.git")
sha256sums=('SKIP')


pkgver() {
  cd "cython"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "cython"

  python \
    -m build \
    --wheel \
    --no-isolation
}

check() {
  cd "cython"

  #make \
  #  test \
  #  --no-pyregr
}

package() {
  cd "cython"

  python \
    -m installer \
    --destdir="$pkgdir" \
    dist/*.whl

  for f in cygdb cython cythonize; do
    mv "$pkgdir/usr/bin/$f" "$pkgdir/usr/bin/${f}3"
    ln -s "${f}3" "$pkgdir/usr/bin/$f"
  done
}
