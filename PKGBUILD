# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-ext4
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
pkgver=1.3.3
pkgrel=1
pkgdesc="Library for read only interactions with an ext4 filesystem"
arch=('i686' 'x86_64')
url="https://github.com/Eeems/python-ext4"
license=('MIT')
makedepends=('python-setuptools'
             'nuitka>=4.0.6'
             'python-build'
             'python-installer')  # wheel required by new setuptools
checkdepends=('python-cachetools'
              'python-crcmod')
# To generate a new set of test images, download the following script
# https://github.com/Eeems/python-ext4/raw/refs/tags/v${pkgver}/_test_image.sh
# and create a new test-images.tar.gz from the output with: tar czvf test-images.tar.gz test*.ext4*
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz"
        "${pkgver}-test.py::https://github.com/Eeems/python-ext4/raw/refs/tags/v${pkgver}/test.py"
        "test-images.tar.gz")
sha256sums=('9e48bbea4d705b3237b5d32a83cc8496bd893a2f29b9a721a4cec94b0044ac23'
            '05bad98bf8ad3eeb7e23abfad68cca7dc3c54352155457d11d113b99edb76bd4'
            '6f93cb7c46b663866d7f90209e0993aa2503ff0258f92bfde4f1d7864090cf02')

prepare() {
    cd ${srcdir}
    tar xf test-images.tar.gz
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation
}

check() {
    cd ${srcdir}
    PYTHONPATH="${_pyname}-${pkgver}/build/lib" python ${pkgver}-test.py || warning "Tests failed"
}

package_python-ext4() {
    depends=('python>=3.10' 'python-cachetools' 'python-crcmod>=1.7')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
