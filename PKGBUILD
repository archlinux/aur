# Maintainer: bipin kumar <kbipinkumar@pm.me>

pkgname=python-ncls
_module=${pkgname#python-}
pkgver=0.0.68
pkgrel=2
pkgdesc="A wrapper for the nested containment list data structure. http://dx.doi.org/10.1093/bioinformatics/btz615"
arch=('x86_64')
url="https://github.com/biocore-ntnu/ncls"
license=('BSD-2')
depends=(
         'python'
         'python-numpy'
         'glibc'
         'python-setuptools'
        )
makedepends=(
             'python-setuptools-scm'
             'cython'
             'python-build'
             'python-installer'
             'python-wheel'
            )

options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz"
        "LICENSE"
        "cython3.patch")
sha256sums=('81aaa5abb123bb21797ed2f8ef921e20222db14a3ecbc61ccf447532f2b7ba93'
            '48186409eb1721726d28884f40346a8380a893e95a50bef75584e2e9c2d4fcd5'
            '80fbdf0c5c2a805c953df3c359d84e63bc801d14457ad5b8a6c140250ccec7d2')

prepare() {
    cp LICENSE "$_module-$pkgver"
    cp cython3.patch "$_module-$pkgver"
    rm "$_module-$pkgver"/ncls/src/{fncls.c,ncls.c,ncls32.c}
    # Set cython language_level to 3
    cd "$_module-$pkgver"
    patch -p1 < cython3.patch
    
}

build() {
    cd "$_module-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_module-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
