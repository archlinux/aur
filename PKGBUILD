# Maintainer: Lucas H. Gabrielli <heitzmann@gmail.com>

pkgname=python-basix-git
pkgdesc="Python interface of FEniCS for ordinary and partial differential equations."
pkgver=20210202
pkgrel=1
arch=('i686' 'x86_64')
url="https://github.com/FEniCS/basix"
license=('GPL3')
groups=('fenics-git')
depends=('eigen' 'pybind11')
makedepends=('python-setuptools' 'python-wheel'
'python-scikit-build' 'xtensor' 'xtensor-blas' 'git'
'ninja')
options=(!emptydirs)
source=("basix::git+https://github.com/FEniCS/basix.git")
md5sums=('SKIP')


prepare() {
  cd basix
  git checkout $(git rev-list -1 --before="${pkgver:0:4}-${pkgver:4:2}-${pkgver:6:2}" main)
}

pkgver() {
    cd basix
    git log --format="%cd" --date=short -1 | sed 's/-//g'
}

build() {
    cd basix
    python setup.py build
}

package() {
    cd basix
    python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
    ln -s /usr/lib/python3.9/site-packages/basix/lib/libbasix.so "${pkgdir}/usr/lib/libbasix.so"
}
