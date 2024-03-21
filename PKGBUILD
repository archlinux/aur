# Maintainer: Lucas <lucas.biaggi@kde.org>

pkgname=python-taskw-ng
pkgver=0.2.6
pkgrel=1
pkgdesc="Python bindings for your taskwarrior database next generation"
url="https://github.com/bergercookie/taskw-ng/"
depends=("python" "python-pytz" "python-dateutil" "python-kitchen" "task")
makedepends=('python' 'python-poetry-core')
conflicts=('python-taskw')
provides=('python-taskw')
replaces=('python-taskw')
license=("GPL")
arch=('any')
source=("taskw-ng-${pkgver}.tar.gz::https://github.com/bergercookie/taskw-ng/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('0004525d1d8320a4b606432a7c3db8ff8da102a5d7754474a675596f6ffc0e4f')

prepare() {
    mv ../pyproject.patch .
    patch -i pyproject.patch -u ${srcdir}/taskw-ng-${pkgver}/pyproject.toml
    sed -i 's/(taskw-ng|taskw_ng)/taskw/g' ${srcdir}/taskw-ng-${pkgver}/pyproject.toml
    sed -i "s/^version\s=.*/version = \"${pkgver}\"/g" ${srcdir}/taskw-ng-${pkgver}/pyproject.toml
}

build(){
    cd "${srcdir}/taskw-ng-${pkgver}"
    python -m build -wn 
}

package(){
    PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer -d "${pkgdir}" "${srcdir}/taskw-ng-${pkgver}/dist/taskw_ng-${pkgver}-py3-none-any.whl"

}
