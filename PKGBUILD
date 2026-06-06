# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=recontrack
pkgver=0.0.1
pkgrel=1
pkgdesc='Extract tracking codes from websites'
arch=('any')
url='https://github.com/reconurge/recontrack'
license=('MIT')
depends=('python-beautifulsoup4' 'python-requests')
makedepends=('python-build' 'python-installer' 'python-setuptools')
checkdepends=('python-pytest')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('4cb1b2b8f90c9bf6d8906f306ad3de195d8b03ec9766ac0c4f1dcd190a79ed52')

latestver() {
    gh api --paginate repos/reconurge/recontrack/tags --jq '.[].name' |
        sed -nE 's/^v([0-9]+(\.[0-9]+)*)$/\1/p' | sort -V | tail -1
}

prepare() {
    cd "${pkgname}-${pkgver}"
    sed -i \
        -e "s/version=\"0.1.0\"/version=\"${pkgver}\"/" \
        -e "s/packages=find_packages()/packages=find_packages(exclude=('tests', 'tests.*'))/" \
        setup.py
}

build() {
    cd "${pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

check() {
    cd "${pkgname}-${pkgver}"
    PYTHONPATH=. pytest -q
}

package() {
    cd "${pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
