# Maintainer: Luca Kredel <luca dot kredel at web dot de>
pkgname=bomdia-git
pkgver=v0.1.0.r33.g343850c
pkgrel=2
pkgdesc=""
arch=(any)
url="https://codeberg.org/Phosphenius/bomdia"
license=('AGPL-3.0-only')
depends=(
	'python>=3.13'
	python-argcomplete
)
makedepends=(
	git
	python-build
	python-installer
	python-setuptools
	python-sphinx
	python-myst-parser
)
checkdepends=()
conflicts=("${pkgname%-git}")
backup=()
options=(zipman)
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

	( set -o pipefail
	git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
	cd "$srcdir/${pkgname%-git}"

	python3 -m build --wheel --no-isolation

	make man
}

package() {
	cd "$srcdir/${pkgname%-git}"

	python3 -m installer --destdir="$pkgdir" dist/*.whl

	# Install licenses and docs/man
	make -f install.mk DESTDIR="$pkgdir" install

	# Install bash completion
	mkdir -p "$pkgdir"/usr/share/bash-completion/completions/
	activate-global-python-argcomplete --dest \
		"$pkgdir"/usr/share/bash-completion/completions/
	mv "$pkgdir"/usr/share/bash-completion/completions/_python-argcomplete \
		"$pkgdir"/usr/share/bash-completion/completions/bomdia
}
