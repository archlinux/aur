# Maintainer: Akari Tsuyukusa <akkun11.open@gmail.com>
# Based on yt-dlp-ejs@0.8.0
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=yt-dlp-ejs-anyruntime
pkgver=0.8.0
pkgrel=1
pkgdesc='External JavaScript for yt-dlp supporting many runtimes (supports other than Deno)'
conflicts=(yt-dlp-ejs)
replaces=(yt-dlp-ejs)
arch=(any)
url='https://github.com/yt-dlp/ejs'
license=(Unlicense)
depends=(python)
optdepends=(deno
            nodejs
            quickjs
            quickjs-ng)
# bun is no longer supported
makedepends=(git
             nodejs
             python-build
             python-hatch-vcs
             python-hatchling
             python-installer)
checkdepends=(python-pytest)
source=(git+https://github.com/yt-dlp/ejs#tag=$pkgver)
sha256sums=('90b1d3285609709ec364fbd97ab3344346f21e1649484bf163a2b5c12f660082')

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
