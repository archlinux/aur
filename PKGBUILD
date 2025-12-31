# Maintainer: Stefan Tatschner <stefan.tatschner@mailbox.org>

pkgname=gallia
pkgver=2.0.2
pkgrel=1
pkgdesc='Extendable Pentesting Framework'
arch=(any)
url="https://github.com/Fraunhofer-AISEC/gallia"
license=("apache")
depends=(
	"python"
	"python-pydantic"
	"python-aiosqlite"
	"python-argcomplete"
	"python-tabulate"
	"python-pydantic"
	"python-platformdirs"
	"python-construct"
	"python-boltons"
	"python-zstandard"
)
makedepends=(
	"python-uv-build"
	"python-build"
	"python-installer"
	"python-argcomplete"
)
checkdepends=(
	"python-pytest"
	"python-pytest-asyncio"
	"bats"
)
source=("https://github.com/Fraunhofer-AISEC/gallia/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('0b797a3161d2b537d704aaf69de610d0ea8bd9aa9964606d38e45cf62c0e92e1')

build() {
	cd "$pkgname-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$pkgname-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl

	register-python-argcomplete --shell bash gallia | install -Dm644 /dev/stdin "${pkgdir}"/usr/share/bash-completion/completions/gallia
	register-python-argcomplete --shell fish gallia | install -Dm644 /dev/stdin "${pkgdir}"/usr/share/fish/vendor_completions.d/gallia.fish
	register-python-argcomplete --shell zsh  gallia | install -Dm644 /dev/stdin "${pkgdir}"/usr/share/zsh/vendor-completions/_gallia
}

check() {
	cd "$pkgname-$pkgver"

	python -m pytest -v tests/pytest
	./tests/bats/run_bats.sh
}
