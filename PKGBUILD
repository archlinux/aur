# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python38-pytest-enabler
pkgver=1.3.0
pkgrel=2
pkgdesc='Enable installed pytest plugins'
arch=('any')
license=('MIT')
url='https://github.com/jaraco/pytest-enabler'
depends=('python38-jaraco.context' 'python38-jaraco.functools' 'python38-pytest' 'python38-toml')
makedepends=('python38-build' 'python38-installer' 'python38-setuptools-scm' 'python38-wheel')
checkdepends=('python38-pytest-mypy')
source=("https://github.com/jaraco/pytest-enabler/archive/v$pkgver/$pkgname-$pkgver.tar.gz"
        "https://files.pythonhosted.org/packages/source/t/types-toml/types-toml-0.10.1.tar.gz")
sha512sums=('20abe21f6e56ab2e327f5340f72d58391012cbda4ca87f5e632db3636c95b47562c4d848f46f90c0363ad0963ed6fb3fb8da073cc9538f0116d488821898dbe5'
            '001757f956dd3af0688a6544b90ba415b26ab3128e0fbb238f4dfaf0bab6b5795d5598bcc9422d854ea235acbc9e78b245c17f9ebc9ad9251ae3c0722b382812')

export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver

prepare() {
  cd pytest-enabler-$pkgver
  # mypy needs all type stubs :/
  ln -s ../types-toml-0.10.1/toml-stubs .
}

build() {
  cd pytest-enabler-$pkgver
  python3.8 -m build --wheel --no-isolation
}

check() {
  cd pytest-enabler-$pkgver
  PYTHONPATH="$PWD" pytest
}

package() {
  cd pytest-enabler-$pkgver
  python3.8 -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}

# vim:set ts=2 sw=2 et:
