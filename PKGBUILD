# Maintainer: PhotonX <photon89 [at] gmail.com>.

pkgname=python-spandrel
_pkgname=${pkgname#python-}
pkgver=0.4.1
pkgrel=1
pkgdesc="Library for loading and running pre-trained PyTorch models"
arch=('any')
url='https://github.com/chaiNNer-org/spandrel'
license=('MIT')
depends=(
	'python-pytorch'
	'python-torchvision'
	'python-safetensors'
	'python-numpy'
	'python-einops'
	'python-typing_extensions'
)
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')

source=(
	"$pkgname-$pkgver.tar.gz"::"https://github.com/chaiNNer-org/spandrel/archive/refs/tags/v$pkgver.tar.gz"
)
sha256sums=('12063b78bb3a1979617e697a66994be9e651117425e19f7004af2a3e34ad2b97')

build() {
	cd "$_pkgname-$pkgver/libs/spandrel"
	python -m build -nw
}

check() {
	cd "$_pkgname-$pkgver"
	PYTHONPATH=$PWD/src python -c 'import spandrel'
}

package() {
	cd "$_pkgname-$pkgver"
	install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm 644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	python -m installer --compile-bytecode=1 --destdir=$pkgdir \
	$srcdir/$_pkgname-$pkgver/libs/spandrel/dist/spandrel-$pkgver-py3-*-*.whl
}
