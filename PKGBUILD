# Maintainer: Laura Demkowicz-Duffy <dev at demkowiczduffy.co.uk>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=python-cucumber-tag-expressions
_name=tag-expressions
pkgver=9.1.0
pkgrel=1
pkgdesc="Provides a tag-expression parser and evaluation logic for cucumber/behave"
url="https://github.com/cucumber/tag-expressions"
license=('MIT')
arch=('any')
depends=('python')
makedepends=('python-build' 'python-uv-build' 'python-installer' 'python-setuptools' 'python-setuptools-scm' 'python-wheel' 'uv')
# checkdepends=('python-pytest')
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
        "release_uv_version.patch")
sha512sums=('d3886c65b678fd87b093fca88e243972322a48afabfeb2e3d38b69ce813e3705924e1475e77b54f98687f9c4235bc343cc9d7c20ba194880d9acceb228161275'
            'fb74eb00a700aa3a7e02bc02f94cb7c1493eae61d3c99f6c1a4cf62462abde47210e32735e601ec76a0136dcd94c07ad992df7d413fcdfa1fa112000695a961f')

prepare() {
    cd "${_name}-${pkgver}"
    patch -p1 -i ../release_uv_version.patch
}

build() {
    cd "${_name}-${pkgver}/python"
    python -m build --wheel --no-isolation
}

check() {
    cd "${_name}-${pkgver}/python"
    uv run pytest
}

package() {
    cd "${_name}-${pkgver}/python"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 ../LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
