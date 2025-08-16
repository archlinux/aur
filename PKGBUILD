# Maintainer: Liliane Fontenot <projects@liliane.io>
# Contributor: Philip Goto <philip.goto@gmail.com>

pkgname=xword-dl
pkgver=2025.8.4
pkgrel=1
pkgdesc='Command-line tool to download .puz files for online crossword puzzles'
arch=(any)
url='https://github.com/thisisparker/xword-dl'
license=(MIT)
depends=(
	python-beautifulsoup4
	python-dateparser
	python-emoji
	python-html2text
	python-lxml
	python-puzpy
	python-requests
	python-unidecode
	python-xmltodict
	python-yaml
)
makedepends=(python-hatchling)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('539f09913c60bec601a2623e25f7b0a85edf652d7aa8c4d150e392024356f9aa')

prepare() {
    cd "${pkgname}-${pkgver}"
    # upstream uses a plugin to set version from VCS; set it manually and remove the build plugin
    echo "__version__ = \"$pkgver\"" > src/xword_dl/_version.py
    sed -i -e 's/^version.source = .*/version.path = "src\/xword_dl\/_version.py"/' -e 's/.*vcs.*//' pyproject.toml
}

build() {
	cd "${pkgname}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${pkgname}-${pkgver}"
	python -m installer -d "${pkgdir}" dist/*.whl
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
