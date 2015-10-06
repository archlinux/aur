# Maintainer: Myles English <myles at rockhead dot biz>
pkgname=ffc-git
pkgver=20150925
pkgrel=2
pkgdesc="A compiler for finite element variational forms."
_branch=master
arch=('i686' 'x86_64')
url="https://bitbucket.org/fenics-project/ffc"
license=('LGPL')
groups=('fenics-git')
depends=('python2' 'fiat-git' 'ufl-git' 'python2-numpy' 'swig' 'python2-six')
optdepends=('FErari: optimisation support')
makedepends=('git' 'python2' 'sed')
provides=('ffc')
conflicts=('ffc')
options=(!emptydirs)
source=("ffc::git+https://bitbucket.org/fenics-project/ffc.git#branch=${_branch}")
md5sums=('SKIP')

pkgver() {
    cd ffc
    git log --format="%cd" --date=short -1 | sed 's/-//g'
}

prepare() {
    cd ffc
    find ./ -name "*" -type f -exec \
	sed -i 's|^#!.*python$|#!/usr/bin/python2|' {} \;
}

build() {
    cd ffc
    python2 setup.py build
}

package() {
    cd ffc
    python2 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1

    # surely the setup.py should handle this?
    sed -i 's#'"${pkgdir}"'#/usr#g' "${pkgdir}/usr/lib/pkgconfig/ufc-1.pc"
    sed -i 's#'"${pkgdir}"'#/usr#g' "${pkgdir}/usr/share/ufc/UFCConfig.cmake"
}
