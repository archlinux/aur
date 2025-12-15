# Maintainer:
# Contributor: Mark Wagie <mark at proton dot me>

pkgname=python-libsass
pkgver=0.23.0
pkgrel=6
pkgdesc='Sass/SCSS for Python'
arch=(x86_64)
url='https://sass.github.io/libsass-python'
license=(MIT)
depends=(glibc
         libsass
         python
         python-setuptools)
makedepends=(git
             python-build
             python-installer
             python-wheel)
checkdepends=(python-pytest
              python-werkzeug)
source=(git+https://github.com/sass/libsass-python#tag=$pkgver)
sha256sums=('b7a61dcc37f9412e5b90b2c73b5e3215bf9d3eb7f490b4d05a0e1276bfc4492f')

build() {
  cd libsass-python
  SYSTEM_SASS=1 \
  python -m build --wheel --no-isolation
}

check() {
  cd libsass-python
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python sasstests.py
}

package() {
  cd libsass-python
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
