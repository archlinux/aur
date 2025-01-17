# Maintainer: Daniel Chesters <archlinux@coin-coin.xyz>

pkgname=python-ollama-git
pkgver=0.4.6.r6.g967fd65
pkgrel=1
pkgdesc="Ollama Python library"
arch=('any')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
url="https://github.com/ollama/ollama-python"
license=('MIT')
depends=(
	'ollama'
	'python'
	'python-httpx'
	'python-typing_extensions'
	'python-pydantic'
)
makedepends=(
	'python-poetry'
	'git'
)
b2sums=('SKIP')

source=("$pkgname::git+https://github.com/ollama/ollama-python.git")

pkgver() {
	cd "$pkgname" || exit
	git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$pkgname" || exit
	# Remove poetry plugin dependencies
	sed -i '16,17d' pyproject.toml
	poetry build -f wheel
}

package() {
	cd "$pkgname" || exit
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
