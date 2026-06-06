# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=reconcrawl
pkgver=0.0.1
pkgrel=1
pkgdesc='Extract emails and phone numbers from websites'
arch=('any')
url='https://github.com/reconurge/reconcrawl'
license=('MIT')
depends=('python-beautifulsoup4' 'python-requests')
makedepends=('python-build' 'python-installer' 'python-setuptools')
checkdepends=('python-pytest')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('cf74332dff0e68a32a58579a6441af8f0451ded31fa61bdbb649d7ad326723fe')

latestver() {
    gh api --paginate repos/reconurge/reconcrawl/tags --jq '.[].name' |
        sed -nE 's/^v([0-9]+(\.[0-9]+)*)$/\1/p' | sort -V | tail -1
}

prepare() {
    cd "${pkgname}-${pkgver}"
    sed -i \
        -e "s/version=\"0.1.0\"/version=\"${pkgver}\"/" \
        -e '/"lxml",/d' \
        -e "s/packages=find_packages()/packages=find_packages(exclude=('tests', 'tests.*'))/" \
        setup.py
    sed -i 's/"--verify_ssl", "-vssl", action="store_true", help="Whether to verify SSL certificates (default: True)"/"--no-verify-ssl", action="store_false", dest="verify_ssl", default=True, help="Disable SSL certificate verification"/' reconcrawl/cli.py
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
