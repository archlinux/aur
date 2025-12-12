# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-ext4
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
#"python-${_pyname}-doc")
pkgver=1.2.2
pkgrel=1
pkgdesc="Library for read only interactions with an ext4 filesystem"
arch=('any')
url="https://github.com/Eeems/python-ext4"
license=('MIT')
makedepends=('python-setuptools'
             'python-build'
             'python-installer')  # wheel required by new setuptools
checkdepends=('python-cachetools'
              'python-crcmod')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz"
        "${pkgver}-test-image.sh::https://github.com/Eeems/python-ext4/raw/refs/tags/v${pkgver}/_test_image.sh"
        "${pkgver}-test.py::https://github.com/Eeems/python-ext4/raw/refs/tags/v${pkgver}/test.py"
        'test.txt')
md5sums=('93b5394cadc8e1cf55caa64015264261'
         '8760a73d1a26816dd22f12721ea3a343'
         '53f4f286ec1bdf834dbf03f10e1ab4ac'
         '8f7fa83c2cc8ea6e90fe94b1efd1a83a')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

#   cp {${srcdir}/${pkgver}-,}test.py
#   install -Dm644 -t txt_tmp ${srcdir}/test.txt
    bash ${srcdir}/${pkgver}-test-image.sh
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation

#   msg "Building Docs"
#   PYTHONPATH="../build/lib" make -C docs html
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

#   dd if=/dev/zero of=test.ext4.tmp count=1024 bs=1024
#   mkfs.ext4 test.ext4.tmp -d txt_tmp
#   echo -n F > test.ext4
#   cat test.ext4.tmp >> test.ext4
    PYTHONPATH="." python ${srcdir}/${pkgver}-test.py #|| warning "Tests failed"
}

package_python-ext4() {
    depends=('python>=3.9' 'python-cachetools' 'python-crcmod>=1.7')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

#package_python-ext4-doc() {
#    pkgdesc="Documentation for Python Ext4"
#    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build
#
#    install -D -m644 ../../LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
#    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
#    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
#}
