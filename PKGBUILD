# Maintainer: Yauheni Kirylau <actionless dot loveless AT gmail MF com>
# shellcheck disable=SC2034,SC2154

pkgname=python-encodec-git
pkgver=0.1.1.r21.g0e2d0ae
pkgrel=2
pkgdesc="EnCodec: High Fidelity Neural Audio Compression by Facebook"
arch=('any')
url="https://github.com/facebookresearch/encodec"
license=('MIT')
source=(
	"${pkgname}::git+${url}.git#branch=main"
)
md5sums=('SKIP')
depends=(
	'python-numpy'
	'python-pytorch'
	'python-torchaudio'
	'python-einops'
)
makedepends=(
	'python-wheel'
	'python-hatchling'
	'python-build'
	'python-installer'
	'python-setuptools'  # i think it normally should be required by python-pep517 which required by python-build/installer
)
optdepends=(
)
conflicts=('python-encodec')
provides=('python-encodec')

pkgver() {
	cd "${srcdir}/${pkgname}" || exit 2
	set -o pipefail
	git describe --tags --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//' || echo 0.0.1
}

build() {
	cd "${srcdir}/${pkgname}" || exit 2
	/usr/bin/python3 -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/${pkgname}" || exit 2
	/usr/bin/python3 -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
