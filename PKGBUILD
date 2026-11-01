# Maintainer: hashworks <hashworks@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=chatblade
pkgdesc="A CLI Swiss Army Knife for ChatGPT"
pkgver=0.7.0
pkgrel=3
arch=("any")
url="https://github.com/npiv/chatblade"
license=("GPL-3.0-only")
# https://github.com/npiv/chatblade/blob/main/requirements.txt
depends=(
	"python"
	"python-openai"
	"python-platformdirs"
	"python-pylatexenc"
	"python-rich"
	"python-tiktoken"
	"python-yaml"
)
makedepends=(
	"python-build"
	"python-installer"
	"python-setuptools"
	"python-wheel"
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('ffe136b110debe72bae6d651d21f259c5e85117276b8458c4ebd598b9cc368e4')

prepare() {
	cd "${pkgname}-${pkgver}"
	# Use remote assets
	sed -i 's#<img src="assets/\([^"]*\)">#<img src="'${url}'/raw/v'${pkgver}'/assets/\1">#g' README.md
}

build() {
	cd "${pkgname}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${pkgname}-${pkgver}"
	python -m installer --destdir="${pkgdir}" dist/*.whl
	install -vDm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
	install -vDm644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md
}
