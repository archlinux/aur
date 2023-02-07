# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-asdf
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
#"python-${_pyname}-doc")
pkgver=2.14.3
pkgrel=1
pkgdesc="A Python tool for reading and writing Advanced Scientific Data Format (ASDF) files"
arch=('any')
url="https://asdf.readthedocs.io"
license=('BSD')
makedepends=('python-setuptools-scm'
             'python-wheel'
             'python-build'
             'python-installer')
#            'python-sphinx-asdf'
#            'python-numpy>=1.10'
#            'python-jsonschema>=4.0.1'
#            'python-yaml>=3.10'
#            'python-semantic-version>=2.8'
#            'python-importlib-metadata'
#            'python-jmespath>=0.6.2'
#            'python-asdf-standard>=1.0.1'
#            'python-asdf_transform_schemas>=0.3.0'
#            'python-sphinx-astropy'
#            'python-astropy>=5.0.4'
#            'graphviz'
#            'python-toml')
checkdepends=('python-pytest-doctestplus'
              'python-pytest-openfiles'
              'python-pytest-remotedata'
              'python-numpy'
              'python-jsonschema'
              'python-yaml'
              'python-importlib-metadata'
              'python-semantic-version'
              'python-astropy'
              'python-asdf-standard'
              'python-jmespath'
              'python-asdf_transform_schemas'
              'python-lz4'
              'python-fsspec'
              'python-aiohttp'
              'python-requests')    # psutil pulled in by pytest-openfiles
#              'python-virtualenv'
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('4b7198bc06a8d2c81e5296c7e7d7a9b0')

get_pyver() {
    python -c "import sys; print('$1'.join(map(str, sys.version_info[:2])))"
}

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

#   sed -i "s/2.3.0/2.4.0/" compatibility_tests/test_file_compatibility.py
    #sed -e "/ignore:numpy/a \    'ignore:ASDF functionality for astropy is being moved:astropy.utils.exceptions.AstropyDeprecationWarning'," \
    #    -e "/ignore:numpy/a \    'ignore:Unable to locate schema file:asdf.exceptions.AsdfWarning'" \
    #    -i pyproject.toml
    sed "/ignore:numpy/a \    'ignore:ASDF functionality for astropy is being moved:astropy.utils.exceptions.AstropyDeprecationWarning'" \
        -i pyproject.toml
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation

#   msg "Building Docs"
#   ln -rs ${srcdir}/${_pyname}-${pkgver}/${_pyname/-/_}*egg-info \
#       build/lib/${_pyname/-/_}-${pkgver}-py$(get_pyver).egg-info
#   cd ${srcdir}/${_pyname}-${pkgver}/docs
#   PYTHONPATH="../build/lib" make html
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    PYTHONPATH="build/lib:${PYTHONPATH}" pytest "build/lib" --remote-data || warning "Tests failed" # -vv --color=yes
}

package_python-asdf() {
    depends=('python>=3.8'
             'python-numpy>=1.18'
             'python-jmespath>=0.6.2'
             'python-jsonschema>=4.0.1'
             'python-packaging>=16.0'
             'python-importlib-metadata>=4.11.4'
             'python-yaml>=3.10'
             'python-semantic-version>=2.8'
             'python-asdf-standard>=1.0.1'
             'python-asdf_transform_schemas>=0.3.0'
             'python-asdf_unit_schemas>=0.1.0')
    optdepends=('python-astropy: Support for units, time, transform, wcs, or running the tests'
                'python-lz4>=0.10: Support for lz4 compression'
                'python-asdf-doc: Documentation for Python-ASDF'
                'python-pytest-astropy: For testing')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
    install -D -m644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.rst
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

#package_python-asdf-doc() {
#    pkgdesc="Documentation for Python ASDF module"
#    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build
#
#    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../../LICENSE
#    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
#    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
#}
