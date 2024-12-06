# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-runnotebook-git
_gitname=RunNotebook
_pname=runnotebook
pkgname=("python-${_pname}-git" "python-${_pname}-example-git")
pkgver=0.3.1.r7.g20ce2a7
pkgrel=2
pkgdesc="IPython notebook sphinx extensions"
arch=('any')
url="https://github.com/ngoldbaum/RunNotebook"
license=('BSD')
makedepends=('git'
             'python-setuptools'
             'python-wheel'
             'python-build'
             'python-installer'
             'python-sphinx'
             'python-sphinx-bootstrap-theme'
             'jupyter-nbformat'
             'jupyter-nbconvert'
             'python-matplotlib'
             'python-sympy')
checkdepends=('python-nose')
source=("git+https://github.com/ngoldbaum/RunNotebook")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_gitname}"

    ( set -o pipefail
      git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

prepare() {
    cd ${srcdir}/${_gitname}

    sed -i "s/from nbconvert/from nbconvert.exporters/" ${_gitname}/notebook_sphinxext.py
    sed -i "/sym.numbers.Number/s/sym.numbers/sym.core.numbers/" example/source/SymPy.ipynb
}

build() {
    cd ${srcdir}/${_gitname}
    python -m build --wheel --no-isolation
#   python setup.py build

    msg "Building Examples"
    cd ${srcdir}/${_gitname}/example
    PYTHONPATH="../build/lib" make html
}

check() {
    cd ${srcdir}/${_gitname}

    nosetests
}

package_python-runnotebook-git() {
    depends=('python-sphinx'
             'jupyter-notebook'
             'python-qtconsole'
             'jupyter_console'
             'jupyter-nbconvert'
             'python-ipykernel'
             'python-ipywidgets'
             'jupyter-nbformat')
    optdepends=('python-runnotebook-example: example documentation')
    provides=("${pkgname%-git}")
    conflicts=("${pkgname%-git}")
    cd ${srcdir}/${_gitname}

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
#   python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}

package_python-runnotebook-example-git() {
    pkgdesc="RunNotebook example documentation"
    provides=("${pkgname%-git}")
    conflicts=("${pkgname%-git}")
    cd ${srcdir}/${_gitname}/example/build

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../../LICENSE
    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
