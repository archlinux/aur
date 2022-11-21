# Maintainer: Danny Waser <danny@waser.tech>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=python38-invoke
pkgver=1.7.3
pkgrel=1
pkgdesc="Pythonic task execution"
url="https://github.com/pyinvoke/invoke"
license=('BSD')
arch=('any')
depends=('python38-fluidity' 'python38-lexicon' 'python38-six' 'python38-yaml')
makedepends=('python38-setuptools')
checkdepends=('python38-pytest' 'python38-mock' 'python38-pytest-relaxed')
source=("https://pypi.io/packages/source/i/invoke/invoke-$pkgver.tar.gz"
        invoke-devendor.patch)
sha512sums=('180ba1e5e06839724c9fe565b44ddd885bd8c6bb1b04f6d0f30de0450b687f52e4fccac85939fe1f23dee1ca61fde9b2a0d8aa8ffa59b292e0e5dc21eb8d6280'
            'c5e414990f7a36455ff28288f90cccd62e570775523ea307f4ed2b7cdc7b9b0c1ee2d2eb046a048843fd2f016aed0a3cf270355297a1d73119f83edf8bc37be9')

prepare() {
  find invoke-$pkgver -type f -name '*.pyc' -delete
  rm -r invoke-$pkgver/invoke/vendor

  patch -d invoke-$pkgver -p1 < invoke-devendor.patch
}

build() {
  cd invoke-$pkgver
  python3.8 setup.py build
}

check() {
  cd invoke-$pkgver
  PYTHONPATH="$PWD"/build/lib pytest tests
}

package() {
  cd invoke-$pkgver
  python3.8 setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
