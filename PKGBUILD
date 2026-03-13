# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=yt-dlp-ejs
pkgver=0.7.0
pkgrel=1
pkgdesc='External JavaScript for yt-dlp supporting many runtimes'
arch=(any)
url='https://github.com/yt-dlp/ejs'
license=(Unlicense)
depends=(deno
         python)
makedepends=(git
             nodejs
             python-build
             python-hatch-vcs
             python-hatchling
             python-installer)
checkdepends=(python-pytest)
source=(git+https://github.com/yt-dlp/ejs#tag=$pkgver)
sha256sums=('4be27774ed50bcd146239e62f73225c383291f8fb0b3a8829d37ceb1f501a074')

build() {
  cd ejs
  python -m build --wheel --no-isolation
}

check() {
  cd ejs
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  cp -r test test-env/lib/python*/site-packages # tests search for js files in relative paths
  test-env/bin/python -m pytest -v `ls -d test-env/lib/python*`/site-packages/test
}

package() {
  cd ejs
  python -m installer --destdir="$pkgdir" dist/*.whl
}
