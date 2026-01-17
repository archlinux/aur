# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-pyfive
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python-${_pyname}-doc")
pkgver=1.0.1
pkgrel=1
pkgdesc="A pure python HDF5 reader"
arch=('any')
url="https://pyfive.readthedocs.io"
license=('BSD-3-Clause')
makedepends=('python-setuptools-scm>=8'
             'python-build'
             'python-installer'
             'python-sphinx_rtd_theme'
             'python-autodocsumm'
             'python-numpy')  # wheel required by new setuptools
checkdepends=('python-pytest-html'
#             'python-pytest-timeout'
              'python-pytest-cov'
              'python-dask'
              'python-flask-cors'
              'python-h5py'
              'python-lzf'
              'python-moto'
              'python-netcdf4'
              'python-h5netcdf'
              'python-s3fs')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz"
        'Makefile')
md5sums=('b34f05c8f78c6bc036577f4714596b83'
         'a6aa4bc42b138d75f938065a0994c3e1')

get_pyinfo() {
    [[ $1 == "site" ]] && python -c "import site; print(site.getsitepackages()[0])" || \
        python -c "import sys; print('$1'.join(map(str, sys.version_info[:2])))"
}

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    ln -s ${srcdir}/Makefile doc
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation

    msg "Building Docs"
    PYTHONPATH="../build/lib" make -C doc html
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    # deselect tests that may take long time
    python -m venv --system-site-packages test-env
    test-env/bin/python -m installer dist/*.whl
    PATH="${srcdir}/${_pyname}-${pkgver}/test-env/bin:${PATH}" \
        test-env/bin/python -m pytest -vv -l -ra --color=yes -o console_output_style=count --timeout 300 # no xdist: Address already in use # || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count --timeout 300 # no xdist: Address already in use #
}

package_python-pyfive() {
    depends=('python>=3.10' 'python-numpy>=2')
    optdepends=('python-pyfive-doc: Documentation for Pyfive')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

package_python-pyfive-doc() {
    pkgdesc="Documentation for Python Pyfive"
    cd ${srcdir}/${_pyname}-${pkgver}/doc/_build

    install -D -m644 ../../LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
