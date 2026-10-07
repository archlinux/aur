# Maintainer: Stefan Tatschner <stefan.tatschner@mailbox.org>

pkgname=gallia
pkgver=2.1.1
pkgrel=1
pkgdesc='Extendable Pentesting Framework'
arch=(any)
url="https://github.com/Fraunhofer-AISEC/gallia"
license=("Apache-2.0")
depends=(
	"python"
	"python-pydantic"
	"python-aiosqlite"
	"python-argcomplete"
	"python-tabulate"
	"python-platformdirs"
	"python-wcwidth"
	"python-boltons"
)
makedepends=(
	"python-uv-build"
	"python-build"
	"python-installer"
)
checkdepends=(
	"python-pytest"
	"python-pytest-asyncio"
	"bats"
)
source=("https://github.com/Fraunhofer-AISEC/gallia/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('77fe264f9a19235d575e0679472d97f83fe2df736f7d0033e6a4ceef5a62d499')

build() {
	cd "$pkgname-$pkgver"
	python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
	cd "$pkgname-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl

	register-python-argcomplete --shell bash gallia | install -Dm644 /dev/stdin "${pkgdir}"/usr/share/bash-completion/completions/gallia
	register-python-argcomplete --shell fish gallia | install -Dm644 /dev/stdin "${pkgdir}"/usr/share/fish/vendor_completions.d/gallia.fish
	register-python-argcomplete --shell zsh  gallia | install -Dm644 /dev/stdin "${pkgdir}"/usr/share/zsh/site-functions/_gallia
}

check() {
	cd "$pkgname-$pkgver"

	python -m installer --destdir=test_dir dist/*.whl
	local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
	export PYTHONPATH="$PWD/test_dir/$site_packages"
	export PATH="$PWD/test_dir/usr/bin:$PATH"

	python -m pytest -v tests/pytest
	./tests/bats/run_bats.sh
}
