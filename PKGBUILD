# Maintainer: Yauheni Kirylau <actionless dot loveless AT gmail.com>
# shellcheck disable=SC2034,SC2154

pkgname=python-bark-git
pkgver=0.0.0.r83.gf4f32d4
pkgrel=2
pkgdesc="Text-Prompted Generative Audio Model by Suno AI"
arch=('any')
url="https://github.com/suno-ai/bark"
license=('MIT')
source=(
	"$pkgname::git+${url}#branch=main"
)
md5sums=('SKIP')
depends=(
	'python-boto3'
	'python-encodec'
	'python-funcy'
	'python-huggingface-hub'
	'python-numpy'
	'python-scipy'
	'python-tokenizers'
	'python-pytorch'
	'python-tqdm'
	'python-transformers'
)
makedepends=(
	'python-wheel'
	'python-hatchling'
	'python-build'
	'python-installer'
	'python-setuptools'  # i think it normally should be required by python-pep517 which required by python-build/installer
	'python-markdown-it-py'
)
optdepends=(
)
conflicts=('python-bark')
provides=('python-bark')

pkgver() {
	cd "${srcdir}/${pkgname}" || exit 2
	set -o pipefail
	git describe --tags --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g' \
	|| printf "0.0.0.r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)" \
	|| echo 0.0.0.1
}

build() {
	cd "${srcdir}/${pkgname}" || exit 2
	/usr/bin/python3 -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/${pkgname}" || exit 2
	/usr/bin/python3 -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	#cp -r ./packaging/* "${pkgdir}"
}
