# Maintainer: Oystein Sture <oysstu@gmail.com>
# Contributor: 

pkgname=python-climin-git
pkgver=r544.2215b1a
pkgrel=6
epoch=1
pkgdesc="Optimizers for machine learning"
arch=("any")
license=("BSD")
url="https://github.com/BRML/climin"
depends=('python' 'python-numpy' 'python-scipy')
makedepends=('git' 'python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("git+https://github.com/BRML/climin.git")
sha512sums=('SKIP')

prepare() {
    # Do not install tests into site-packages root
    rm "${srcdir}/climin/test/__init__.py"

    # Patch invalid version format
    # Pull request:
    cd "${srcdir}/climin"
    git remote add mlyon https://github.com/m-lyon/climin.git
    git fetch mlyon
    git cherry-pick -n "ce7418505179430a8092c9c9cbf93fc7fc6331dc"
    git cherry-pick -n "7db095c67573e25e6e119d0a6b034a9f1bb1b749"
    git remote remove mlyon
}

build() {
    cd climin
    python -m build --wheel --no-isolation
}

package() {
    cd climin
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

pkgver() {
  cd climin
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
