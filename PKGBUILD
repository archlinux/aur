# Maintainer: KiWi42 < pullthisplug dash aur at yahoo dot com >

pkgname=scans2any-git
pkgver=0.0.0.post2+4c50b61
pkgrel=1
pkgdesc="Convert and merge infrastructure scans to Typst, Markdown, HTML, ..."
arch=("any")
license=("AGPL-3.0-or-later")
provides=(scans2any scans2any-git)
conflicts=(scans2any)
depends=(python python-htmlgenerator python-jinja python-libnmap python-pandas
	python-partial-json-parser python-sortedcontainers python-tabulate
	python-tqdm python-yaml)
makedepends=(python-build python-installer python-wheel uv)
checkdepends=(uv)
source=(${pkgname}::git+https://github.com/softScheck/scans2any.git)
sha256sums=("SKIP")

pkgver() {
	cd ${pkgname}
	uv sync --quiet
	uv run ./data/bump-version.py bump git
}

build() {
	cd ${pkgname}
	uv run ./data/bump-version.sh git dry-run
	python -m build --wheel
}

check() {
	cd ${pkgname}
	uv sync
	uv run pytest -s
}

package() {
	# Install python module
	cd ${pkgname}
	python -m installer --destdir="$pkgdir" dist/*.whl

	# Install scans2markdown executable
	mkdir -p "${pkgdir}/usr/bin"
	install src/scans2any/main.py "${pkgdir}/usr/bin/scans2any"

	# Install data files in `/usr/share`
	mkdir -p "${pkgdir}/usr/share/scans2any"

	# install zsh completion file _scans2markdown as well as man page
	mkdir -p "${pkgdir}/usr/share/zsh/site-functions"
	mkdir -p "${pkgdir}/usr/share/man/man1"
	install -m 644 data/_scans2any "${pkgdir}/usr/share/zsh/site-functions/_scans2any"
	install -m 644 data/scans2any.1 "${pkgdir}/usr/share/man/man1/scans2any.1"
}
