# Maintainer: Chris Gorman <chrisjohgorman@gmail.com>

pkgname=python-sigmf
_name=${pkgname#python-}
pkgver=1.7.2
_commit=241ed97f7e4f9ef46482c18bea3ca5ebc1c7e59c
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
sha512sums=('1fca3da319606c36c560582ffb38e060176de17dc725a3f17a0950d41ee355279353e9437242528c3b3c874c80c6a1e805d50823762cdb9b643f8d0d59173cbd'
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
