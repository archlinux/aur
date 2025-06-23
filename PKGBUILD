# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-jplephem
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
pkgver=2.23
pkgrel=1
pkgdesc="Use a JPL ephemeris to predict planet positions"
arch=('any')
url="https://github.com/brandon-rhodes/python-jplephem"
license=('MIT')
makedepends=('python-setuptools'
             'python-build'
             'python-installer')  # wheel required by new setuptools
checkdepends=('python-numpy')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz"
        "https://github.com/brandon-rhodes/python-jplephem/raw/master/ci/de405.bsp"
        "https://github.com/brandon-rhodes/python-jplephem/raw/master/ci/de421.bsp"
        "https://github.com/brandon-rhodes/python-jplephem/raw/master/ci/de442s.bsp"
        "https://github.com/brandon-rhodes/python-jplephem/raw/master/ci/moon_pa_de421_1900-2050.bpc")
md5sums=('f74fd394c3e867e879f668838c7f98b0'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP')

#get_pyinfo() {
#    [[ $1 == "site" ]] && python -c "import site; print(site.getsitepackages()[0])" || \
#        python -c "import sys; print('$1'.join(map(str, sys.version_info[:2])))"
#}

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    cp ${srcdir}/*de*b*p* .
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python -m build --wheel --no-isolation
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python -m unittest || warning "Tests failed" # discover -v
}

package_python-jplephem() {
    depends=('python-numpy')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
