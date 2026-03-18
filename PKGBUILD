# Maintainer: Hildigerr Vergaray <maintainer(at)YmirSystems(dot)com>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Phantasm <phantasm@centrum.cz>

pkgname=yt-dlp-ejs-npm
pkgver=0.8.0
pkgrel=2
pkgdesc='External JavaScript for yt-dlp supporting many runtimes'
arch=(any)
url='https://github.com/yt-dlp/ejs'
license=(Unlicense)
depends=(npm
         python)
makedepends=(git
             python-build
             python-hatch-vcs
             python-hatchling
             python-installer)
provides=(yt-dlp-ejs)
conflicts=(yt-dlp-ejs)
checkdepends=(python-pytest)
source=(git+https://github.com/yt-dlp/ejs#tag=$pkgver)
sha256sums=('90b1d3285609709ec364fbd97ab3344346f21e1649484bf163a2b5c12f660082')

prepare() {
	cd ejs

	npm install
}

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

	node --experimental-strip-types src/yt/solver/test/download.ts
	node --test
}

package() {
  cd ejs
  python -m installer --destdir="$pkgdir" dist/*.whl
}
