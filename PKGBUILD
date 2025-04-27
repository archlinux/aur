# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

pkgname=damo
pkgver=2.7.7
pkgrel=1
pkgdesc="DAMON user-space tool"
arch=('any')
url='https://damonitor.github.io'
license=('GPL2')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/damonitor/damo/archive/refs/tags/v$pkgver.tar.gz"
        "revert-setuptools-pin.diff::https://github.com/damonitor/damo/commit/d6ff5a695ae5a8a10f2a74263940c7523e5a4f44.patch")
sha256sums=('425d50fcfca07b2eaea6840f19a3554927052848f90335107f5ad0eabde6716d'
            'e7a3b3c4100392975f3f6fb7926b787d37f373de24049391f057dbb42761b26d')
b2sums=('1d152ae10260ea4b36139066aef7e2c34db24261a47ff027a788c208843704f3d6545be84634ee2d65bfbe35f5ce81c783d7d421dee7a36d0580ea91b871b050'
        '1fc1314572cf26a9c0e37cb03dafd80ced79f039f483402a0e6bb553102b96312b9e950b7398c6b6b2590092b8421f3cedc749c4c9d97cc7310ab1071ccc93a8')

prepare() {
  cd "$pkgname-$pkgver"

  patch -Np1 -i "$srcdir/revert-setuptools-pin.diff"
}

build() {
  cd "$pkgname-$pkgver"

  mkdir build && cd build

  cp ../packaging/{pyproject.toml,setup.py} .
  ../packaging/mk_readme.sh "$PWD" "$pkgver"

  mkdir -p src/damo
  cp -p ../src/*.py src/damo
  touch src/damo/__init__.py

  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver/build"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" \
    ../LICENSE
}
