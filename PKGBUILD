# Maintainer: Luca Kredel <luca dot kredel at web dot de>
pkgname=bomdia-git
pkgver=r11.e73eda7
pkgrel=1
pkgdesc=""
arch=(any)
url="https://codeberg.org/Phosphenius/bomdia"
license=('AGPL')
depends=('python>=3.13')
makedepends=(
	git
	python-build
	python-installer
	python-setuptools
	python-setuptools-scm
)
conflicts=("${pkgname%-git}")
backup=()
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

	( set -o pipefail
	git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
	cd "$srcdir/${pkgname%-git}"

	python3 -m build --wheel --no-isolation
}

package() {
	cd "$srcdir/${pkgname%-git}"

	python3 -m installer --destdir="$pkgdir" dist/*.whl
}
