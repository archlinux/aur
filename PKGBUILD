# Maintainer: Danny Waser <danny@waser.tech>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Ashwin Vishnu <ashwinvis+arch at pr0t0nm4il dot com>
# Contributor: Specter119 <specter119 AT gmail DOT com>
# Contributor: xantares

pkgname=python38-ipyparallel
_pyname=${pkgname#python38-}
pkgver=8.4.1
pkgrel=1
pkgdesc='Interactive Parallel Computing in Python'
url='https://pypi.org/project/ipyparallel/'
arch=(any)
license=(BSD)
source=(https://files.pythonhosted.org/packages/source/${_pyname::1}/$_pyname/$_pyname-$pkgver.tar.gz)
depends=(jupyterlab python38-psutil)
makedepends=(python38-build python38-installer python38-hatchling)
checkdepends=(python38-pytest-tornado python38-pytest-asyncio python38-tqdm)
optdepends=('openmpi: to use the MPI Launchers in ipcluster command')
sha256sums=('670bbe05755381742e1ea01177dc428ff8f3e94af1f0d5642c9d19f37ca8289b')

build() {
  cd $_pyname-$pkgver
  IPP_DISABLE_JS=1 \
  python3.8 -m build --wheel --no-isolation
}

check() {
  cd $_pyname-$pkgver
  python3.8 -m installer --destdir=test_install dist/*.whl
  PYTHONPATH="$PWD"/test_install/`python3.8 -m "from sysconfig import get_path; print(get_path('platlib'))"` \
  pytest -v -k 'not test_local_ip_true_doesnt_trigger_warning' -W ignore::DeprecationWarning
}

package() {
  cd $_pyname-$pkgver
  python3.8 -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 COPYING.md "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  mv "$pkgdir"/{usr/,}etc
}
