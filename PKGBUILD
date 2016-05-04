# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>
_pkgname=project-generator
pkgname=(${_pkgname} python2-${_pkgname})
pkgver=0.8.15
pkgrel=2
pkgdesc="Project generators for various embedded tools (IDE)"
url="https://github.com/project-generator/project_generator"
depends=('python'
         'python-setuptools'
         'python-yaml'
         'python-jinja'
         'python-xmltodict'
         'project-generator-definitions'
         )
optdepends=()
license=('Apache')
arch=('any')
source=("https://github.com/project-generator/${_pkgname/-/_}/archive/v${pkgver}.tar.gz")
sha512sums=('8eaf11a278d7c62e8ae7118e684e3cd6f4a859acd4e117fca6b980132923b5aebdabbb2ff2f42781e980749e7168989eda645d895644c34adc7de84ea349f369')

prepare() {
    mv "${srcdir}/${_pkgname//-/_}-${pkgver}" "${srcdir}/${_pkgname}-${pkgver}"
    cp -a "${srcdir}/${_pkgname}-${pkgver}"{,-py2}
}

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"

    # Python3 has argparse
    sed -i -e '/argparse/d' requirements.txt

    python setup.py build

    # Build python2 library
    cd "${srcdir}/${_pkgname}-${pkgver}-py2"
    python2 setup.py build
}

package_project-generator() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python  setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-project-generator() {
    depends=('python2'
             'python2-setuptools'
             'python2-yaml'
             'python2-jinja'
             'python2-xmltodict'
             'python2-project-generator-definitions'
            )

    cd "${srcdir}/${_pkgname}-${pkgver}-py2"
    python2 setup.py install --root="${pkgdir}" --optimize=1

    # Python3 package provides files under /usr/bin
    rm -rf "${pkgdir}/usr/bin"
}
