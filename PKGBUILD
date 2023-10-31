# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-asdf
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
#"python-${_pyname}-doc")
pkgver=3.0.1
pkgrel=1
pkgdesc="A Python tool for reading and writing Advanced Scientific Data Format (ASDF) files"
arch=('any')
url="https://asdf.readthedocs.io"
license=('BSD')
makedepends=('python-setuptools-scm'
             'python-wheel'
             'python-build'
             'python-installer')
#            'python-sphinx-asdf>=0.2.2'
#            'python-sphinx-inline-tabs'
#            'python-mistune>=3'
#            'python-numpy'
#            'python-yaml'
#            'python-semantic-version>=2.8'
#            'python-jmespath>=0.6.2'
#            'python-asdf-standard>=1.0.1'
#            'python-asdf_transform_schemas>=0.3.0'
#            'graphviz'
#            'python-sphinx-astropy'
#            'python-astropy>=5.0.4'
#            'python-toml')
checkdepends=('python-pytest-doctestplus'
              'python-pytest-remotedata'
              'python-numpy'
              'python-psutil'
              'python-yaml'
              'python-importlib-metadata'
              'python-semantic-version'
#              'python-astropy'
              'python-asdf-standard'
              'python-jmespath'
#              'python-asdf_transform_schemas'
              'python-lz4'
              'python-fsspec'
              'python-aiohttp'
              'python-requests')
# psutil pulled in by pytest-openfiles; attrs <- aiohttp, jsonschema
#             'python-virtualenv'
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('244963973e642ba977f152e16bb8af15')

get_pyver() {
    python -c "import sys; print('$1'.join(map(str, sys.version_info[:2])))"
}

#prepare() {
#   cd ${srcdir}/${_pyname}-${pkgver}
#
#   sed -i "s/2.3.0/2.4.0/" compatibility_tests/test_file_compatibility.py
    #sed -e "/ignore:numpy/a \    'ignore:ASDF functionality for astropy is being moved:astropy.utils.exceptions.AstropyDeprecationWarning'," \
    #    -e "/ignore:numpy/a \    'ignore:Unable to locate schema file:asdf.exceptions.AsdfWarning'" \
    #    -i pyproject.toml
#   sed "/ignore:numpy/a \    'ignore:ASDF functionality for astropy is being moved:astropy.utils.exceptions.AstropyDeprecationWarning'" \
#       -i pyproject.toml
#}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation

#   msg "Building Docs"
#   ln -rs ${srcdir}/${_pyname}-${pkgver}/${_pyname/-/_}*egg-info \
#       build/lib/${_pyname/-/_}-${pkgver}-py$(get_pyver).egg-info
#   PYTHONPATH="../build/lib" make -C docs html
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    # Segmentation fault
    PYTHONPATH="build/lib:${PYTHONPATH}" pytest \
        --deselect=asdf/_tests/_regtests/test_1530.py::test_update_with_memmapped_data_can_make_view_data_invalid #|| warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count --remote-data
}

package_python-asdf() {
    depends=('python>=3.9'
             'python-numpy>=1.22'
             'python-jmespath>=0.6.2'
             'python-attrs>=20.1.0'
             'python-packaging>=19.0'
             'python-importlib-metadata>=4.11.4'
             'python-yaml>=5.4.1'
             'python-semantic-version>=2.8'
             'python-asdf-standard>=1.0.1'
             'python-asdf_transform_schemas>=0.3'
             'python-asdf_unit_schemas>=0.1')
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
