# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=bandcampsync
pkgver=0.8.0
pkgrel=1
pkgdesc='Downloads your Bandcamp purchases automatically'
arch=(any)
url='https://github.com/meeb/bandcampsync'
license=(BSD-3-Clause)
depends=(
  python
  python-curl_cffi
  python-beautifulsoup4
)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  python-pytest
  python-pytest-mock
)
source=("$pkgname::git+$url#tag=v$pkgver")
sha512sums=('9cb2cfedf648f03db2e733f153927be3737385e0325dd9a807aebe545828538f1ec9b785960349011744bfc91f9099e54c70709a744cd64fedf926fd9c342861')
b2sums=('ecba46a323cd608da333c6e112eaa3adb0d68700fa81da4bd75ee88abb962283c14237af62907ec916ed7388a8bdf240fcb5f37e05a100ef3c01930b540c03cf')

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"

  # install to temporary directory
  python -m installer --destdir="$PWD/tmp_install" dist/*.whl
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  export PYTHONPATH="$PWD/tmp_install$site_packages"

  pytest -vv tests
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
  cp -vr docs "$pkgdir/usr/share/doc/$pkgname"

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
