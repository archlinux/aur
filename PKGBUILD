# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-ezpadova-git
_gitname=ezpadova
pkgname=("python-${_gitname}-git" "python-${_gitname}-doc-git")
pkgver=2.0.r6.g34c3bf6
pkgrel=1
pkgdesc="A python package that allows you to download PADOVA isochrones directly from website"
arch=('any')
url="http://mfouesneau.github.io/ezpadova"
license=('MIT')
makedepends=('git'
             'python-setuptools-scm>=6.2'
             'python-wheel'
             'python-build'
             'python-installer'
             'python-sphinx-automodapi'
             'python-sphinx-copybutton'
             'python-sphinx_mdinclude'
             'python-sphinx-book-theme'
             'python-myst-nb'
             'python-matplotlib'
             'python-pandas'
             'python-scipy'
             'python-pytest')
#checkdepends=('python-pytest-xdist')   # pandas, requests <- scipy, bs4 <- pydata <- book-theme already in makedepends
source=("git+https://github.com/mfouesneau/ezpadova.git")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_gitname}"

    ( set -o pipefail
      git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

build() {
    cd ${srcdir}/${_gitname}
    python -m build --wheel --no-isolation

    msg "Building Docs"
    PYTHONPATH="../build/lib" make -C doc html
}

check() {
    cd ${srcdir}/${_gitname}

    pytest || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count -p xdist -n 4
}

package_python-ezpadova-git() {
    depends=('python>=3.9' 'python-requests' 'python-pandas' 'python-beautifulsoup4' 'python-scipy')
    optdepends=('python-ezpadova-doc: Documentation for EzPadova')
    provides=("${pkgname%-git}")
    conflicts=("${pkgname%-git}")
    cd ${srcdir}/${_gitname}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

package_python-ezpadova-doc-git() {
    pkgdesc="Documentation for Python EzPadova"
    provides=("${pkgname%-git}")
    conflicts=("${pkgname%-git}")
    cd ${srcdir}/${_gitname}/doc/_build

    install -D -m644 ../../LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
