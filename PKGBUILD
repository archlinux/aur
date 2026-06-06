# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=reconspread
pkgver=0.0.1
pkgrel=1
pkgdesc='Extract links from websites'
arch=('any')
url='https://github.com/reconurge/reconspread'
license=('MIT')
depends=('python-beautifulsoup4' 'python-requests')
makedepends=('python-build' 'python-installer' 'python-setuptools')
checkdepends=('python-pytest')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e2ed6c10c914aa2808eb0cdd3784dde22b460336482badf981621029daa26eba')

latestver() {
    gh api --paginate repos/reconurge/reconspread/tags --jq '.[].name' |
        sed -nE 's/^v([0-9]+(\.[0-9]+)*)$/\1/p' | sort -V | tail -1
}

prepare() {
    cd "${pkgname}-${pkgver}"
    sed -i \
        -e "s/version=\"0.1.0\"/version=\"${pkgver}\"/" \
        -e '/"lxml",/d' \
        -e 's/description="CLI tool and library to extract emails and phone numbers from websites"/description="CLI tool and library to extract links from websites"/' \
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
