# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=bandcampsync
pkgver=0.7.0
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
sha512sums=('469357c4a0c8502041739f80d67536477f87267455394ecc6ad3c78f795807f619736e36e96ea1c00c33b14c555d43ec6ca9a7c22fa5e1f0688a6da2183cb230')
b2sums=('54658ed00e356af311b08569e0944c53685e7364f7352fd5c13cf9eb2dbe46de675994c848e73b2fa010a426b189f9b1b3886305737a35aab186dd702f85c0e2')

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
