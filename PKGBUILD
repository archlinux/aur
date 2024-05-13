# Maintainer: Andrej Radović <r.andrej@gmail.com>
pkgname=python-digikey-api-git
_name=${pkgname#python-}
pkgver=r61.10b91ac
pkgrel=1
pkgdesc="Python client for Digikey API"
url="https://github.com/peeter123/digikey-api"
depends=(
	'python'
	'python-requests'
	'python-retrying'
	'python-fake-useragent'
	'python-schematics'
	'python-inflection'
	'python-certauth'
	'python-urllib3'
)
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
license=('GPL3')
arch=('any')
source=("$pkgname::git+https://github.com/hvraven/digikey-api.git#commit=10b91ac61458e42f7757fd6c060766b5b9515314")
sha256sums=('SKIP')
conflicts=('python-digikey-api')
provides=("python-digikey-api=${pkgver}")

pkgver() {
	cd "$pkgname"
	(
		set -o pipefail
		git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
			printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
	)
}

build() {
	cd "$srcdir/$pkgname"
	python -m build --wheel --no-isolation
}

package() {
	cd "$srcdir/$pkgname"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
