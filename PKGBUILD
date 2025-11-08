# Maintainer: Phantasm <phantasm@centrum.cz>

_name=yt_dlp_ejs
pkgname=yt-dlp-ejs
pkgver=0.3.1
pkgrel=1
pkgdesc='External JavaScript for yt-dlp supporting many runtimes'
arch=(any)
url=https://github.com/yt-dlp/ejs
license=(Unlicense)
depends=(deno 'python>=3.10')
makedepends=(python-build python-installer python-hatchling python-hatch-vcs)
optdepends=(
	'yt-dlp: Main package'
)
source=("$_name-$pkgver.tar.gz::$url/releases/download/$pkgver/$_name-$pkgver.tar.gz")
sha256sums=('7f2119eb02864800f651fa33825ddfe13d152a1f730fa103d9864f091df24227')

prepare() {
	cd $_name-$pkgver
	deno install --frozen
}

check() {
	cd $_name-$pkgver

	deno run --allow-read --allow-write --allow-net src/yt/solver/test/download.ts
	deno test --allow-read
}

build() {
	cd $_name-$pkgver
	deno run bundle
	python -m build --wheel --no-isolation
}

package() {
	cd $_name-$pkgver
	python -m installer --destdir="$pkgdir" dist/*.whl
}
