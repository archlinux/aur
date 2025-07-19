# Maintainer: Chris Gorman <chrisjohgorman@gmail.com>

pkgname=python-sigmf
_name=${pkgname#python-}
pkgver=1.2.10
_commit=2ae107f0e34ae4d3cf8a4b23d39803e85839a628
pkgrel=1
pkgdesc='Python package for Signal Metadata Format (SigMF)'
url='https://github.com/sigmf/sigmf-python'
license=('LGPL3')
arch=('any')
depends=('python' 'python-jsonschema' 'python-numpy')
makedepends=('git' 'python-build' 'python-installer' 'python-pytest' 'python-setuptools' 'python-setuptools-scm' 'python-wheel')
checkdepends=('python-hypothesis')
source=("$pkgname::git+$url.git#commit=$_commit"
        0001-packages-sigmf.apps.patch)
sha512sums=('cdfe564b65f696e6ee9dc3e4aa55e0800e6f4dc9e20087d874473f6eea5e3f2c501763de5311ea9ab49d37ad2c8fa014bb3b6f404dc8e904dc73e639fa665708'
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
