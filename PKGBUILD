# Maintainer: Jax Young <jaxvanyang@gmail.com>
pkgname=bdebstrap
pkgver=0.5.0
pkgrel=2
pkgdesc="YAML config based multi-mirror Debian chroot creation tool"
arch=('any')
url="https://github.com/bdrung/bdebstrap"
license=('ISC')
depends=('mmdebstrap' 'python-ruamel-yaml' 'python')
makedepends=('pandoc' 'python-setuptools')
checkdepends=(
	'python-black'
	'python-isort'
	'python-pylint'
	'python-coverage'
	'flake8'
	'shellcheck')
optdepends=(
	'debian-archive-keyring: Debian PKI support'
	'ubuntu-keyring: Ubuntu PKI support'
	'qemu-user-static: foreign-architecture support'
	'qemu-user-static-binfmt: foreign-architecture support'
	'arch-test: foreign-architecture support')
source=(
	"https://github.com/bdrung/bdebstrap/releases/download/v0.5.0/$pkgname-$pkgver.tar.xz"
	'extract-hook.patch')
sha256sums=('f66cb56ea8ffa713da1a8dd7bc24ed0d11606619ea6730ccef1f6b251222b114'
            '564d577734f288195e46f1692f55bcfeda883ecf9275ba963062feb566f7cedd')

prepare() {
	cd "$pkgname-$pkgver"
	patch -p1 -i "$srcdir/extract-hook.patch"
}

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

check() {
	cd "$pkgname-$pkgver"
	python -m coverage run -m unittest discover -v
}

package() {
	cd "$pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
