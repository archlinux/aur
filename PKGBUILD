# Maintainer: justbispo <aur.fyxy0@slmail.me>

pkgname=razer-cli
pkgver=2.3.0
pkgrel=2
pkgdesc="CLI for configuring Razer devices."
arch=(any)
url="https://github.com/lolei/razer-cli"
license=('GPL-3.0-or-later')
depends=('python-openrazer' 'xorg-xrdb')
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('0f2a0d1f5b187209e33f4476807de226fe8c3215ca9a4f43021fb49d70adbbbe')

build() {
	cd "$pkgname-$pkgver"
	python -m build --wheel --no-isolation
}

check() {
	cd "$pkgname-$pkgver"
	pytest
}

package() {
	cd "$pkgname-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl

	# Remove installed tests
	local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
	rm -r "${pkgdir}${site_packages}/razer_cli/tests/"
}
