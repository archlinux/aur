# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-s3path
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
#"python-${_pyname}-doc")
pkgver=0.6.4
pkgrel=1
pkgdesc="A pathlib extension for AWS S3 Service"
arch=('any')
url="https://github.com/liormizr/s3path"
license=('Apache-2.0')
makedepends=('python-setuptools-scm')
#            'python-wheel'
#            'python-build'
#            'python-installer')
#            'python-sphinx')
checkdepends=('python-pytest'
#             'python-pytest-xdist'
              'python-boto3'
              'python-smart_open'
              'python-moto')   # only pass for moto>=5; requests <- smart_open
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz"
        "${pkgver}-conftest.py::https://github.com/liormizr/s3path/raw/${pkgver}/tests/conftest.py")
md5sums=('95a5f1f41b4870d8e810c26d63e3fd37'
         'ecf19dfe89edde8462b7887ef823dbaf')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    ln -rs {${srcdir}/${pkgver}-,tests/}conftest.py
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python setup.py build
#   python -m build --wheel --no-isolation

#   msg "Building Docs"
#   PYTHONPATH="../build/lib" make -C docs html
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    PYTHONPATH="build/lib" pytest || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count -p xdist -n 4 #
}

package_python-s3path() {
    depends=('python>=3.9' 'python-boto3>=1.16.35' 'python-smart_open>=5.1.0')
#   optdepends=('python-s3path-doc: Documentation for s3path')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
#   python -m installer --destdir="${pkgdir}" dist/*.whl
}

#package_python-s3path-doc() {
#    pkgdesc="Documentation for Python S3Path"
#    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build
#
#    install -D -m644 ../../LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
#    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
#    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
#}
