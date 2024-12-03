# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-czml3
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
pkgver=2.0.1
pkgrel=1
pkgdesc="Python 3 library to write CZML"
arch=('any')
url="https://github.com/poliastro/czml3"
license=('MIT')
makedepends=('python-setuptools-scm'
             'python-build'
             'python-installer')  # wheel required by new setuptools
#            'python-versioneer')
checkdepends=('python-pytest'
#             'subversion'
              'python-astropy'
              'python-pydantic'
              'python-dateutil'
              'python-w3lib')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
#       "https://github.com/poliastro/czml3/raw/main/tests/simple.czml"
#       "https://github.com/poliastro/czml3/raw/main/tests/smiley.png")
md5sums=('38260ba5a63e8f8d137b3933452572ef')
#        'SKIP'
#        'SKIP')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}
#
#    rm versioneer.py
#    cp ${srcdir}/{simple.czml,smiley.png} tests
    sed -i "/lambda/s/_:/:/" src/czml3/core.py
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python -m build --wheel --no-isolation
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

#   svn export https://github.com/poliastro/czml3/trunk/tests || warning "Failed to fetch testing files"
    PYTHONPATH="build/lib" pytest || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count #
}

package_python-czml3() {
    depends=('python>=3.10'
             'python-pydantic'
             'python-dateutil<3'
             'python-w3lib'
             'python-typing_extensions>=4.12.0'
             'python-strenum>=0.4.0')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
