# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

pkgname=damo
pkgver=1.6.7
pkgrel=1
pkgdesc="DAMON user-space tool"
arch=('any')
url='https://damonitor.github.io'
license=('GPL2')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://github.com/awslabs/damo/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('61c72dcea43a76ff729a3a06f28d8bf6dedc1b66902b9fc830ac4f355177af60')
b2sums=('903f17f95df7657281c22e6f0d2b0d43a5ac7a16389472325a1dbae0f71400903d62aa988b80ede709817dbe115aa4ac6b3082056695363af288a9b064958f8a')

prepare() {
  cd "$pkgname-$pkgver"

  mkdir -p build && cd build

  cp ../packaging/{setup.py,pyproject.toml} .
  sed -i "s/<<replace_me_with_the_version_number>>/$pkgver/" setup.py

  ../packaging/mk_readme.sh "$PWD" "$pkgver"

  mkdir -p src/damo
  cp ../*.py src/damo
  cp ../damo src/damo/damo.py
  touch src/damo/__init__.py

  rm -f src/damo/damo_version.py
}

build() {
  cd "$pkgname-$pkgver/build"

  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver/build"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" \
    ../LICENSE
}
