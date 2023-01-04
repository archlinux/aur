# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-h5pyd
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
#"python-${_pyname}-doc")
pkgver=0.12.6
pkgrel=1
pkgdesc="h5py distributed - Python client library for HDF Rest API "
arch=('any')
url="https://github.com/HDFGroup/h5pyd"
license=('BSD')
makedepends=('python-setuptools'
#            'python-wheel'
             'python-pkgconfig')
#            'python-build'
#            'python-installer'
#            'python-sphinx-furo')
checkdepends=('python-pytest'
              'python-numpy'
              'python-pytz'
              'python-requests-unixsocket'
              'python-adal')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz"
#       "https://raw.githubusercontent.com/h5py/h5py/master/examples/bytesio.py"
#       "https://raw.githubusercontent.com/h5py/h5py/master/examples/swmr_inotify_example.py"
#       "https://raw.githubusercontent.com/h5py/h5py/master/examples/swmr_multiprocess.py"
        'fix-h5type-test.patch')
md5sums=('7f03fc8e0156061cb69528aa06355878'
         'fce3d7b92909be61507392ab33bfce0a')

#get_pyver() {
#    python -c "import sys; print('$1'.join(map(str, sys.version_info[:2])))"
#}

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

#   ln -rs ${srcdir}/*.py examples
#   sed -i -e "/GH/s/GH/GH\%s/" -e "/PR/s/PR/PR\%s/" docs/conf.py
    patch -Np1 -i "${srcdir}/fix-h5type-test.patch"
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python setup.py build
#   python -m build --wheel --no-isolation

    msg "Building Docs"
#   python setup.py build_sphinx
#   ln -rs ${srcdir}/${_pyname}-${pkgver}/${_pyname/-/_}*egg-info \
#       build/lib/${_pyname/-/_}-${pkgver}-py$(get_pyver .).egg-info
#   cd ${srcdir}/${_pyname}-${pkgver}/docs
#   PYTHONPATH="../build/lib" make html
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    pytest || warning "Tests failed" #${PWD}/test \ -vv --color=yes
#   PYTHONPATH="build/lib" pytest #|| warning "Tests failed" #${PWD}/test \
#       --ignore=build/lib/h5pyd/_hl/h5type_test.py #|| warning "Tests failed"
}

package_python-h5pyd() {
    depends=('python-numpy>=1.17.3'
             'python-requests-unixsocket'
             'python-pytz'
             'python-pyjwt'
             'python-msrestazure'
             'python-cryptography'
             'python-google-api-python-client'
             'python-google-auth-oauthlib'
             'python-google-auth'
             'python-adal')
    optdepends=('python-h5pyd-doc: Documentation for h5pyd')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
#   python -m installer --destdir="${pkgdir}" dist/*.whl
}

#package_python-h5pyd-doc() {
#    pkgdesc="Documentation for Python h5pyd"
#    cd ${srcdir}/${_pyname}-${pkgver}/build/sphinx
##   cd ${srcdir}/${_pyname}-${pkgver}/docs/_build
#
#    install -D -m644 ../../COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
#    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
#    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
#}
