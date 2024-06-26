# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-chalk
_pname=${pkgbase#python-}
_pyname=chalk_diagrams
#"python-${_pyname}-doc")
pkgname=("python-${_pname}")
pkgver=0.2.2
pkgrel=1
pkgdesc="A declarative drawing API in Python"
arch=('any')
url="https://chalk-diagrams.github.io"
license=('MIT')
makedepends=('python-setuptools'
             'python-wheel'
             'python-build'
             'python-installer')
#            'mkdocs')
checkdepends=('python-pytest'
              'python-hypothesis'
              'python-colour'
              'python-pillow'
              'python-svgwrite'
              'python-chalk-planar')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz"
        "${pkgver}-test_envelope.py::https://github.com/chalk-diagrams/chalk/raw/v${pkgver}/tests/test_envelope.py"
        "${pkgver}-test_reverse_trail.py::https://github.com/chalk-diagrams/chalk/raw/v${pkgver}/tests/test_reverse_trail.py")
sha256sums=('2c7ebebc4c09d00a27d91955d9294962fa0ea676b2a3d098ac3d22b3b6e70af0'
            'ac032fc511f48f18ed71da9b14a24fc2c5bc725fcbf981590529cb6eaafb78d2'
            'b21a60b21169ea657041ec195c891801ac24dd902c9779b10b8220b7971e064c')

get_pyver() {
    python -c "import sys; print('$1'.join(map(str, sys.version_info[:2])))"
}

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    mkdir tests
    for ts in ${srcdir}/${pkgver}-test*; do ln -rs $ts tests/${ts##*-}; done
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation

#   msg "Building Docs"
#   mkdocs build
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    ln -rs ${srcdir}/${_pyname}-${pkgver}/${_pyname/-/_}*egg-info \
        build/lib/${_pyname/-/_}-${pkgver}-py$(get_pyver .).egg-info
    PYTHONPATH="build/lib" pytest || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count
}

package_python-chalk() {
    depends=('python>=3.7'
             'python-toolz'
             'python-colour'
             'python-svgwrite'
             'python-pillow'
             'python-loguru'
             'python-chalk-planar'
             'python-typing_extensions'
             'python-importlib-metadata')
    optdepends=('python-pylatex: tikz'
                'python-cairo: png'
                'python-cairosvg: svg')
#               'python-chalk-doc: Documentation for chalk diagrams')
    provides=("${pkgname}-diagrams=${pkgver}")
    conflicts=("${pkgname}-diagrams")
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
    install -D -m644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

#package_python-chalk-doc() {
#    pkgdesc="Documentation for chalk diagrams"
#    cd ${srcdir}/${_pyname}-${pkgver}
#
#    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
#    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
#    cp -a site "${pkgdir}/usr/share/doc/${pkgbase}"
#}
