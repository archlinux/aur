# Maintainer: Lorenz Steinert <lsteinert+aur@uraziel.de>

_name=sorl-thumbnail
pkgname=python-$_name
pkgver=13.0.0
pkgrel=1
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
            'be5b60fb6f38ddc1b8ca865e0b8ac4f8d6bd621feb7908870cdb2f8997685c3e')
