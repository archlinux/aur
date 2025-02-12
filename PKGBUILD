# Maintainer: Ianis Vasilev <ianis@ivasilev.net>
pkgname=python-djvulibre-python
_pkgbasename=${pkgname:7}
pkgver=0.9.1
pkgrel=1
pkgdesc='Python interface to DjVuLibre'
license=('GPL-2.0-only')
url='https://github.com/FriedrichFroebel/python-djvulibre'
checkdepends=(djvulibre ghostscript)
makedepends=(python-build python-installer python-wheel python-setuptools djvulibre pkgconf cython)
depends=(python djvulibre)
source=("https://files.pythonhosted.org/packages/source/${_pkgbasename::1}/${_pkgbasename//-/_}/${_pkgbasename//-/_}-$pkgver.tar.gz")
sha256sums=('a060b076382cb5d13eb8f4eaff4f6200b8cce4ebe7527a66686e0e1cf3b54ba5')
arch=('x86_64')

_fullsrcdir() {
    echo "${srcdir}/${_pkgbasename/-/_}-${pkgver}"
}

check() {
    cd "$(_fullsrcdir)"
    python setup.py build_ext --inplace  # Build Cython modules
    examples/djvu-dump-text tests/images/test0.djvu > tests/images/test0_dump-text.txt
    examples/djvu-crop-text tests/images/test0.djvu > tests/images/test0_crop-text.txt
    examples/djvu2png tests/images/test1.djvu tests/images/test1_mask.png
    examples/djvu2png --foreground tests/images/test1.djvu tests/images/test1_foreground.png
    PYTHONPATH='.:tests' python -m unittest
}

build() {
    cd "$(_fullsrcdir)"
    python -m build --wheel --no-isolation
}

package() {
    cd "$(_fullsrcdir)"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
