# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-ext4
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
pkgver=1.4.1
pkgrel=1
pkgdesc="Library for read only interactions with an ext4 filesystem"
arch=('i686' 'x86_64')
url="https://github.com/Eeems/python-ext4"
license=('MIT')
makedepends=('python-setuptools'
    'nuitka>=4.0.6'
    'python-build'
    'python-installer'
    'xz')
checkdepends=('python-cachetools'
    'python-crcmod')
# To generate a new set of test images, download the following script
# https://github.com/Eeems/python-ext4/raw/refs/tags/v${pkgver}/_test_image.sh
# and create a new test-images.tar.gz from the output with: XZ_OPT='-9' tar cvJf test-images.tar.xz test*.ext4*
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz"
    "${pkgver}-test.py::https://github.com/Eeems/python-ext4/raw/refs/tags/v${pkgver}/test.py"
    "test-images.tar.xz")
sha256sums=('48e92b5afa5d8a43518204a611d2318a301c894212a2c4823c00f49b953636c3'
            'd91a49f50cdf02f4d2ca718e1ef9bc0e4608bdc8eb4be6cacfea7011d775744a'
            'a71e1087fed8d345c7037bdc1cc86a218228547dc4b2a7012b71208804eb14f9')

prepare() {
    cd ${srcdir}
    tar xf test-images.tar.xz
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build \
        --wheel \
        --no-isolation \
        --config-setting=build_with_nuitka=false # Until nuitka support python 3.14
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
