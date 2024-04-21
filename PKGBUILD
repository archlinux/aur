# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgbase=brotli-git
pkgname=('brotli-git' 'python-brotli-git')
pkgver=1.1.0.r65.g1b3a5cc
pkgrel=1
pkgdesc="Brotli compression library"
arch=('i686' 'x86_64')
url="https://github.com/google/brotli"
license=('MIT')
makedepends=('git' 'cmake' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("git+https://github.com/google/brotli.git")
sha256sums=('SKIP')


pkgver() {
  cd "brotli"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "brotli"

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    ./
  cmake --build "_build"

  python \
    -m build \
    --wheel \
    --no-isolation
}

check() {
  cd "brotli"

  #cmake --build "_build" --target test
}

package_brotli-git() {
  depends=('glibc')
  provides=("brotli=$pkgver" 'libbrotlicommon.so' 'libbrotlidec.so' 'libbrotlienc.so')
  conflicts=('brotli')

  cd "brotli"

  DESTDIR="$pkgdir" cmake --install "_build"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/brotli"
}

package_python-brotli-git() {
  depends=('python')
  provides=("python-brotli=$pkgver")
  conflicts=('python-brotli')

  cd "brotli"

  python \
    -m installer \
    --destdir="$pkgdir" \
    dist/*.whl
}
