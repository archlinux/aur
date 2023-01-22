# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-pytest-black
pkgver=0.3.12
pkgrel=6
pkgdesc="A pytest plugin to enable format checking with black"
arch=('any')
license=('MIT')
url="https://github.com/shopkeep/pytest-black/"
depends=('python-black' 'python-pytest' 'python-toml')
makedepends=('python-setuptools-scm')
source=("$pkgname-$pkgver.tar.gz::https://github.com/shopkeep/pytest-black/archive/$pkgver.tar.gz"
        $pkgname-pytest6.patch::https://github.com/shopkeep/pytest-black/pull/53.patch)
sha512sums=('1576761c9a93e6a05d5f1d40200e228791a67ac33f437330940ccbb898121df22814a794858b36de9223d4cc45d58fcbefaa08c87275f36e04901cb4cd217760'
            '362176d305114dc1f6389144ab8feed5a1e48827bef4d07b241accfa5a257ba8189dbbe4c320ae458a47cd067541d53d2ae0b66688b5fcdd698f31ac3df62d19')

export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver

prepare() {
  cd pytest-black-$pkgver
  patch -Np1 -i ../$pkgname-pytest6.patch
}

build() {
  cd pytest-black-$pkgver
  python setup.py build
}

check() {
  # Hack entry points by installing it

  cd pytest-black-$pkgver
  python setup.py install --root="$PWD/tmp_install" --optimize=1
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  PYTHONPATH="$PWD/tmp_install/$site_packages:$PYTHONPATH:$PWD/tests" py.test
}

package() {
  cd pytest-black-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
