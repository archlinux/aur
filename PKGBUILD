# Maintainer: Chris Gorman <chrisjohgorman@gmail.com>

pkgname=python-sigmf
_name=${pkgname#python-}
pkgver=1.13.0
_commit=d228a502ceb45e4b42f374b933574c5a2ddf0b1c
pkgrel=1
pkgdesc='Python package for Signal Metadata Format (SigMF)'
url='https://github.com/sigmf/sigmf-python'
license=('LGPL3')
arch=('any')
depends=('python' 'python-jsonschema' 'python-numpy')
makedepends=('git' 'python-build' 'python-installer' 'python-pytest' 'python-setuptools' 'python-setuptools-scm' 'python-wheel')
checkdepends=('python-hypothesis')
source=("$pkgname::git+$url.git#commit=$_commit"
	0001-license-and-convert.patch)
sha512sums=('0344f562409f463c14207222bdc2507b897e860dc9d5d15f2b3a3d0acac65e5c36cdca069593e7ee0330a7aa115dfd401be364323da1d724d25ebaea2a2ec34d'
            'ce1de1271b95db6de4134479060feeef0d1469d1800dbf13ffc4ec511e1c69589d5bebb1571d44edd6e7667682a1738120e0357cfb416a280c4fc52ad1426171')

prepare() {
    cd "${pkgname}"
    patch -Np1 -i ../0001-license-and-convert.patch
}

build() {
    ln -s "${pkgname}" "$_name-$pkgver"
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

check() {
    cd "$_name-$pkgver"
    pytest || warning "make check failed"
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
