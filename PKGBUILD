# Maintainer: Lorenz Steinert <lsteinert+aur@uraziel.de>

_name=sorl-thumbnail
pkgname=python-$_name
pkgver=13.0.0
pkgrel=2
pkgdesc="Thumbnails for Django."
arch=('any')
url="https://github.com/jazzband/$_name"
license=('BSD-3-Clause')
depends=(
	'imagemagick'
	'python'
	'python-django'
	'python-django-storages'
	'python-pillow'
)
optdepends=(
	'libvips'
	'python-wand'
	'python-pgmagick'
	'python-redis'
)
makedepends=(
	'python-build'
	'python-installer'
	'python-setuptools'
	'python-setuptools-scm'
)
checkdepends=(
	'python-pytest'
	'lsof'
)
source=(
	"$_name-$pkgver.tar.gz::https://github.com/jazzband/$_name/archive/refs/tags/$pkgver.tar.gz"
	"runtests.py"
)

build() {
	export SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver"
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

check() {
	export DJANGO_SETTINGS_MODULE=tests.settings.default
	cp "runtests.py" "$_name-$pkgver"

	cd "$_name-$pkgver"
	python ./runtests.py
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
sha256sums=('99b21fbb9ff11a896a5ff5e4831daa4aab5fb8cbe95b26f2c170288013d069e8'
            '7bb5abe72047bdcd7f0ca82b5c78db0f1bac5f386a9933e701fa3fee3cdb5abd')
