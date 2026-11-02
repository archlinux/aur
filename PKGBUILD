# Maintainer: Smoolak <smoolak@gmail.com>
pkgname=python-einops-exts
pkgver=0.0.4
pkgrel=1
pkgdesc='Einops helpers for tensor lists, anonymous dimensions and PyTorch modules'
arch=(any)
url='https://github.com/lucidrains/einops-exts'
license=(MIT)
# PyTorch is imported unconditionally upstream but omitted from install_requires.
# The generic dependency accepts both official CPU and CUDA providers.
depends=(python 'python-einops>=0.4' python-pytorch)
makedepends=(python-build python-installer python-setuptools python-wheel)
_commit=a61d8d5c0ba10b6d9386b924177f528799627924
source=("einops-exts-$pkgver.tar.gz::$url/archive/$_commit.tar.gz"
        packaging-check.py)
sha256sums=('a2263fb03533a75e80f6e22cf4e98357990acedc96c6d4e95bd2ea3b0fb49eac'
            '8835a5909ef812daeaf81df342a0d808c76c571b62eb70d372cd256b0d35d8b1')

build() {
  cd "einops-exts-$_commit"
  python -m build --wheel --no-isolation
}

check() {
  cd "einops-exts-$_commit"
  # Upstream 0.0.4 publishes no test suite. These packaging checks exercise the
  # built wheel's tensor helpers, shape errors, module wrapper and gradients.
  python -m installer --destdir="$srcdir/check" dist/*.whl
  local site_packages=("$srcdir"/check/usr/lib/python*/site-packages)
  python -I "$srcdir/packaging-check.py" "${site_packages[0]}"
}

package() {
  cd "einops-exts-$_commit"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
