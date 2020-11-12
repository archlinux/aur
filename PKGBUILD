# Maintainer: David Runge <dvzrv@archlinux.org>

_name=pytest-helpers-namespace
pkgname=python-pytest-helpers-namespace
pkgver=2019.1.8
pkgrel=3
pkgdesc="PyTest Helpers Namespace"
arch=('any')
url="https://github.com/saltstack/pytest-helpers-namespace"
license=('Apache')
depends=('python-pytest')
makedepends=('git' 'python-setuptools')
checkdepends=('python-pytest' 'python-pytest-forked')
source=("git+https://github.com/saltstack/pytest-helpers-namespace#tag=v${pkgver}?signed")
sha512sums=('SKIP')
validpgpkeys=('D2908FB3A823B0FAB3BD21F5BB36BF6584A298FF') # Pedro Algarvio (s0undt3ch) <pedro@algarvio.me>

prepare() {
  mv -v "${_name}" "$pkgname-$pkgver"
}

build() {
  cd "$pkgname-$pkgver"
  python setup.py build
}

check() {
  cd "$pkgname-$pkgver"
  # installing into test location, so pytest can pick up the extension
  mkdir -vp test_dir
  python setup.py install --skip-build \
    --optimize=1 \
    --prefix=/usr \
    --root="test_dir"
  local python_version="$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')"
  export PYTHONPATH="test_dir/usr/lib/python${python_version}/site-packages/:${PYTHONPATH}"
  pytest -v --forked
}

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --skip-build \
    --optimize=1 \
    --prefix=/usr \
    --root="${pkgdir}"
  install -vDm 644 {AUTHORS,README}.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
}
