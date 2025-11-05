# Maintainer: Phantasm <phantasm@centrum.cz>

_name=yt_dlp_ejs
pkgname=yt-dlp-ejs
pkgver=0.3.0
pkgrel=1
pkgdesc='External JavaScript for yt-dlp supporting many runtimes'
arch=(any)
url=https://github.com/yt-dlp/ejs
license=(Unlicense)
depends=(deno 'python>=3.10')
makedepends=(python-build python-installer python-hatchling python-hatch-vcs)
source=("$_name-$pkgver.tar.gz::$url/releases/download/$pkgver/$_name-$pkgver.tar.gz")
sha256sums=('9551abd8e3d7611c148b9dcf4a0a4fb55fcd19daca86d3801b18df10acb4bebd')

prepare() {
	cd $_name-$pkgver
	deno install --frozen
}

check() {
	cd $_name-$pkgver
	mkdir src/yt/solver/test/players # Missing from release 0.3.0 tarball

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
