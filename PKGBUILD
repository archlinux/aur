# Maintainer: PhotonX <photon89 [at] gmail.com>.

pkgname=python-spandrel
_pkgname=${pkgname#python-}
pkgver=0.4.2
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
sha256sums=('1c382c2ef8ebb5fce30d6d0fcf9641a0bd5113881d861896a27645829afc97df')

build() {
	cd "$_pkgname-$pkgver/libs/spandrel"
	python -m build -nw
}

check() {
	cd "$_pkgname-$pkgver"
	PYTHONPATH="$PWD/libs/spandrel/build/lib" python -c 'import spandrel'
}

package() {
	cd "$_pkgname-$pkgver"
	install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm 644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	python -m installer --compile-bytecode=1 --destdir=$pkgdir \
	$srcdir/$_pkgname-$pkgver/libs/spandrel/dist/spandrel-$pkgver-py3-*-*.whl
}
