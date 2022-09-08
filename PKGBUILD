# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Filip Graliński <filipg@amu.edu.pl>

pkgname=fairseq-git
_pkg="${pkgname%-git}"
pkgver=0.9.0.r1219.g9a00e033
pkgrel=1
pkgdesc="Sequence modeling toolkit"
arch=('x86_64')
url="https://github.com/facebookresearch/fairseq"
license=('MIT')
depends=(
	'python>=3.6'
	'python-bitarray'
	'python-cffi'
	'python-hydra-core'
	'python-numpy'
	'python-omegaconf'
	'python-pytorch'
	'python-regex'
	'python-sacrebleu'
	'python-tqdm'
	'python-torchaudio')
optdepends=(
	'cuda: Model training'
	'nccl: Model training'
	'python-apex: Faster training')
makedepends=(
	'cython'
	'git'
	'python-build'
	'python-installer'
	'python-setuptools'
	'python-wheel')
provides=("$_pkg")
conflicts=("$_pkg")
source=("$_pkg::git+$url")
sha256sums=('SKIP')
validpgpkeys=('5DE3E0509C47EA3CF04A42D34AEE18F83AFDEB23')

pkgver() {
	git -C "$_pkg" describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
	cd "$_pkg"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_pkg"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
