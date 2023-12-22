# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-cffsubr-git
pkgver=0.2.9.post1.r0.g5999ae5
pkgrel=2
pkgdesc='Standalone CFF subroutinizer based on AFDKO tx'
url='https://github.com/adobe-type-tools/cffsubr'
license=('Apache')
arch=(any)
depends=(python
    python-fonttools)
makedepends=(python-setuptools-git-ls-files
    python-setuptools-scm
    python-{build,installer,wheel}
    git)
checkdepends=(python-pytest)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long --tags | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare()
{
    git -C "${srcdir}/${pkgname}" clean -dfx
}

build() {
    cd "$pkgname"
    git submodule update --init --recursive
    python -m build -wn
}

check() {
    cd "$pkgname"
    # PYTHONPATH=src pytest tests
    local _pyver=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')
	export PYTHONPATH="$PWD/build/lib.linux-$CARCH-cpython-$_pyver"
	pytest tests
}

package() {
    cd "$pkgname"
    python -m installer -d "$pkgdir" dist/*.whl
}

