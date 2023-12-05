# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-jplephem
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
pkgver=2.21
pkgrel=2
pkgdesc="Use a JPL ephemeris to predict planet positions"
arch=('any')
url="https://github.com/brandon-rhodes/python-jplephem"
license=('MIT')
makedepends=('python-setuptools'
             'python-wheel'
             'python-build'
             'python-installer')
checkdepends=('python-nose'
              'python-numpy')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz"
        "https://github.com/brandon-rhodes/python-jplephem/raw/master/ci/de405.bsp"
        "https://github.com/brandon-rhodes/python-jplephem/raw/master/ci/de421.bsp")
md5sums=('3b289a5e7b4a8b3437c8ca9f1dc5f361'
         'SKIP'
         'SKIP')

get_pyinfo() {
     [[ $1 == "site" ]] && python -c "import site; print(site.getsitepackages()[0])" || \
             python -c "import sys; print('$1'.join(map(str, sys.version_info[:2])))"
}

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    cp ${srcdir}/*.bsp .
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python -m build --wheel --no-isolation
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

#   python -m unittest discover jplephem
    nosetests || warning "Tests failed" # -v -x
}

package_python-jplephem() {
    depends=('python-numpy')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
