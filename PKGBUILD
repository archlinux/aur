# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

_name=stack_data
pkgname=python38-stack-data
pkgver=0.6.1
pkgrel=1
pkgdesc='Extract data from python stack frames and tracebacks for informative displays'
arch=('any')
url=https://github.com/alexmojaki/stack_data
license=('MIT')
depends=('python38-asttokens' 'python38-executing' 'python38-pure-eval')
makedepends=('python38-build' 'python38-installer' 'python38-setuptools-scm'
             'python38-wheel')
checkdepends=('cython' 'python38-littleutils' 'python38-pygments' 'python38-pytest'
              'python38-typeguard')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('6c9a10eb5f342415fe085db551d673955611afb821551f554d91772415464315')
b2sums=('50b8b69d30504035d210c8276be88339a3261c66ea948dc64456c39d982c920e211df5f85b7db8b9931d754b0e64d0ca3d26f9c3edad3652139095faa4f8a183')

build() {
  cd "$_name-$pkgver"
  python3.8 -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd "$_name-$pkgver"
  python3.8 -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest
}

package() {
  cd "$_name-$pkgver"
  python3.8 -m installer --destdir="$pkgdir" dist/*.whl

  # Symlink license file
  local site_packages=$(python3.8 -m "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s "$site_packages"/$_name-$pkgver.dist-info/LICENSE.txt \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
}
