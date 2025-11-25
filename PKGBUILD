# Maintainer: ZsurNZ <didier.mathieu1@free.fr>
pkgname=python-ogre
pkgver=0.1.0
pkgrel=1
pkgdesc="Ogre: A Python Package for Molecular Crystal Surface Generation with Applications to Surface Energy and Crystal Habit Prediction"
arch=('any')
url="https://github.com/Shuyangzero/Ogre"
license=('BSD')
depends=('python' 'python-numpy' 'python-pymatgen' 'python-setuptools')
makedepends=('git' 'python-pip')
source=("git+https://github.com/Shuyangzero/Ogre.git" "utils.patch")
md5sums=('SKIP' 'f2e1a2ed57d07e16d05977436128f806')

prepare() {
    cd "$srcdir/Ogre"
    patch "ogre/utils/utils.py" < "$srcdir/utils.patch"
    sed -i 's/mg.Structure/mg.core.Structure/' 'ogre/generators.py'
    sed -i 's/mg.PeriodicSite/mg.core.PeriodicSite/' 'ogre/generators.py'
    sed -i 's/utils.modify_poscar(file_name)/#utils.modify_poscar(file_name)/' 'ogre/generators.py'
    sed -i 's/from pymatgen/from pymatgen.core/' 'ibslib/structure.py'
    sed -i 's/from pymatgen/from pymatgen.core/' 'ibslib/struct_dict.py'
}

build() {
    cd "$srcdir/Ogre"
    python setup.py build
}

package() {
    cd "$srcdir/Ogre"
    python setup.py install --root="$pkgdir" --optimize=1
    install -Dm644 runOgre.py "$pkgdir/usr/share/ogre/runOgre.py"
    install -Dm644 runOgreSWAMP.py "$pkgdir/usr/share/ogre/runOgreSWAMP.py"
}
