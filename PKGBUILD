# Maintainer: Javier Castro <dev@javiercastro.xyz>
_pkgname=affine
pkgname=python-${_pkgname}
pkgver=3.0.1
pkgrel=1
pkgdesc="Python package for matrices describing affine transformation of the plane"
url='https://github.com/rasterio/affine'
makedepends=('python-build'
             'python-installer'
             'python-wheel'
             'python-flit-core'
            )
depends=('python')
optdepends=()
license=('BSD')
arch=('any')
source=("https://pypi.python.org/packages/source/a/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('e1b3c38c5d4d3ef5024a182a6d1bf1e0c51ab221825781c741aeb4d0c079a7e2')

prepare() {
    cd "$srcdir/${_pkgname}-$pkgver"

    # Allow building with `flit_core` 4; Upstream git branch for `affine`
    # already allows `flit_core` <5, but release version 3.0.1 does not;
    # presumably this will get fixed in the next release. But until then, this
    # temporary fix gets the job done.
    sed -i 's/flit_core >=3.11,<4/flit_core >=3.11,<5/' pyproject.toml
}

build() {
    cd "$srcdir/${_pkgname}-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/${_pkgname}-$pkgver"

    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt

    # https://wiki.archlinux.org/index.php/Python_package_guidelines
    local site_packages=$(python -c 'import site; print(site.getsitepackages()[0])')
    rm -rf "${pkgdir}${site_packages}/test"
}
