# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python38-pep517
pkgver=0.13.0
pkgrel=1
pkgdesc="Wrappers to build Python 3.8 packages using PEP 517 hooks"
arch=('any')
license=('MIT')
url="https://github.com/takluyver/pep517"
depends=('python38-tomli')
makedepends=('python38-build' 'python38-flit-core' 'python38-installer')
checkdepends=('python38-mock' 'python38-pytest' 'python38-testpath' 'python38-pip')
source=("https://pypi.io/packages/source/p/pep517/pep517-$pkgver.tar.gz")
sha512sums=('110c62441e0084cb2f0b7310ec2d7bb3e08615d65efbeb84eab953ec21600fc4242ef8611f9cdf74a936c1f9e389f4379d165bb5c7a8bd9efe50ee53c1b8d4e1')

prepare() {
  cd pep517-$pkgver
  # Copied from openSUSE: 
  # Remove what appears to be overly cautious flag
  # that causes tests to require internet, both here
  # and the test suites of any dependencies. Tracking at:
  # https://github.com/pypa/pep517/issues/101
  sed -i "s/ '--ignore-installed',//" pep517/envbuild.py

  sed -i '/--flake8/d' pytest.ini
}

build() {
  cd pep517-$pkgver
  python3.8 -m build --wheel --no-isolation --skip-dependency-check
}

check() {
  cd pep517-$pkgver
  pytest
}

package() {
  cd pep517-$pkgver
  python3.8 -m installer --destdir="$pkgdir/" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
