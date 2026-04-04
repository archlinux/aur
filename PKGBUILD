# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-ext4
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
#"python-${_pyname}-doc")
pkgver=1.3.1
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
              'python-crcmod'
          )
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz"
        "${pkgver}-test-image.sh::https://github.com/Eeems/python-ext4/raw/refs/tags/v${pkgver}/_test_image.sh"
        "${pkgver}-test.py::https://github.com/Eeems/python-ext4/raw/refs/tags/v${pkgver}/test.py"
#       "test-image-${pkgver}.sh"
        'test.txt')
md5sums=('a428992610036c31fd463d4c8165df60'
         '53e62f3008d498290398b530e131e290'
         'fc6838dc844a2bb11b5404186b846be7'
         '8f7fa83c2cc8ea6e90fe94b1efd1a83a')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

#   cp {${srcdir}/${pkgver}-,}test.py
#   install -Dm644 -t txt_tmp ${srcdir}/test.txt
#   sed -i 's:sudo ::g' ${srcdir}/${pkgver}-test-image.sh
    bash ${srcdir}/${pkgver}-test-image.sh || warning "test-image.sh failed, checking phase may not passed"
#   bash ${srcdir}/test-image-${pkgver}.sh
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation #--skip-dependency-check

#   msg "Building Docs"
#   PYTHONPATH="../build/lib" make -C docs html
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

#   dd if=/dev/zero of=test.ext4.tmp count=1024 bs=1024
#   mkfs.ext4 test.ext4.tmp -d txt_tmp
#   echo -n F > test.ext4
#   cat test.ext4.tmp >> test.ext4
#   PYTHONPATH="." python ${srcdir}/${pkgver}-test.py #|| warning "Tests failed"
    PYTHONPATH="build/lib" python ${srcdir}/${pkgver}-test.py || warning "Tests failed"
}

package_python-ext4() {
    depends=('python>=3.10' 'python-cachetools' 'python-crcmod>=1.7')
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
