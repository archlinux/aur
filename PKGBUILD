# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>
_pkgname=project-generator
pkgname=(${_pkgname} python2-${_pkgname})
pkgver=0.9.13
pkgrel=1
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
source=("https://github.com/project-generator/${_pkgname/-/_}/archive/${pkgver}.tar.gz")
sha512sums=('5987d318241e446b1ef860b15a88ee98dddb0fccedca0a29501eb051d2941aceac43bb7e1e0ef18bb0f47072e3a7645ef9a0a335d02b3eef9ae65bc811b21a04')

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
