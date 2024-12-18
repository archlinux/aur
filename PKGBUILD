# Maintainer: Chris Gorman <chrisjohgorman@gmail.com>

pkgname=python-sigmf
_name=${pkgname#python-}
pkgver=1.2.3
_commit=72faad36fa5256be28e56bef5e000e685de8d50a
pkgrel=1
pkgdesc='Python package for Signal Metadata Format (SigMF)'
url='https://github.com/sigmf/sigmf-python'
license=('LGPL3')
arch=('any')
depends=('python' 'python-jsonschema' 'python-numpy')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname::git+$url.git#commit=$_commit"
        0001-packages-sigmf.apps.patch)
sha512sums=('5edfedb303a8d4e6647c51bad3c99a14590b6d70f3804ecb7e926cb4d810c79f26a5c917ce76d57f3093320cd8d4c880f1489d798c969a930cb6df5292a39c88'
            'a32af33497db9dc75684ba584833c58b9a8751c17335bbdf7c6defbd79078926f8beab0645396711f9a74279b5bc869de0f5cc92651173666b093daf8fe17be8')

prepare() {
    cd "${pkgname}"
    patch -Np1 -i ../0001-packages-sigmf.apps.patch
}

build() {
    ln -s "${pkgname}" "$_name-$pkgver"
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

check() {
    cd "$_name-$pkgver"
    pytest
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
