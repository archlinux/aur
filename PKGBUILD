# Maintainer: Danny Waser (Waser Technologies) <waser@waser.tech>

pkgname=python38-setuptools-rust
pkgver=1.5.2
pkgrel=1
pkgdesc="Compile and distribute Python 3.8 extensions written in rust as easily as if they were written in C."
arch=('any')
license=('MIT')
url="https://github.com/PyO3/setuptools-rust"
depends=('rust' 'python38-setuptools' 'python38-semantic-version' 'python38-typing-extensions')
checkdepends=('python38-pytest' 'python38-pytest-benchmark' 'python38-beautifulsoup4' 'python38-lxml' 'python38-cffi')
source=("https://github.com/PyO3/setuptools-rust/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('e80d1296fd09c24b644d821e981261153ff19ae62d978fc8ee81c78e440d215f9d1e91e33d758effb94fcb64985937445940f2e2f032ad1b8c2aa39be79cf19d')

build() {
  cd setuptools-rust-$pkgver
  python3.8 setup.py build
}

check() {
  cd setuptools-rust-$pkgver
  python3.8 setup.py egg_info
  for _dir in examples/*; do
    pushd $_dir
    PYTHONPATH="$PWD/../.." python3.8 setup.py build
    [[ -d tests || -d test ]] && PYTHONPATH="$PWD/build/lib:build/lib.linux-$CARCH-cpython-38" pytest
    popd
  done
  pytest --doctest-modules setuptools_rust
}

package() {
  cd setuptools-rust-$pkgver
  python3.8 setup.py install --root="$pkgdir" --optimize=1

  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}