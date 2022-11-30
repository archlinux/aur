# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-asdf-astropy
_pname=${pkgbase#python-}
_pyname=${_pname/-/_}
pkgname=("python-${_pname}")
#"python-${_pname}-doc")
pkgver=0.3.0
pkgrel=1
pkgdesc="ASDF serialization support for astropy"
arch=('any')
url="https://asdf-astropy.readthedocs.io"
license=('BSD')
makedepends=('python-setuptools-scm'
             'python-wheel'
             'python-build'
             'python-installer')
##            'python-sphinx-astropy'
##            'python-astropy'
#             'python-sphinx-asdf'
#             'python-asdf_coordinates_schemas' # bug 76244
checkdepends=('python-pytest-doctestplus'
              'python-pytest-astropy-header'
              'python-asdf'
              'python-astropy'
              'python-scipy'
              'python-asdf_coordinates_schemas')   # 'python-asdf' 'python-astropy' by sphinx-asdf
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('f8a62c505d4ae633e4beb63844114afa')

get_pyver() {
    python -c "import sys; print('$1'.join(map(str, sys.version_info[:2])))"
}

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    sed -i "/oldest-supported-numpy/d" pyproject.toml
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation

    # https://bugs.archlinux.org/task/76244
#   msg "Building Docs"
#   ln -rs ${srcdir}/${_pyname}-${pkgver}/${_pyname/-/_}*egg-info \
#       build/lib/${_pyname/-/_}-${pkgver}-py$(get_pyver .).egg-info
#   cd ${srcdir}/${_pyname}-${pkgver}/docs
#   PYTHONPATH="../build/lib" make html
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    PYTHONPATH="build/lib:${PYTHONPATH}" pytest || warning "Tests failed" # bug 76244; -vv --color=yes
}

package_python-asdf-astropy() {
    depends=('python>=3.8'
             'python-astropy>=5.0.4'
             'python-asdf>=2.8.0'
             'python-importlib_resources>=3'
             'python-asdf_coordinates_schemas'
             'python-asdf_transform_schemas>=0.2.2'
             'python-packaging>=16.0')
    optdepends=('python-asdf-astropy-doc: Documentation for Python ASDF-AstroPy')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE.rst
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" licenses/*
    install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.rst
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

#package_python-asdf-astropy-doc() {
#    pkgdesc="Documentation for Python ASDF-AstroPy"
#    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build
#
#    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../../LICENSE.rst
#    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../../licenses/*
#    install -dm755 "${pkgdir}/usr/share/doc/${pkgbase}"
#    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
#}
